(function() {
	'use strict';

	angular
		.module('app')
		.controller('data-provinsi.ctrl', Controller);

	function Controller($scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		$rootScope.isGrey = false;
		var vm = this;
		var modalInstance;
		vm.listData = [];

		abstractPage.startCtrl().then(activate);
		function activate() {
			vm.search = '';
			dataservice.getProvinsi().then( afterGetProvinsi );
			function afterGetProvinsi( results ) {
				vm.listData = results;
				_.forEach(vm.listData, function( p ) {
					p.cities = [];
				});
				dataservice.getKota().then( afterGetKota );
			}

			function afterGetKota( results ) {
				_.forEach( results, function( c ) {
					var province = _.find( vm.listData, function ( p ) { return p.id === c.province_id});
					province.cities.push( c );
				});
			}
		}


		vm.selectedPronice;
		vm.cityName = null;
		vm.manageCities = manageCities;
		vm.editCity = editCity;
		vm.cancelEdit = cancelEdit;
		vm.saveEdit = saveEdit;
		vm.reActivate = reActivate;
		vm.createNewCity = createNewCity;
		vm.removeCity = removeCity;
		function manageCities( province ) {
			vm.cityName = null;
			vm.selectedPronice = angular.copy( province );

			modalInstance = $uibModal.open({
				templateUrl: 'cities-modal.html',
				size: 'lg',
				backdrop: 'static',
				scope: $scope
			});
		}
		function editCity( city ) {
			_.forEach( vm.selectedPronice.cities, function( c ) {
				c.editMode = false;
			});
			city.nameTemp = city.name;
			city.editMode = true;
		}
		function cancelEdit( city ) {
			city.editMode = false;
		}
		function saveEdit( city ) {
			cancelEdit( city );
			city.name = city.nameTemp;
			dataservice.editKota( city );
		}
		function reActivate() {
			activate();
		}
		function createNewCity() {
			if ( !vm.cityName ) return;
			var city = {
				name: vm.cityName,
				province_id: vm.selectedPronice.id
			};
			dataservice.createKota( city ).then( afterCreate );
			function afterCreate( result ) {
				city.id = result;
				vm.selectedPronice.cities.push( city );
				vm.cityName = null;
			}
		}
		function removeCity( city ) {
			dataservice.removeKota( city.id ).then( afterRemove );
			function afterRemove() {
				_.remove( vm.selectedPronice.cities , function( c ) {
					return c.name === city.name;
				});
			};
		}


		vm.orderBy = '+id';
		vm.toggleSort = toggleSort;
		function toggleSort(value) {
			vm.orderBy = ( vm.orderBy !== ( '+' + value ) ) ? ( '+' + value ) : ( '-' + value );
		}


		vm.openModal = openModal;
		vm.submit = submit;
		vm.remove = remove;
		vm.closeModal = closeModal;
		vm.formValue;
		vm.hasError;
		function openModal( data, templateUrl ) {
			if ( data ) vm.formValue = angular.copy(data);
			else vm.formValue = {};

			modalInstance = $uibModal.open({
				templateUrl: templateUrl,
				size: 'md',
				backdrop: 'static',
				scope: $scope
			});
		}
		function submit() {
			vm.hasError = {};

			if ( !vm.formValue.name ) vm.hasError['name'] = true;
			else if (_.find( vm.listData, function( d ) { return vm.formValue.name === d.name && vm.formValue.id !== d.id; })) vm.hasError['name'] = true;

			if (Object.keys(vm.hasError).length > 0) {
				helper.setFocus(Object.keys(vm.hasError)[0]);
			} else {
				if ( vm.formValue.id ) {
					dataservice.editProvinsi( vm.formValue ).then( closeModal ).then( activate );
				} else {
					dataservice.createProvinsi( vm.formValue ).then( closeModal ).then( activate );
				}
			}
		}
		function remove() {
			dataservice.removeProvinsi(vm.formValue.id).then(closeModal).then(activate);
		}
		function closeModal() {
			if (modalInstance && modalInstance.dismiss) modalInstance.dismiss();
		}

	}

})();