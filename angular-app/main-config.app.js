(function() {
	'use strict';

	angular.module('app').config(configuration);

	function configuration($urlRouterProvider) {
		$urlRouterProvider.otherwise('/');
	}

})();