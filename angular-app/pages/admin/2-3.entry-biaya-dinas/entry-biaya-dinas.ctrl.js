(function() {
	'use strict';

	angular
		.module('app')
		.controller('entry-biaya-dinas.ctrl', Controller);

	function Controller($q, $scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		$rootScope.isGrey = false;
		var vm = this;
		vm.listData = [];

		abstractPage.startCtrl().then(activate);
		function activate() {
			vm.search = '';

			var promises = [
				dataservice.getEntryBiayaSPD(),
				dataservice.getMaxIdofSPPD()
			];

			$q.all( promises ).then( afterGetAll );
			function afterGetAll( responses ) {
				vm.listData = responses[0];
				_.forEach( vm.listData, function( data ) {
					dataservice.getSPPDOfficer( data.id ).then( afterGetSPPDOfficer );
					function afterGetSPPDOfficer( officers ) {
						data.officers = officers;
						_.forEach( data.officers, function( d ) {
							if ( d.transportation_cost ) d.transportCostRP = helper.toRp( d.transportation_cost );
							if ( d.total_cost ) d.totalCostRP = helper.toRp( d.total_cost );

							try {
								if ( !data.transport ) data.transport = parseInt( d.transportation_cost );
							} catch (err) {}
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
		vm.transportCostChanged = transportCostChanged;
		// vm.printLembar3 = printLembar3;
		vm.printRincian = printRincian;
		vm.processToBuktiKas = processToBuktiKas;
		var modalInstance;
		vm.formValue;
		vm.hasError;
		function openModal( data, templateUrl, size, windowClass ) {
			vm.hasError = {};
			if ( data ) {
				vm.formValue = angular.copy(data);
				_.forEach( vm.formValue.officers, function( o ) {
					o.total_daily_costRP = helper.toRp( o.total_daily_cost );
					o.total_lodging_costRP = helper.toRp( o.total_lodging_cost );
				});
				if ( vm.formValue.transport ) vm.transportCostChanged();
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

			if ( !vm.formValue.transport ) vm.hasError['transport'] = true;
			else if ( vm.formValue.transport < 0 ) vm.hasError['transport'] = true;

			if ( Object.keys(vm.hasError).length > 0 ) {
			} else {
				var promises = [];
				_.forEach( vm.formValue.officers, function( o ) {
					var data = {
						id: o.id,
						transportation_cost: vm.formValue.transport,
						total_cost: o.total_cost,
						total_cost_rp: terbilang(o.total_cost) + " Rupiah"
					};
					promises.push( dataservice.updateSPPDOfficerTotal( data ) );
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
		function transportCostChanged() {
			_.forEach( vm.formValue.officers, function( o ) {
				o.total_cost = parseInt(o.total_daily_cost) + parseInt(o.total_lodging_cost) + parseInt(vm.formValue.transport);
				o.total_costRP = helper.toRp( o.total_cost );
			})
		}
		function printRincian( data ) {
			window.open('print-rincian_biaya.php?id=' + data.id, '_blank');
		}
		function processToBuktiKas() {
			dataservice.continueToBuktiKas( vm.formValue.id, (new moment()).format('YYYY-MM-DD') ).then( closeModal ).then( activate );
		}
	}

})();
