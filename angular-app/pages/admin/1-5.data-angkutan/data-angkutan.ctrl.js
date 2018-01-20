(function() {
	'use strict';

	angular
		.module('app')
		.controller('data-angkutan.ctrl', Controller);

	function Controller($scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		$rootScope.isGrey = false;
		var vm = this;
		var modalInstance;
		vm.listData = [];

		abstractPage.startCtrl().then( activate );
		function activate() {
			vm.search = '';
			dataservice.getAngkutan().then( afterGet );
			function afterGet( results ) {
				vm.listData = results;
			}
		}

		vm.orderBy = '+id';
		vm.toggleSort = toggleSort;
		function toggleSort(value) {
			vm.orderBy = ( vm.orderBy !== ( '+' + value ) ) ? ( '+' + value ) : ( '-' + value );
		}

		vm.openModal = openModal;
		vm.submit = submit;
		vm.remove = remove;
		vm.closeModal = closeModal;

		var modalInstance;
		vm.formValue;
		vm.hasError;
		function openModal( data, templateUrl ) {
			if ( data ) vm.formValue = angular.copy(data);
			else vm.formValue = {};

			modalInstance = $uibModal.open({
				templateUrl: templateUrl,
				size: 'md',
				backdrop: 'static',
				scope: $scope
			});
		}
		function submit() {
			vm.hasError = {};

			if ( !vm.formValue.name ) vm.hasError['name'] = true;
			else if (_.find( vm.listData, function( d ) { return vm.formValue.name === d.name && vm.formValue.id !== d.id; })) vm.hasError['name'] = true;

			if (Object.keys(vm.hasError).length > 0) {
				helper.setFocus(Object.keys(vm.hasError)[0]);
			} else {
				if ( vm.formValue.id ) {
					dataservice.editAngkutan( vm.formValue ).then( closeModal ).then( activate );
				} else {
					dataservice.createAngkutan( vm.formValue ).then( closeModal ).then( activate );
				}
			}
		}
		function remove() {
			dataservice.removeAngkutan(vm.formValue.id).then(closeModal).then(activate);
		}
		function closeModal() {
			if (modalInstance && modalInstance.dismiss) modalInstance.dismiss();
		}
	}

})();