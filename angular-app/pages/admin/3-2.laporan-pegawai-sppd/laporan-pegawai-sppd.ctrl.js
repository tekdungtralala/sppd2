(function() {
	'use strict';

	angular
		.module('app')
		.controller('laporan-pegawai-sppd.ctrl', Controller);

	function Controller($q, $scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		$rootScope.isGrey = false;
		var vm = this;
		vm.listSppd = [];
		vm.listData = [];
		vm.data = [];
		vm.labels = [];

		abstractPage.startCtrl().then(activate);
		function activate(startDate, endDate) {
			vm.search = '';
			var promises = [ dataservice.getAllSPPDState6(), dataservice.getAllSPPDOfficer() ];

			$q.all( promises ).then( afterGetAll );
			function afterGetAll( responses ) {
				vm.listSppd = angular.copy(responses[0]);
				_.forEach(responses[1], function( o ) {
					var s = _.find(vm.listSppd, function( s ) {
						return o.sppd_id === s.id;
					});
					if (s.officers) {
						s.officers.push(o);
					} else {
						s.officers = [o];
					}
				});

				var sppd = responses[0];
				var officer = responses[1];

				_.forEach(officer, function( o ) {
					o.totalCostRp = helper.toRp(o.total_cost);
					var finded = findData( o.name );
					if ( finded ) {
						finded.list.push(o);
					} else {
						vm.listData.push({
							name: o.name,
							list: [o]
						});
					}
				});

				_.forEach(vm.listData, function( o ) {
					var list = o.list;
					_.forEach(o.list, function( sppdOfficer, i ) {
						sppdOfficer.sppd = findSPPD(sppdOfficer.sppd_id);
						sppdOfficer.anyIndex = i;
					});

					vm.data.push(o.list.length);
					vm.labels.push(o.name);
				});

				// console.log(sppd)
				function findSPPD( id ) {
					return _.find( sppd, function( s ) {
						return s.id === id;
					})
				}
			}

			function findData( name ) {
				return _.find( vm.listData, function( d ) {
					return d.name == name;
				})
			}
		}


		vm.orderBy = '+id';
		vm.toggleSort = toggleSort;
		function toggleSort(value) {
			vm.orderBy = ( vm.orderBy !== ( '+' + value ) ) ? ( '+' + value ) : ( '-' + value );
		}


		vm.printLembar = printLembar;
		function printLembar(no, id) {
			window.open('print-lembar-' + no + '.php?id=' + id, '_blank');
		}


		var modalInstance;
		vm.formValue;
		vm.openModal = openModal;
		vm.closeModal = closeModal;
		function openModal( data, templateUrl ) {
			vm.formValue = data;
			modalInstance = $uibModal.open({
				templateUrl: templateUrl,
				size: 'lg',
				backdrop: 'static',
				scope: $scope,
				windowClass: 'large-window-class'
			});
		}
		function closeModal() {
			if (modalInstance && modalInstance.dismiss) modalInstance.dismiss();
		}

	}

})();