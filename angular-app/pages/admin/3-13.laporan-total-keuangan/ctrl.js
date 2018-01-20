(function() {
	'use strict';

	angular
		.module('app')
		.controller('laporan-total-keuangan.ctrl', Controller);

	function Controller($q, $scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		var vm = this;
		var startDate, endDate;
		vm.months = [];
		vm.listData = [];
		vm.month;

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
					dataservice.getSPPDOfficer( data.id ).then( afterGetSPPDOfficer );
					data.total = 0;
					function afterGetSPPDOfficer( officers ) {
						_.forEach(officers, function(o) {
							var t = parseInt(o.total_cost);
							data.total = data.total + t;
							o.total = helper.toRp(t);
						});
						data.officers = officers;
						data.totalRp = helper.toRp(data.total);

						vm.total = vm.total + data.total;
						vm.totalRp = helper.toRp(vm.total);
					}
				});
			}
		}

		vm.printReport = printReport;
		function printReport() {
			dataservice.postReportData( vm.listData, startDate, endDate, vm.totalRp ).then( afterPrintReport );
			function afterPrintReport() {
				// window.open('api/print/8-laporan-keuangan.php');
				window.open('api/print/laporan-rekapitulasi-kas.php');
			}
		}
	}

})();