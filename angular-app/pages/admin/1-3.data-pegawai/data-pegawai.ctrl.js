(function() {
	'use strict';

	angular
		.module('app')
		.controller('data-pegawai.ctrl', Controller);

	function Controller($scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		$rootScope.isGrey = false;

		var vm = this;

		vm.listJabatan;
		vm.listGolongan;
		vm.listData;

		abstractPage.startCtrl().then(activate);
		function activate() {
			vm.search = '';
			dataservice.getGolongan().then(  afterGetGolongan );
			function afterGetGolongan( results ) {
				vm.listGolongan = results;
				dataservice.getJabatan().then(  afterGetJabatan );
			}

			function afterGetJabatan( results ) {
				vm.listJabatan = results;
				dataservice.getPegawai().then( afterGetPegawai );
			}

			function afterGetPegawai( results ) {
				_.forEach(results, function( r ) {
					r.office_position = _.find(vm.listJabatan, function( g ) { return g.id === r.office_position_id; });
					r.office_class = _.find(vm.listGolongan, function( g ) { return g.id === r.office_class_id; });
				});

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

			if ( !vm.formValue.officer_id ) vm.hasError['officer_id'] = true;
			if ( !vm.formValue.phone_number ) vm.hasError['phone_number'] = true;

			if (Object.keys(vm.hasError).length > 0) {
				helper.setFocus(Object.keys(vm.hasError)[0]);
			} else {
				if ( vm.formValue.id ) {
					dataservice.editPegawai( vm.formValue ).then( closeModal ).then( activate );
				} else {
					dataservice.createPegawai( vm.formValue ).then( closeModal ).then( activate );
				}
			}
		}
		function remove() {
			dataservice.removePegawai(vm.formValue.id).then(closeModal).then(activate);
		}
		function closeModal() {
			if (modalInstance && modalInstance.dismiss) modalInstance.dismiss();
		}
	}

})();