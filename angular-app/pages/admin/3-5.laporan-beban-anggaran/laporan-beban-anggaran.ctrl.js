(function() {
	'use strict';

	angular
		.module('app')
		.controller('laporan-beban-anggaran.ctrl', Controller);

	function Controller($q, $scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		$rootScope.isGrey = false;
		var vm = this;
		var listData = [];
		vm.columnE = [];
		vm.columnF = [];
		vm.formValue = {
			columnE: null
		};
		var chartValue;
		var chartLabel;
		vm.chartValue = [];
		vm.chartLabel = [];
		vm.state = 0;

		abstractPage.startCtrl().then(activate);
		function activate() {
			vm.search = '';

			var promises = [ dataservice.getAllSPPDState6(), dataservice.getMataAnggaran() ];
			$q.all( promises ).then( afterGetAll );
			function afterGetAll( responses ) {
				listData = responses[0];
				_.forEach( listData, function( data ) {
					dataservice.getSPPDOfficer( data.id ).then( afterGetSPPDOfficer );
					function afterGetSPPDOfficer( officers ) {
						data.officers = officers;
						_.forEach( officers, function( o ) {
							if (!data.ccc) data.ccc = o.kas_cost_center_code;
						})
						afterGetOfficer();
					}
				});

				var totalData = listData.length;
				function afterGetOfficer() {
					totalData--;
					if ( totalData == 0 ) {

						_.forEach(responses[1], function(data) {
							var finded = _.find( vm.columnE, function( e ) {
								return e.name === data.name;
							});
							if ( !finded ) {
								vm.columnE.push({
									total: 0,
									name: data.name,
									childs: [ {
										name: data.sub_budget,
										total: 0
									} ]
								});
							} else {
								finded.childs.push({
									name: data.sub_budget,
									total: 0
								});
							}
						});

						_.forEach(listData, function( ld, index ) {
							var cE = _.find(vm.columnE, function( data ) {
								return data.name === ld.column_e;
							});
							cE.total++;
							var cF = _.find(cE.childs, function( data ) {
								return data.name === ld.column_f;
							});
							cF.total++;
						});

						resetValue();

					}
				}
			}
		}

		vm.columnEChanged = columnEChanged;
		vm.columnFChanged = columnFChanged;
		vm.resetValue = resetValue;
		vm.cccChanged = cccChanged;
		function columnEChanged() {
			var cE = JSON.parse(vm.formValue.columnE);
			vm.columnF = cE.childs;

			vm.chartValue = [];
			vm.chartLabel = [];
			_.forEach(vm.columnF, function( f ) {
				vm.chartValue.push(f.total);
				vm.chartLabel.push(f.name);
			});
			vm.state = 1;

			doFilter();
		}
		function columnFChanged() {
			var cF = JSON.parse(vm.formValue.columnF);

			vm.listData = _.filter( listData, function( data ) {
				return data.column_f == cF.name; 
			});
		}
		function resetValue() {
			vm.chartValue = [];
			vm.chartLabel = [];
			_.forEach(vm.columnE, function( e ) {
				vm.chartLabel.push(e.name);
				vm.chartValue.push(e.total);
			});
			vm.formValue.columnE = null;
			vm.formValue.columnF = null;
			vm.state = 0;
			vm.listData = listData;
			vm.ccc = null;
		}
		function cccChanged() {
			doFilter();
		}

		function doFilter() {
			vm.listData = angular.copy( listData );

			if ( vm.formValue.columnE ) {
				var cE = JSON.parse( vm.formValue.columnE );
				vm.listData = _.filter( vm.listData, function( data ) {
					return data.column_e == cE.name;
				});
			}
			if ( vm.ccc ) {
				vm.listData = _.filter(vm.listData, function( data ) {
					return vm.ccc == data.ccc;
				});
			}
		}


		vm.printLembar = printLembar;
		function printLembar(no, id) {
			window.open('print-lembar-' + no + '.php?id=' + id, '_blank');
		}
	}

})();
