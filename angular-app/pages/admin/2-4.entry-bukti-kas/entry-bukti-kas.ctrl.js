(function() {
	'use strict';

	angular
		.module('app')
		.controller('entry-bukti-kas.ctrl', Controller);

	function Controller($q, $scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		$rootScope.isGrey = false;
		var vm = this;
		vm.listData = [];
		vm.codes = ['DIPA', 'Non DIPA'];

		abstractPage.startCtrl().then(activate);
		function activate() {
			vm.search = '';

			var promises = [
				dataservice.getEntryKas()
			];

			$q.all( promises ).then( afterGetAll );
			function afterGetAll( responses ) {
				vm.listData = responses[0];
				_.forEach( vm.listData, function( data ) {
					dataservice.getSPPDOfficer( data.id ).then( afterGetSPPDOfficer );
					function afterGetSPPDOfficer( officers ) {
						data.officers = officers;

						_.forEach( data.officers, function( o ) {
							if ( !data.kasCode ) data.kasCode = o.kas_cost_center_code;
							if ( !data.kasDescription ) data.kasDescription = o.kas_description;
						});
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
		// vm.printLembar4 = printLembar4;
		vm.printBuktiKas = printBuktiKas;
		vm.processToHasilDinas = processToHasilDinas;
		var modalInstance;
		vm.formValue;
		vm.hasError;
		function openModal( data, templateUrl, size, windowClass ) {
			if ( data ) {
				vm.formValue = angular.copy(data);
				_.forEach( vm.formValue.officers, function( o ) {
					o.totalCostRP = helper.toRp( o.total_cost );

					if ( !vm.formValue.committed_officer ) vm.formValue.committed_officer = o.committed_officer;
					if ( !vm.formValue.treasurer_officer ) vm.formValue.treasurer_officer = o.treasurer_officer;
				});
			} else vm.formValue = {};

			var modalInstanceData = {
				templateUrl: templateUrl,
				size: size ? size : 'md',
				backdrop: 'static',
				scope: $scope
			};
			if ( windowClass ) modalInstanceData.windowClass = windowClass;

			modalInstance = $uibModal.open( modalInstanceData );
		}
		function submit() {
			vm.hasError = {};

			if ( !vm.formValue.kasCode ) vm.hasError['kasCode'] = true;
			if ( !vm.formValue.kasDescription ) vm.hasError['kasDescription'] = true;

			if (Object.keys(vm.hasError).length > 0) {
				helper.setFocus(Object.keys(vm.hasError)[0]);
			} else {
				var promises = [];

				_.forEach( vm.formValue.officers, function( o ) {
					var data = {
						id: o.id,
						kas_cost_center_code: vm.formValue.kasCode,
						kas_description: vm.formValue.kasDescription
					};
					promises.push( dataservice.updateSPPDOfficerKas(data) );
				});

				$q.all( promises ).then( closeModal ).then( activate );
			}
		}
		function remove() {
			dataservice.removeSPPD( vm.formValue.id ).then( closeModal ).then( activate );
		}
		function closeModal() {
			if (modalInstance && modalInstance.dismiss) modalInstance.dismiss();
		}
		function printBuktiKas( data ) {
			window.open('print-bukti-kas.php?id=' + data.id, '_blank');
		}
		function processToHasilDinas() {
			dataservice.continueToInputHasil( vm.formValue.id ).then( closeModal ).then( activate );
		}
	}

})();
