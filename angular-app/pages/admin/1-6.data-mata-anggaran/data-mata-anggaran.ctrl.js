(function() {
	'use strict';

	angular
		.module('app')
		.controller('data-mata-anggaran.ctrl', Controller);

	function Controller($scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		$rootScope.isGrey = false;
		var vm = this;
		var modalInstance;
		vm.listData = [];

		abstractPage.startCtrl().then( activate );
		function activate() {
			vm.search = '';
			vm.listData = [];
			dataservice.getMataAnggaran().then( afterGet );
			function afterGet( results ) {
				_.forEach( results, function( r ) {

					var finded = _.find( vm.listData, function( data ) { 
						return data.name === r.name; 
					});

					if ( !finded ) {
						vm.listData.push({
							name: r.name,
							subBudgets: [ r.sub_budget ]
						});
					} else {
						finded.subBudgets.push(r.sub_budget);
					}
				});
			}
		}

		vm.orderBy = '+name';
		vm.toggleSort = toggleSort;
		function toggleSort(value) {
			vm.orderBy = ( vm.orderBy !== ( '+' + value ) ) ? ( '+' + value ) : ( '-' + value );
		}

		vm.openModal = openModal;
		vm.submit = submit;
		vm.remove = remove;
		vm.closeModal = closeModal;
		vm.reActivate = reActivate;
		vm.removeSubBudget = removeSubBudget;
		vm.saveNewSubBudget = saveNewSubBudget;
		vm.formValue;
		vm.hasError;
		function openModal( data, templateUrl ) {
			if ( data ) {
				vm.formValue = {
					name: data.name,
					old_name: data.name,
					subBudgets: data.subBudgets
				};
			} else {
				vm.formValue = {newData: true};
			}

			vm.subBudgetName = null;
			vm.hasError = {};
			modalInstance = $uibModal.open({
				templateUrl: templateUrl,
				size: 'md',
				backdrop: 'static',
				scope: $scope
			});
		}
		function submit() {
			vm.hasError = {};

			if ( !vm.formValue.name )
				 vm.hasError['name'] = true;
			else {
				var main = _.find( vm.listData, function( d ) {
					return vm.formValue.name === d.name;
				});
				if ( main ) {
					var sub = _.find( main.subBudgets, function( s ) {
						return s === vm.formValue.sub_budget;
					});
					if ( sub ) vm.hasError['sub_budget'] = true;
				}
			}

			if (Object.keys(vm.hasError).length > 0) {
				helper.setFocus(Object.keys(vm.hasError)[0]);
			} else {
				if ( !vm.formValue.newData ) {
					dataservice.editMataAnggaran( vm.formValue ).then( closeModal ).then( activate );
				} else {
					dataservice.createMataAnggaran( vm.formValue ).then( closeModal ).then( activate );
				}
			}
		}
		function remove() {
			dataservice.removeMataAnggaranByName(vm.formValue.name).then(closeModal).then( activate );
		}
		function closeModal() {
			if (modalInstance && modalInstance.dismiss) modalInstance.dismiss();
		}
		function reActivate() {
			activate();
		}
		function removeSubBudget( name ) {
			dataservice.removeMataAnggaranByNameAndSub(vm.formValue.name, name).then( afterRemove );
			function afterRemove() {
				_.remove( vm.formValue.subBudgets, function( b ) {
					return b === name;
				});
			}
		}
		function saveNewSubBudget() {
			vm.hasError = {};
			if ( !vm.subBudgetName )vm.hasError['subBudgetName'] = true;
			else if (_.find( vm.formValue.subBudgets , function( b ) { return b === vm.subBudgetName; })) vm.hasError['subBudgetName'] = true;

			if (Object.keys(vm.hasError).length > 0) {
				helper.setFocus(Object.keys(vm.hasError)[0]);
			} else {
				var data = {
					name: vm.formValue.name,
					sub_budget: vm.subBudgetName
				};
				dataservice.createMataAnggaran( data ).then( afterCreate );
				function afterCreate() {
					console.log('afterCreate')
					vm.formValue.subBudgets.push(vm.subBudgetName);
					vm.subBudgetName = null;
				}
			}
		}
	}

})();
