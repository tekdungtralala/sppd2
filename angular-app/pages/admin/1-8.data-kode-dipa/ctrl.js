(function() {
	'use strict';

	angular
		.module('app')
		.controller('data-kode-dipa.ctrl', Controller);

	function Controller($scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
 		$rootScope.isGrey = false;
		var vm = this;
		var currentId;
		vm.listData = [];

		abstractPage.startCtrl().then( activate );
		function activate() {
			vm.search = '';
			dataservice.getDipa().then( afterGetData );
			function afterGetData( results ) {
				vm.listData = results;
				currentId = vm.listData[0].id;
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
			if ( data ) {
				vm.formValue = angular.copy(data);
				vm.formValue.date = moment(vm.formValue.date, 'YYYY-MM-DD').toDate();
			}
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

			if ( !vm.formValue.fiscal_year ) vm.hasError['fiscal_year'] = true;
			if ( !vm.formValue.institution ) vm.hasError['institution'] = true;
			if ( !vm.formValue.organizational_unit ) vm.hasError['organizational_unit'] = true;
			if ( !vm.formValue.city ) vm.hasError['city'] = true;
			if ( !vm.formValue.work_unit ) vm.hasError['work_unit'] = true;
			if ( !vm.formValue.document ) vm.hasError['document'] = true;
			if ( !vm.formValue.code_number ) vm.hasError['code_number'] = true;
			if ( !vm.formValue.date ) vm.hasError['date'] = true;
			if ( !vm.formValue.kppn ) vm.hasError['kppn'] = true;

			if (Object.keys(vm.hasError).length > 0) {
				helper.setFocus(Object.keys(vm.hasError)[0]);
			} else {
				vm.formValue.date = moment(vm.formValue.date).format('YYYY-MM-DD');
				
				if ( vm.formValue.id ) {
					vm.formValue.revisi = parseInt(vm.formValue.revisi) + 1;
					vm.formValue.parent_id = vm.formValue.parent_id;

					var data = { id: vm.formValue.id };
					dataservice.editDipa( data ).then( function() {
						dataservice.createDipa( vm.formValue ).then( closeModal ).then( activate )
					} );
				} else {
					vm.formValue.revisi = 0;
					vm.formValue.parent_id = null
					vm.formValue.active = 1;

					var data = { id: currentId };
					dataservice.editDipa( data ).then( function() {
						dataservice.createDipa( vm.formValue ).then( closeModal ).then( activate )
					} );
				}
			}
		}
		function remove() {
			dataservice.removeDipa(vm.formValue.id).then(closeModal).then(activate);
		}
		function closeModal() {
			if (modalInstance && modalInstance.dismiss) modalInstance.dismiss();
		}
	}

})();
