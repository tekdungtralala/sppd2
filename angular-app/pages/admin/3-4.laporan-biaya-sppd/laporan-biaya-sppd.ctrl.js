(function() {
	'use strict';

	angular
		.module('app')
		.controller('laporan-biaya-sppd.ctrl', Controller);

	function Controller($q, $scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		$rootScope.isGrey = false;
		var vm = this;
		vm.listData = [];
		vm.periode = 'LAST_WEEK';

		vm.labels = [ 'Total', 'Uang Harian', 'Uang Penginapan', 'Transportation' ];
		vm.data = [];

		abstractPage.startCtrl().then(function() {
			changePeriode('LAST_WEEK')
		});
		function activate(startDate) {
			vm.search = '';
			var endDate = startDate ? moment().format('YYYY-MM-DD') : null;
			var promises = [ dataservice.getAllSPPDState6( startDate, endDate ) ];
			$q.all( promises ).then( afterGetAll );
			function afterGetAll( responses ) {
				vm.listData = responses[0];
				var total = vm.listData.length;
				_.forEach( vm.listData, function( data ) {
					dataservice.getSPPDOfficer( data.id ).then( afterGetSPPDOfficer );
					function afterGetSPPDOfficer( officers ) {
						data.officers = officers;
						checkAllOfficer();
					}
				});
				
				function checkAllOfficer() {
					total--;
					if ( total == 0 ) {
						var totalCost = 0;
						var totalDailyCost = 0;
						var totalLodgingCost = 0;
						var totalTransportCost = 0;
						_.forEach( vm.listData, function( data ) {

							vm.data = [];
							_.forEach( data.officers, function( o ) {
								totalCost = totalCost + parseInt(o.total_cost);
								totalDailyCost = totalDailyCost + parseInt(o.total_daily_cost);
								totalLodgingCost = totalLodgingCost + parseInt(o.total_lodging_cost);
								totalTransportCost = totalTransportCost + parseInt(o.transportation_cost);
							});
						});
						vm.data = [ totalCost, totalDailyCost, totalLodgingCost, totalTransportCost ];

						vm.totalCostRp = helper.toRp(totalCost);
						vm.totalDailyCostRp = helper.toRp(totalDailyCost);
						vm.totalLodgingCostRp = helper.toRp(totalLodgingCost);
						vm.totalTransportCostRp = helper.toRp(totalTransportCost);
					}
				}
			}
		}


		vm.printLembar = printLembar;
		function printLembar(no, id) {
			window.open('print-lembar-' + no + '.php?id=' + id, '_blank');
		}


		vm.endDateOpt = {};
		vm.changePeriode = changePeriode;
		function changePeriode( p ) {
			vm.periode = p;

			if ( p === 'LAST_WEEK' ) activate( moment(new Date()).subtract(7, 'days').format('YYYY-MM-DD') );
			else if ( p === 'LAST_MONTH' ) activate( moment(new Date()).subtract(1, 'months').format('YYYY-MM-DD') );
			else if ( p === 'LAST_3_MONTH' ) activate( moment(new Date()).subtract(3, 'months').format('YYYY-MM-DD') );
			else if ( p === 'LAST_6_MONTH' ) activate( moment(new Date()).subtract(0.5, 'years').format('YYYY-MM-DD') );
			else if ( p === 'LAST_YEAR' ) activate( moment(new Date()).subtract(1, 'years').format('YYYY-MM-DD') );
			else if ( p === 'ALL' ) activate(null);
		}
	}

})();