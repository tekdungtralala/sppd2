(function() {
	'use strict';

	angular
		.module('app')
		.controller('laporan-status-anggaran.ctrl', Controller);

	function Controller($q, $scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		$rootScope.isGrey = false;
		var vm = this;
		vm.listData = [];

		abstractPage.startCtrl().then(activate);
		function activate(startDate, endDate) {
			if (!startDate) vm.startDate = null;
			if (!endDate) vm.endDate = null;
			vm.search = '';

			var promises = [ dataservice.getAllSPPDState6( startDate, endDate ) ];
			$q.all( promises ).then( afterGetAll );
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
						data.total = helper.toRp(data.total);
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
				// window.open('api/print/5-status-anggaran.php');
				window.open('api/print/laporan-kode-kegiatan.php');
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