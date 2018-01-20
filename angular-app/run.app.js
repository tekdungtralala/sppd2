
(function() {

	'use strict';

	var app = angular.module('app');
	app.run(appRun);
	function appRun($rootScope, $transitions) {
		$rootScope.treeViewActive = null;
		$rootScope.menuActive = null;
		$rootScope.titlePage = null;

		$transitions.onSuccess({}, function( transition ) {
			$rootScope.treeViewActive = transition.$to().self.treeViewActive;
			$rootScope.menuActive = transition.$to().self.url;
			$rootScope.titlePage = transition.$to().self.titlePage;
		});
	}

	app.config(['$qProvider', function ($qProvider) {
		$qProvider.errorOnUnhandledRejections(false);
	}]);

})();