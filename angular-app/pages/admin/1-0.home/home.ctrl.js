(function() {
	'use strict';

	angular
		.module('app')
		.controller('home.ctrl', HomeCtrl);

	function HomeCtrl($scope, $rootScope, $state, $uibModal, abstractPage, helper, dataservice) {
		var vm = this;
		vm.date = moment().format('DD MMM YYYY');

		abstractPage.startCtrl().then( activate );
		function activate() {}
	}

})();