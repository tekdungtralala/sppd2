(function() {
	'use strict';

	angular
		.module('app')
		.controller('AdminCtrl', AdminCtrl);

	function AdminCtrl($rootScope, $state, abstractPage, dataservice, appData) {
		$rootScope.isGrey = false;
		var vm = this;
		
		vm.logout = logout;
		vm.toState = toState;
		vm.isHome = false;

		abstractPage.startCtrl().then(activate);
		function activate() {
			if ( $state.current.name === 'admin' ) toState('data-jabatan');
			vm.isHome = $state.current.url === '/home';
		}

		function logout() {
			dataservice.logout().then(function() {
				appData.setLoggedUser(null);
				$state.go('login');
			});
		}

		function toState( targetState ) {
			$state.go('admin.' + targetState);
			vm.isHome = false;
		}
	}

})();