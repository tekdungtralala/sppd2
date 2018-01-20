
(function() {
	'use strict';

	angular.module('app').config(routerConfig);

	function routerConfig($stateProvider) {
		$stateProvider
			.state('admin', {
				url: '/admin',
				templateUrl: 'angular-app/pages/admin/admin.html?version=' + window.version,
				controller: 'AdminCtrl',
				controllerAs: 'vm',
				isSecure: true
			})
				
				.state('admin.home', {
					url: '/home',
					templateUrl: 'angular-app/pages/admin/1-0.home/home.html?version=' + window.version,
					controller: 'home.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Master',
					titlePage: 'APLIKASI SISTEM INFORMASI SURAT PERINTAH PERJALANAN DINAS (SPPD)',
					isSecure: true
				})

				.state('admin.data-jabatan', {
					url: '/data-jabatan',
					templateUrl: 'angular-app/pages/admin/1-1.data-jabatan/data-jabatan.html?version=' + window.version,
					controller: 'data-jabatan.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Master',
					titlePage: 'Data Jabatan',
					isSecure: true
				})
				.state('admin.data-golongan', {
					url: '/data-golongan',
					templateUrl: 'angular-app/pages/admin/1-2.data-golongan/data-golongan.html?version=' + window.version,
					controller: 'data-golongan.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Master',
					titlePage: 'Data Golongan',
					isSecure: true
				})
				.state('admin.data-pegawai', {
					url: '/data-pegawai',
					templateUrl: 'angular-app/pages/admin/1-3.data-pegawai/data-pegawai.html?version=' + window.version,
					controller: 'data-pegawai.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Master',
					titlePage: 'Data Pegawai',
					isSecure: true
				})
				.state('admin.data-provinsi', {
					url: '/data-provinsi',
					templateUrl: 'angular-app/pages/admin/1-4.data-provinsi/data-provinsi.html?version=' + window.version,
					controller: 'data-provinsi.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Master',
					titlePage: 'Data Provinsi',
					isSecure: true
				})
				.state('admin.data-angkutan', {
					url: '/data-angkutan',
					templateUrl: 'angular-app/pages/admin/1-5.data-angkutan/data-angkutan.html?version=' + window.version,
					controller: 'data-angkutan.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Master',
					titlePage: 'Data Angkutan',
					isSecure: true
				})
				.state('admin.data-mata-anggaran', {
					url: '/data-mata-anggaran',
					templateUrl: 'angular-app/pages/admin/1-6.data-mata-anggaran/data-mata-anggaran.html?version=' + window.version,
					controller: 'data-mata-anggaran.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Master',
					titlePage: 'Data Mata Kegiatan',
					isSecure: true
				})
				.state('admin.data-biaya-perjalanan-dinas', {
					url: '/data-biaya-perjalanan-dinas',
					templateUrl: 'angular-app/pages/admin/1-7.data-biaya-perjalanan-dinas/data-biaya-perjalanan-dinas.html?version=' + window.version,
					controller: 'data-biaya-perjalanan-dinas.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Master',
					titlePage: 'Data Biaya Dinas',
					isSecure: true
				})



				.state('admin.entry-surat-tugas', {
					url: '/entry-surat-tugas',
					templateUrl: 'angular-app/pages/admin/2-1.entry-surat-tugas/entry-surat-tugas.html?version=' + window.version,
					controller: 'entry-surat-tugas.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Transaksi',
					titlePage: 'Entry Surat Tugas',
					isSecure: true
				})
				.state('admin.entry-surat-perjalanan-dinas', {
					url: '/entry-surat-perjalanan-dinas',
					templateUrl: 'angular-app/pages/admin/2-2.entry-surat-perjalanan-dinas/entry-surat-perjalanan-dinas.html?version=' + window.version,
					controller: 'entry-surat-perjalanan-dinas.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Transaksi',
					titlePage: 'Entry Surat Perjalanan Dinas',
					isSecure: true
				})
				.state('admin.entry-biaya-dinas', {
					url: '/entry-biaya-dinas',
					templateUrl: 'angular-app/pages/admin/2-3.entry-biaya-dinas/entry-biaya-dinas.html?version=' + window.version,
					controller: 'entry-biaya-dinas.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Transaksi',
					titlePage: 'Entry Biaya Dinas',
					isSecure: true
				})
				.state('admin.entry-bukti-kas', {
					url: '/entry-bukti-kas',
					templateUrl: 'angular-app/pages/admin/2-4.entry-bukti-kas/entry-bukti-kas.html?version=' + window.version,
					controller: 'entry-bukti-kas.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Transaksi',
					titlePage: 'Entry Bukti Kas',
					isSecure: true
				})
				.state('admin.entry-hasil-dinas', {
					url: '/entry-hasil-dinas',
					templateUrl: 'angular-app/pages/admin/2-5.entry-hasil-dinas/entry-hasil-dinas.html?version=' + window.version,
					controller: 'entry-hasil-dinas.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Transaksi',
					titlePage: 'Entry Hasil Dinas',
					isSecure: true
				})
				



				.state('admin.laporan-status-sppd', {
					url: '/laporan-status-sppd',
					templateUrl: 'angular-app/pages/admin/3-1.laporan-status-sppd/laporan-status-sppd.html?version=' + window.version,
					controller: 'laporan-status-sppd.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Laporan',
					titlePage: 'Laporan Dashboard Status Berkas SPPD',
					isSecure: true
				})
				.state('admin.laporan-pegawai-sppd', {
					url: '/laporan-pegawai-sppd',
					templateUrl: 'angular-app/pages/admin/3-2.laporan-pegawai-sppd/laporan-pegawai-sppd.html?version=' + window.version,
					controller: 'laporan-pegawai-sppd.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Laporan',
					titlePage: 'Laporan Dashboard Status Pegawai SPPD',
					isSecure: true
				})
				.state('admin.laporan-tujuan-sppd', {
					url: '/laporan-tujuan-sppd',
					templateUrl: 'angular-app/pages/admin/3-3.laporan-tujuan-sppd/laporan-tujuan-sppd.html?version=' + window.version,
					controller: 'laporan-tujuan-sppd.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Laporan',
					titlePage: 'Laporan Tempat Tujuan SPPD',
					isSecure: true
				})
				.state('admin.laporan-biaya-sppd', {
					url: '/laporan-biaya-sppd',
					templateUrl: 'angular-app/pages/admin/3-4.laporan-biaya-sppd/laporan-biaya-sppd.html?version=' + window.version,
					controller: 'laporan-biaya-sppd.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Laporan',
					titlePage: 'Laporan Biaya SPPD',
					isSecure: true
				})
				.state('admin.laporan-beban-anggaran', {
					url: '/laporan-beban-anggaran',
					templateUrl: 'angular-app/pages/admin/3-5.laporan-beban-anggaran/laporan-beban-anggaran.html?version=' + window.version,
					controller: 'laporan-beban-anggaran.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Laporan',
					titlePage: 'Laporan Beban Anggaran',
					isSecure: true
				})
				.state('admin.laporan-semua-sppd', {
					url: '/laporan-semua-sppd',
					templateUrl: 'angular-app/pages/admin/3-6.laporan-semua-sppd/laporan-semua-sppd.html?version=' + window.version,
					controller: 'laporan-semua-sppd.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Laporan',
					titlePage: 'Laporan Semua SPPD',
					isSecure: true
				})
				.state('admin.laporan-surat-tugas', {
					url: '/laporan-surat-tugas',
					templateUrl: 'angular-app/pages/admin/3-7.laporan-surat-tugas/template.html?version=' + window.version,
					controller: 'laporan-surat-tugas.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Laporan',
					titlePage: 'Laporan Surat Perjalanan Dinas',
					isSecure: true
				})
				.state('admin.laporan-tujuan-sppd-2', {
					url: '/laporan-tujuan-sppd-2',
					templateUrl: 'angular-app/pages/admin/3-8.laporan-tujuan-sppd/template.html?version=' + window.version,
					controller: 'laporan-tujuan-sppd-2.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Laporan',
					titlePage: 'Laporan Tujuan SPPD',
					isSecure: true
				})
				.state('admin.laporan-status-sppd-2', {
					url: '/laporan-status-sppd-2',
					templateUrl: 'angular-app/pages/admin/3-9.laporan-status-sppd/template.html?version=' + window.version,
					controller: 'laporan-status-sppd-2.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Laporan',
					titlePage: 'Laporan Surat Tugas Pegawai',
					isSecure: true
				})
				.state('admin.laporan-hasil-sppd', {
					url: '/laporan-hasil-sppd',
					templateUrl: 'angular-app/pages/admin/3-10.laporan-hasil-sppd/template.html?version=' + window.version,
					controller: 'laporan-hasil-sppd.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Laporan',
					titlePage: 'Laporan Hasil Dinas',
					isSecure: true
				})
				.state('admin.laporan-total-biaya-dinas', {
					url: '/laporan-total-biaya-dinas',
					templateUrl: 'angular-app/pages/admin/3-11.laporan-total-biaya-dinas/template.html?version=' + window.version,
					controller: 'laporan-total-biaya-dinas.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Laporan',
					titlePage: 'Laporan Biaya Dinas',
					isSecure: true
				})
				.state('admin.laporan-status-anggaran', {
					url: '/laporan-status-anggaran',
					templateUrl: 'angular-app/pages/admin/3-12.laporan-status-anggaran/template.html?version=' + window.version,
					controller: 'laporan-status-anggaran.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Laporan',
					titlePage: 'Laporan Kode Mata Kegiatan',
					isSecure: true
				})
				.state('admin.laporan-total-keuangan', {
					url: '/laporan-total-keuangan',
					templateUrl: 'angular-app/pages/admin/3-13.laporan-total-keuangan/template.html?version=' + window.version,
					controller: 'laporan-total-keuangan.ctrl',
					controllerAs: 'vm',
					treeViewActive: 'Laporan',
					titlePage: 'Laporan Rekapitulasi Kas Pengeluaran',
					isSecure: true
				})
				
				
				
			.state('login', {
				url: '/',
				templateUrl: 'angular-app/pages/login/login.html?version=' + window.version,
				controller: 'LoginCtrl',
				controllerAs: 'vm',
				isSecure: false
			})
	};

})();