(function() {
	'use strict';

	angular
		.module('app')
		.controller('LoginCtrl', LoginCtrl);

	function LoginCtrl($rootScope, $state, appData, dataservice, abstractPage) {
		$rootScope.isGrey = true;
		var vm = this;

		vm.auth = {};
		vm.auth.username = 'root';
		vm.auth.password = 'password';
		vm.errorMsg = false;

		vm.login = login;
		abstractPage.startCtrl().then(activate);
		function activate() {}

		function login() {
			vm.errorMsg = false;
			dataservice.login(vm.auth)
				.then(function() {
					appData.setLoggedUser(true);
					$state.go('admin.home');
				})
				.catch(function() {
					vm.errorMsg = true;
				});
		}

	}

})();