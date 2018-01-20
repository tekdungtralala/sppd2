(function() {
	'use strict';

	angular
		.module('app')
		.controller('data-biaya-perjalanan-dinas.ctrl', Controller);

	function Controller($scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		$rootScope.isGrey = false;
		var vm = this;
		vm.listData = [];

		abstractPage.startCtrl().then( activate );
		function activate() {
			vm.search = '';
			var listTravelCost = [];
			var listProvince = [];
			var listOfficeClass = [];

			dataservice.getBiayaPerjalananDinas().then( afterGetCost );
			function afterGetCost( results ) {
				listTravelCost = results;
				dataservice.getProvinsi().then( afterGetProvince );
			}

			function afterGetProvince( results ) {
				listProvince = results;
				dataservice.getGolongan().then( afterGetOfficeClass );
			}

			function afterGetOfficeClass( results ) {
				listOfficeClass = results;

				vm.listData = [];
				_.forEach( listProvince, function( p ) {
					_.forEach( listOfficeClass, function( o ) {
						var data = {
							office_class_id: o.id,
							province_id: p.id,
							provinceName: p.name,
							officeClassName: o.name
						};

						var finded = _.find( listTravelCost, function( t ) {
							return t.office_class_id === o.id && t.province_id === p.id;
						})

						if ( finded ) {
							data.id = finded.id;
							data.daily_cost = finded.daily_cost;
							data.lodging_cost = finded.lodging_cost;

							data.tcRp = helper.toRp( data.daily_cost );
							data.lcRp = helper.toRp( data.lodging_cost );
						}
						
						vm.listData.push(data);
					});
				});
			}
		}

		vm.orderBy = '+provinceName';
		vm.toggleSort = toggleSort;
		function toggleSort(value) {
			vm.orderBy = ( vm.orderBy !== ( '+' + value ) ) ? ( '+' + value ) : ( '-' + value );
		}

		vm.editCost = editCost;
		vm.cancelEdit = cancelEdit;
		vm.saveCost = saveCost;
		function editCost( data ) {
			_.forEach( vm.listData, function( d ) {
				d.editMode = false;
			});
			data.editMode = true;
			data.tCost = parseInt(data.daily_cost);
			data.lCost = parseInt(data.lodging_cost);
		}
		function cancelEdit( data ) {
			data.editMode = false;
		}
		function saveCost( data ) {
			data.daily_cost = data.tCost;
			data.lodging_cost = data.lCost;

			if ( data .id ) {
				dataservice.editBiayaPerjalananDinas( data ).then( activate );
			} else {
				dataservice.createBiayaPerjalananDinas( data ).then( activate );
			}
		}
	}

})();
