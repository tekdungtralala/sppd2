(function() {
	'use strict';

	angular
		.module('app')
		.controller('laporan-status-sppd.ctrl', Controller);

	function Controller($q, $scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		$rootScope.isGrey = false;
		var vm = this;
		vm.listData = [];

		vm.labels = ['Input Surat Tugas', 'Input SPD', 'Input Biaya Dinas', 'Input Bukti Kas', 'Input Hasil Dinas'];
		vm.data = [0, 0, 0, 0, 0];
		vm.completed = 0;

		abstractPage.startCtrl().then(activate);
		function activate() {
			vm.search = '';

			var promises = [ dataservice.getAllSPPD(), dataservice.getAllSPPDState6() ];
			$q.all( promises ).then( afterGetAll );
			function afterGetAll( responses ) {
				var data = responses[0];
				_.forEach(data, function( d ) {
					vm.data[ d.state - 1 ]++;
				});

				vm.completed = responses[1].length;
			}
		}
	}

})();