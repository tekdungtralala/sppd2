(function() {
	'use strict';

	angular
		.module('app')
		.controller('laporan-tujuan-sppd.ctrl', Controller);

	function Controller($q, $scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		$rootScope.isGrey = false;
		var vm = this;
		var cities;
		var sppd;
		var provinceLabel = [];
		var provinceValue = [];
		var listData;
		vm.transportType = [];
		vm.listData = [];
		vm.provinces;
		vm.cities;
		vm.formValue = {};
		vm.chartLabel;
		vm.chartValue;
		vm.state = 'PROVINCE'; // PROVINCE / CITY / DETAIL

		abstractPage.startCtrl().then(activate);
		function activate() {
			vm.search = '';

			var promises = [ dataservice.getAllSPPDState6(), dataservice.getProvinsi(), dataservice.getKota(), dataservice.getAngkutan() ];

			$q.all( promises ).then( afterGetAll );
			function afterGetAll( responses ) {
				listData = responses[0];
				_.forEach( listData, function( data ) {
					dataservice.getSPPDOfficer( data.id ).then( afterGetSPPDOfficer );
					function afterGetSPPDOfficer( officers ) {
						data.officers = officers;

						vm.listData = angular.copy(listData)
					}
				});

				sppd = responses[0];
				vm.provinces = responses[1];
				cities = responses[2];
				
				_.forEach( sppd, function( s ) {
					var city = _.find( cities, function( c ) {
						return c.name === s.objective;
					});
					var province = _.find( vm.provinces, function( p ) {
						return p.id === city.province_id;
					})

					var finded = _.find( provinceLabel, function( pl ) {
						return pl === province.name;
					});
					if (finded) {
						var index = _.findIndex(provinceLabel, function(x) { return x === province.name; })
						provinceValue[index]++;
					} else {
						provinceLabel.push(province.name);
						provinceValue.push(1);
					}
				});

				_.forEach( vm.provinces, function( p ) {
					var index = _.findIndex(provinceLabel, function(x) { return x === p.name; });
					var total = provinceValue[index];
					p.total = total;
				});

				vm.transportType = responses[3];
				resetValue();
			}
		}

		var cityLabel;
		vm.provinceChanged = provinceChanged;
		vm.resetValue = resetValue;
		vm.cityChanged = cityChanged;
		vm.transportTypeChanged = transportTypeChanged;
		function provinceChanged() {
			vm.formValue.cityId = null;
			vm.cities = _.filter(cities, function( k ) {
				return k.province_id === vm.formValue.provinceId;
			});
			vm.state = 'CITY';

			cityLabel = _.map(vm.cities, 'name');
			var cityValue = [];
			_.forEach(cityLabel, function(c) {
				cityValue.push(0);
			});
			_.forEach(sppd, function(s) {
				var finded = _.find( cityLabel, function(cl) {
					return cl === s.objective;
				});
				if (finded) {
					var index = _.findIndex(cityLabel, function(x) { return x === s.objective; });
					cityValue[index]++;
				}
			});
			_.forEach(vm.cities, function( city ) {
				var index = _.findIndex(cityLabel, function(x) { return x === city.name; });
				var total = cityValue[index];
				city.total = total;
			})
			vm.chartValue = cityValue;
			vm.chartLabel = cityLabel;

			doFilter();
		}
		function resetValue() {
			vm.formValue = {};
			vm.chartLabel = provinceLabel;
			vm.chartValue = provinceValue;
			vm.state = 'PROVINCE'
			_.forEach(vm.transportType, function(t) {
				t.checkboxValue = false;
			});
			vm.listData = angular.copy(listData);
		}
		function cityChanged() {
			doFilter();
		}
		function transportTypeChanged() {
			doFilter();
		}

		function doFilter() {
			vm.listData = angular.copy(listData);

			if (cityLabel && cityLabel.length > 0) {
				vm.listData = _.filter(vm.listData, function(data) {
					return _.findIndex(cityLabel, function(x) { return x === data.objective; }) >= 0;
				});
			}
			if ( vm.formValue.cityName ) {
				vm.listData = _.filter(vm.listData, function(data) {
					return data.objective == vm.formValue.cityName;
				});
			}

			var ttLabel = _.filter(vm.transportType, function(tt) {
				return tt.checkboxValue === true;
			});
			ttLabel = _.map(ttLabel, 'name');
			if ( ttLabel && ttLabel.length > 0 ) {
				vm.listData = _.filter(vm.listData, function(data) {
					return _.findIndex(ttLabel, function(x) { return x === data.transportation_type; }) >= 0;
				});
			}
		}


		vm.printLembar = printLembar;
		function printLembar(no, id) {
			window.open('print-lembar-' + no + '.php?id=' + id, '_blank');
		}
	}

})();