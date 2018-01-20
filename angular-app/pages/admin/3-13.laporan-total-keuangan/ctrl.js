(function() {
	'use strict';

	angular
		.module('app')
		.controller('laporan-total-keuangan.ctrl', Controller);

	function Controller($q, $scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		var vm = this;
		var startDate, endDate;
		var dipaCodeId;
		vm.months = [];
		vm.listData = [];
		vm.month;
		vm.totalDaily;

		activate();
		function activate() {
			var d = moment();
			var currentMonth = d.get('month');
			var currentYear = d.get('year');
			currentMonth++;
			for ( var i = 0; i < 12; i++ ) {
				vm.months.push({
					id: currentMonth,
					year: currentYear,
					name: moment( currentMonth,'MM' ).format( 'MMMM' )
				});
				currentMonth--;
				if (currentMonth <= 0) {
					currentMonth = 12;
					currentYear--;
				}
			}
		}

		vm.monthChanged = function () {}

		vm.submitSearch = function () {
			var totalDaily = 0;
			var month = JSON.parse(vm.month);
			var val = month.year + '-' + month.id;
			var m = moment( val, 'YYYY-MM' );

			startDate = m.format('YYYY-MM-DD');
			endDate = m.endOf('month').format('YYYY-MM-DD');

			var promises = [ dataservice.getAllSPPDState6( startDate, endDate ) ];
			$q.all( promises ).then( afterGetAll );
			vm.total = 0;
			vm.totalRp = null;
			function afterGetAll( responses ) {
				vm.listData = responses[0];
				_.forEach( vm.listData, function( data ) {
					dipaCodeId = data.dipa_code_id;
					dataservice.getSPPDOfficer( data.id ).then( afterGetSPPDOfficer );
					data.total = 0;
					function afterGetSPPDOfficer( officers ) {
						var totalDailyO = 0;
						_.forEach(officers, function(o) {
							var t = parseInt(o.total_cost);
							data.total = data.total + t;
							o.total = helper.toRp(t);

							totalDaily = parseInt(totalDaily) + parseInt(o.total_daily_cost);
							vm.totalDaily = helper.toRp(totalDaily);

							totalDailyO = totalDailyO + parseInt(o.total_daily_cost);
						});
						data.officers = officers;
						data.totalRp = helper.toRp(data.total);
						data.totalDailyO = helper.toRp(totalDailyO);

						vm.total = vm.total + data.total;
						vm.totalRp = helper.toRp(vm.total);
					}
				});
			}
		}

		vm.printReport = printReport;
		function printReport() {
			dataservice.postReportData( vm.listData, startDate, endDate, vm.totalDaily, dipaCodeId).then( afterPrintReport );
			function afterPrintReport() {
				// window.open('api/print/8-laporan-keuangan.php');
				window.open('api/print/laporan-rekapitulasi-kas.php');
			}
		}
	}

})();