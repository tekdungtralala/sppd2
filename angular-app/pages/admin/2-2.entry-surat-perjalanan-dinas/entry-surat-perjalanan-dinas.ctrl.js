(function() {
	'use strict';

	angular
		.module('app')
		.controller('entry-surat-perjalanan-dinas.ctrl', Controller);

	function Controller($q, $scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		$rootScope.isGrey = false;
		var vm = this;
		vm.listData = [];
		vm.listTransportType;
		vm.listBudgetType;
		vm.listSubBudget;

		abstractPage.startCtrl().then(activate);
		function activate() {
			vm.search = '';

			var promises = [
				dataservice.getEntrySuratPerjalananDinas(),		// 0
				dataservice.getGolongan(),						// 1
				dataservice.getProvinsi(),						// 2
				dataservice.getKota(),							// 3
				dataservice.getBiayaPerjalananDinas(),			// 4
				dataservice.getPegawai(),						// 5
				dataservice.getJabatan(),						// 6
			];
			$q.all(promises).then(afterGetPromises);
			function afterGetPromises( responses ) {
				var results = responses[0];
				var golongan = responses[1];
				var provinsi = responses[2];
				var kota = responses[3];
				var biaya = responses[4];
				var pegawai = responses[5];
				var jabatan = responses[6];

				// find bendahara
				var bendahara = _.find(pegawai, function(p) {
					return _.find( jabatan, function(j) {
						return j.id === p.office_position_id && j.name === 'Bendahara';
					});
				});

				vm.listData = results;
				_.forEach( vm.listData, function( d ) {
					dataservice.getSPPDOfficer( d.id ).then( afterGetSPPDOfficer );
					function afterGetSPPDOfficer( officers ) {
						d.officers = officers;

						_.forEach( d.officers, function( officer ) {
							officer.treasurer_officer = bendahara.name;
							officer.treasurer_officer_id = bendahara.officer_id;

							var officeClassId = findOfficeClass(officer.office_class_name).id;
							var provinceId = findProvince(d.objective);
							var officeCost = findBiaya(provinceId, officeClassId);
							var totalDay = parseInt(d.total_day);
							
							officer.total_daily_cost = parseInt( officeCost.daily_cost) * (totalDay);
							officer.total_lodging_cost = parseInt( officeCost.lodging_cost) * (totalDay - 1);
							officer.daily_cost = officeCost.daily_cost;
							officer.lodging_cost = officeCost.lodging_cost;

							// console.log( '\n\n' );
							// console.log(totalDay, officeCost)
							// console.log( officer );
							
						});
					}
				});

				function findOfficeClass( className ) {
					return _.find( golongan, function(g) {
						return g.name === className;
					})
				}

				function findProvince( cityName ) {
					var findedKota = _.find(kota, function( k ) {
						return k.name === cityName;
					});
					return findedKota.province_id;
				}

				function findBiaya( provinceId, officeClassId ) {
					return _.find( biaya, function( b ) {
						return b.province_id === provinceId && b.office_class_id === officeClassId;
					});
				}
			}

			dataservice.getMataAnggaran().then( afterGetMataAnggaran );
			function afterGetMataAnggaran( results ) {
				vm.listBudgetType = [];
				_.forEach( results, function( r ) {
					var finded = _.find( vm.listBudgetType, function( f ) {
						return f.name === r.name;
					});

					if ( finded ) {
						finded.subBudgets.push( r. sub_budget );
					} else {
						vm.listBudgetType.push({
							name: r.name,
							subBudgets: [r.sub_budget]
						});
					}
				});
			}

			dataservice.getAngkutan().then( afterGetAnggukatn );
			function afterGetAnggukatn( results ) {
				vm.listTransportType = results;
			}
		}

		vm.openModal = openModal;
		vm.submit = submit;
		vm.remove = remove;
		vm.closeModal = closeModal;
		vm.columnEChanged = columnEChanged;
		// vm.printLembar2 = printLembar2;
		vm.printSPD = printSPD;
		vm.processToBiayaPerjalanan = processToBiayaPerjalanan;
		var modalInstance;
		vm.formValue;
		vm.hasError;
		function openModal( data, templateUrl, size ) {
			vm.hasError = {};

			if ( data ) {
				vm.formValue = angular.copy(data);
				_.forEach( vm.formValue.officers, function( p ) {
					// p.nameTemp = p.reference_number + ', ' + p.name + ' / ' + p.officer_id + ' / ' + p.office_class_name + ' / ' + p.office_position_name ;
					p.nameTemp = p.reference_number + ' / ' + p.name ;
				});
				vm.formValue.totalDayTemp = vm.formValue.total_day + ' hari';
				columnEChanged();

				vm.formValue.showPrintBtn = vm.formValue.column_e && vm.formValue.column_f && vm.formValue.transportation_type;
			} else vm.formValue = {};

			modalInstance = $uibModal.open({
				templateUrl: templateUrl,
				size: size ? size : 'md',
				backdrop: 'static',
				scope: $scope
			});
		}
		function submit() {
			vm.hasError = {};

			if ( !vm.formValue.transportation_type ) vm.hasError['transportation_type'] = true;
			if ( !vm.formValue.column_e ) vm.hasError['column_e'] = true;
			if ( !vm.formValue.column_f ) vm.hasError['column_f'] = true;

			if (Object.keys(vm.hasError).length > 0) {
				helper.setFocus(Object.keys(vm.hasError)[0]);
			} else {
				var promises = [];
				_.forEach(vm.formValue.officers, function( o ) {
					var data = {
						id: o.id,
						treasurer_officer: o.treasurer_officer,
						treasurer_officer_id: o.treasurer_officer_id,
						daily_cost: o.daily_cost,
						lodging_cost: o.lodging_cost,
						total_daily_cost: o.total_daily_cost,
						total_lodging_cost: o.total_lodging_cost
					};

					promises.push(dataservice.updateSPPDOfficerBiaya(data))
				});

				var data = {
					id: vm.formValue.id,
					transportation_type: vm.formValue.transportation_type,
					column_e: vm.formValue.column_e,
					column_f: vm.formValue.column_f
				};
				promises.push(dataservice.updateSPD( data ));
				$q.all(promises).then( closeModal ).then( activate );
			}
		}
		function remove() {
			dataservice.removeSPPD(vm.formValue.id).then(closeModal).then(activate);
		}
		function closeModal() {
			if (modalInstance && modalInstance.dismiss) modalInstance.dismiss();
		}
		function columnEChanged() {
			var budget = _.find( vm.listBudgetType , function( b ) {
				return vm.formValue.column_e === b.name;
			});
			if ( budget ) {
				vm.listSubBudget = budget.subBudgets;
				vm.formValue.showColumnF = true;
			}
		}
		function printSPD( data ) {
			window.open('print-spd.php?id=' + data.id, '_blank');
		}
		function processToBiayaPerjalanan() {
			dataservice.continueToInputBiaya( vm.formValue.id ).then( closeModal ).then( activate );
		}
	}

})();