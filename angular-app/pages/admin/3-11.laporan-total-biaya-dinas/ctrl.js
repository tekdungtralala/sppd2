(function() {
	'use strict';

	angular
		.module('app')
		.controller('laporan-total-biaya-dinas.ctrl', Controller);

	function Controller($q, $scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		$rootScope.isGrey = false;
		var vm = this;
		vm.listData = [];
		vm.total_cost = '';

		abstractPage.startCtrl().then(activate);
		function activate(startDate, endDate) {
			vm.total_cost = '';
			if (!startDate) vm.startDate = null;
			if (!endDate) vm.endDate = null;
			vm.search = '';

			var promises = [ dataservice.getAllSPPDState6( startDate, endDate ) ];
			$q.all( promises ).then( afterGetAll );
			function afterGetAll( responses ) {
				vm.listData = responses[0];
				var total = 0; 
				_.forEach( vm.listData, function( data ) {
					dataservice.getSPPDOfficer( data.id ).then( afterGetSPPDOfficer );
					function afterGetSPPDOfficer( officers ) {
						var total_cost = 0;
						_.forEach( officers, function( o ) {
							total_cost = total_cost + parseInt(o.total_cost);
							o.total_cost_default = o.total_cost;
							o.total_cost = helper.toRp(o.total_cost);
						});
						data.officers = officers;
						data.total_cost = helper.toRp(total_cost);
						total = total + total_cost;
						vm.total_cost = helper.toRp(total);
					}
				});
			}
		}

		vm.printReport = printReport;
		function printReport() {
			var sd, ed;
			if ( vm.startDate && vm.endDate ) { sd = moment(vm.startDate).format('YYYY-MM-DD'); ed = moment(vm.endDate).format('YYYY-MM-DD'); }
			dataservice.postReportData( vm.listData, sd, ed ).then( afterPrintReport );
			function afterPrintReport() {
				// window.open('api/print/6-biaya-dinas.php');
				window.open('api/print/laporan-biaya-dinas.php');
			}
		}

		vm.printLembar = printLembar;
		function printLembar(no, id) {
			window.open('print-lembar-' + no + '.php?id=' + id, '_blank');
		}


		vm.startDate;
		vm.endDate;
		vm.endDateOpt = {};
		vm.startDateChanged = startDateChanged;
		vm.submitSearch = submitSearch;
		vm.resetSearch = resetSearch;
		function startDateChanged() {
			vm.endDateOpt.minDate = vm.startDate;
		}
		function submitSearch() {
			if ( vm.startDate && vm.endDate ) activate(moment(vm.startDate).format('YYYY-MM-DD'), moment(vm.endDate).format('YYYY-MM-DD'));
		}
		function resetSearch() {
			activate();
		}
	}

})();