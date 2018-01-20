(function() {

	'use strict';

	angular
		.module( 'app' )
		.factory( 'dataservice' , DataService);

	function DataService($q, $http, $state, $stateParams) {
		var service = {
			login: login, logout: logout, hasLoggedUser: hasLoggedUser,

			getJabatan: getJabatan, createJabatan: createJabatan, editJabatan: editJabatan, removeJabatan: removeJabatan,

			getGolongan: getGolongan, createGolongan: createGolongan, editGolongan: editGolongan, removeGolongan: removeGolongan,

			getPegawai: getPegawai, createPegawai: createPegawai, editPegawai: editPegawai, removePegawai: removePegawai,

			getProvinsi: getProvinsi, createProvinsi: createProvinsi, editProvinsi: editProvinsi, removeProvinsi: removeProvinsi,

			getKota: getKota, createKota: createKota, editKota: editKota, removeKota: removeKota,

			getAngkutan: getAngkutan, createAngkutan: createAngkutan, editAngkutan: editAngkutan, removeAngkutan: removeAngkutan,

			getMataAnggaran: getMataAnggaran, createMataAnggaran: createMataAnggaran, editMataAnggaran: editMataAnggaran, removeMataAnggaranByName: removeMataAnggaranByName, removeMataAnggaranByNameAndSub: removeMataAnggaranByNameAndSub,

			getBiayaPerjalananDinas: getBiayaPerjalananDinas, createBiayaPerjalananDinas: createBiayaPerjalananDinas, editBiayaPerjalananDinas: editBiayaPerjalananDinas,

			getEntrySuratTugas: getEntrySuratTugas,
			getSPPDOfficer: getSPPDOfficer,
			getMaxIdofSPPD: getMaxIdofSPPD,
			createSPPD: createSPPD,
			removeSPPD: removeSPPD,
			continueToInputSPD: continueToInputSPD,
			getEntrySuratPerjalananDinas: getEntrySuratPerjalananDinas,
			updateSPD: updateSPD,
			continueToInputBiaya: continueToInputBiaya,
			updateSPPDOfficerBiaya: updateSPPDOfficerBiaya,
			getEntryBiayaSPD: getEntryBiayaSPD,
			updateSPPDOfficerTotal: updateSPPDOfficerTotal,
			continueToBuktiKas: continueToBuktiKas,
			getEntryKas: getEntryKas,
			updateSPPDOfficerKas: updateSPPDOfficerKas,
			continueToInputHasil: continueToInputHasil,
			getEntryHasil: getEntryHasil,
			updateSPPDHasil: updateSPPDHasil,
			closeTheReport: closeTheReport,
			
			getAllStateSPPD: getAllStateSPPD,
			getAllSPPD: getAllSPPD,
			getAllSPPDState6: getAllSPPDState6,
			getAllSPPDOfficer: getAllSPPDOfficer,

			postReportData: postReportData
		};
		return service;

		function postReportData(data, startDate, endDate, totalRp) {
			var qp = '';
			if (startDate && endDate)
				qp = qp + 'startDate=' + startDate + '&endDate=' + endDate;
			if (totalRp)
				qp = qp + '&totalRp=' + totalRp;
			return $http.post( 'api/print/postReportData.php?' + qp, data );
		}

		function getAllStateSPPD(startDate, endDate) {
			var qp = '';
			if (startDate && endDate) qp = '?startDate=' + startDate + '&endDate=' + endDate;
			return $http.get( 'api/laporan/getAllStateSPPD.php' + qp ).then( afterGet );
		}
		function getAllSPPD() {
			return $http.get( 'api/laporan/getAllSPPD.php' ).then( afterGet );
		}
		function getAllSPPDState6(startDate, endDate) {
			var qp = '';
			if (startDate && endDate) qp = '?startDate=' + startDate + '&endDate=' + endDate;
			return $http.get( 'api/laporan/getAllSPPDState6.php' + qp ).then( afterGet );
		}
		function getAllSPPDOfficer() {
			return $http.get( 'api/laporan/getAllSPPDOfficer.php' ).then( afterGet );
		}

		function login(data) { return $http.post( 'api/login/login.php' , data); }
		function logout() { return $http.get( 'api/login/logout.php' ); }
		function hasLoggedUser() { return $http.get( 'api/login/check_user.php' ); }

		function getJabatan() { return getAPI('jabatan'); }
		function createJabatan( data ) { return postAPI('jabatan', data); }
		function editJabatan( data ) { return putAPI('jabatan', data); }
		function removeJabatan( id ) { return deleteAPI('jabatan', id); }

		function getGolongan() { return getAPI('golongan'); }
		function createGolongan( data ) { return postAPI('golongan', data); }
		function editGolongan( data ) { return putAPI('golongan', data); }
		function removeGolongan( id ) { return deleteAPI('golongan', id); }

		function getPegawai() { return getAPI('pegawai'); }
		function createPegawai( data ) { return postAPI('pegawai', data); }
		function editPegawai( data ) { return putAPI('pegawai', data); }
		function removePegawai( id ) { return deleteAPI('pegawai', id); }

		function getProvinsi() { return getAPI('provinsi'); }
		function createProvinsi( data ) { return postAPI('provinsi', data); }
		function editProvinsi( data ) { return putAPI('provinsi', data); }
		function removeProvinsi( id ) { return deleteAPI('provinsi', id); }

		function getKota() { return getAPI('kota'); }
		function createKota( data ) { return postAPI('kota', data).then(afterGet); }
		function editKota( data ) { return putAPI('kota', data); }
		function removeKota( id ) { return deleteAPI('kota', id); }

		function getAngkutan() { return getAPI('angkutan'); }
		function createAngkutan( data ) { return postAPI('angkutan', data).then(afterGet); }
		function editAngkutan( data ) { return putAPI('angkutan', data); }
		function removeAngkutan( id ) { return deleteAPI('angkutan', id); }

		function getMataAnggaran() { return getAPI('mata-anggaran'); }
		function createMataAnggaran( data ) { return postAPI('mata-anggaran', data).then(afterGet); }
		function editMataAnggaran( data ) { return putAPI('mata-anggaran', data); }
		function removeMataAnggaranByName( name ) { return $http.delete( 'api/mata-anggaran/deleteByName.php?name=' + name); }
		function removeMataAnggaranByNameAndSub( name, sub ) { return $http.delete( 'api/mata-anggaran/deleteByNameAndSub.php?name=' + name + '&sub_budget=' + sub); }

		function getBiayaPerjalananDinas() { return getAPI('biaya-perjalanan-dinas'); }
		function createBiayaPerjalananDinas( data ) { return postAPI('biaya-perjalanan-dinas', data); }
		function editBiayaPerjalananDinas( data ) { return putAPI('biaya-perjalanan-dinas', data); }

		function getEntrySuratTugas() { return $http.get( 'api/sppd/get.php?state=1' ).then( afterGet ); }
		function getSPPDOfficer( sppdId ) { return $http.get( 'api/sppd/get_officer.php?sppd_id=' + sppdId ).then( afterGet ); }
		function getMaxIdofSPPD() { return $http.get( 'api/sppd/getMaxIdofSPPD.php' ).then( afterGet ); }
		function createSPPD( data ) { return postAPI('sppd', data); }
		function removeSPPD( id ) { return deleteAPI('sppd', id); }
		function continueToInputSPD( id ) { return $http.post( 'api/sppd/continueToState2.php?id=' + id ); }
		function getEntrySuratPerjalananDinas() { return $http.get( 'api/sppd/get.php?state=2' ).then( afterGet ); }
		function updateSPD( data ) { return $http.post( 'api/sppd/updateSPD.php', data ); }
		function continueToInputBiaya( id ) { return $http.post( 'api/sppd/continueToState3.php?id=' + id ); }
		function updateSPPDOfficerBiaya( data ) { return $http.post( 'api/sppd/updateSPPDOfficerBiaya.php', data ); }
		function getEntryBiayaSPD() { return $http.get( 'api/sppd/get.php?state=3' ).then( afterGet ); }
		function updateSPPDOfficerTotal( data ) { return $http.post( 'api/sppd/updateSPPDOfficerTotal.php', data ); }
		function continueToBuktiKas( id ) { return $http.post( 'api/sppd/continueToState4.php?id=' + id ); }
		function getEntryKas() { return $http.get( 'api/sppd/get.php?state=4' ).then( afterGet ); }
		function updateSPPDOfficerKas( data ) { return $http.post( 'api/sppd/updateSPPDOfficerKas.php', data ); }
		function continueToInputHasil( id ) { return $http.post( 'api/sppd/continueToState5.php?id=' + id ); }
		function getEntryHasil() { return $http.get( 'api/sppd/get.php?state=5' ).then( afterGet ); }
		function updateSPPDHasil( data ) { return $http.post( 'api/sppd/updateSPPDHasil.php', data ); }
		function closeTheReport( id ) { return $http.post( 'api/sppd/continueToState6.php?id=' + id ); }

		function getAPI( folderName ) {
			return $http.get( 'api/' + folderName + '/get.php' ).then( afterGet );
		}
		function postAPI( folderName, data ) {
			return $http.post( 'api/' + folderName + '/post.php', data );
		}
		function putAPI( folderName, data ) {
			return $http.put( 'api/' + folderName + '/put.php', data );
		}
		function deleteAPI( folderName, id ) {
			return $http.delete( 'api/' + folderName + '/delete.php?id=' + id);
		}

		function afterGet( response ) { return response.data; }
	}

})();