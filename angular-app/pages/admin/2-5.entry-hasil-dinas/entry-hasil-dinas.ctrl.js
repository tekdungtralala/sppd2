(function() {
	'use strict';

	angular
		.module('app')
		.controller('entry-hasil-dinas.ctrl', Controller);

	function Controller($q, $scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		$rootScope.isGrey = false;
		var vm = this;
		vm.listData = [];

		abstractPage.startCtrl().then(activate);
		function activate() {
			vm.search = '';

			var promises = [ dataservice.getEntryHasil() ];
			$q.all( promises ).then( afterGetAll );
			function afterGetAll( responses ) {
				vm.listData = responses[0];
				_.forEach( vm.listData, function( data ) {
					data.report_title = data.task;
					dataservice.getSPPDOfficer( data.id ).then( afterGetSPPDOfficer );
					function afterGetSPPDOfficer( officers ) {
						data.officers = officers;
					}
				});
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
		// vm.printLembar5 = printLembar5;
		vm.printHasilDinas = printHasilDinas;
		vm.closeTheReport = closeTheReport;
		var modalInstance;
		vm.formValue;
		vm.hasError;
		function openModal( data, templateUrl ) {
			if ( data ) {
				vm.formValue = angular.copy(data);
				vm.formValue.reportTitle = vm.formValue.report_title;
				vm.formValue.reportContent = vm.formValue.report_content;
				vm.formValue.reportCreatedDate = moment(vm.formValue.report_created_date, 'YYYY-MM-DD').toDate();
			} else vm.formValue = {};

			modalInstance = $uibModal.open({
				templateUrl: templateUrl,
				size: 'md',
				backdrop: 'static',
				scope: $scope
			});
		}
		function submit() {
			vm.hasError = {};

			if ( !vm.formValue.reportTitle ) vm.hasError['reportTitle'] = true;
			if ( !vm.formValue.reportCreatedDate ) vm.hasError['reportCreatedDate'] = true;
			if ( !vm.formValue.reportContent ) vm.hasError['reportContent'] = true;

			if (Object.keys(vm.hasError).length > 0) {
				helper.setFocus(Object.keys(vm.hasError)[0]);
			} else {
				var data = {
					id: vm.formValue.id,
					report_created_date: moment(vm.formValue.reportCreatedDate).format('YYYY-MM-DD'),
					report_content: vm.formValue.reportContent,
					report_title: vm.formValue.reportTitle
				};
				dataservice.updateSPPDHasil( data ).then( closeModal ).then( activate );
			}
		}
		function remove() {
			dataservice.removeSPPD( vm.formValue.id ).then( closeModal ).then( activate );
		}
		function closeModal() {
			if (modalInstance && modalInstance.dismiss) modalInstance.dismiss();
		}
		function printHasilDinas( data ) {
			window.open('print-hasil-dinas.php?id=' + data.id, '_blank');
		}
		function closeTheReport() {
			dataservice.closeTheReport( vm.formValue.id ).then( closeModal ).then( activate );
		}
	}

})();
