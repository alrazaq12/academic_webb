import 'package:academic_web/modules/mahasiswa/page1_khs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:academic_web/modules/academic/ApprovalScreen.dart'; // Impor ApprovalScreen
import 'modules/auth/auth_screen.dart'; // Impor AuthScreen
import 'modules/mahasiswa/dashboard_mahasiswa.dart'; // Impor DashboardMahasiswa
import 'modules/academic/akademik_screen.dart'; // Impor AkademikScreen
import 'modules/academic/tambah_user.dart'; // Impor TambahUserScreen
import 'modules/dosen/RiwayatUploadScreen.dart'; // Impor RiwayatUploadScreen
import 'modules/dosen/dosen_screen.dart'; // Impor DosenScreen
import 'modules/dosen/upload_nilai_screen.dart'; // Impor UploadNilaiScreen
import 'modules/transkrip_nilai/transkrip_nilai_screen.dart'; // Impor TranskripNilaiScreen
import 'modules/mata_kuliah/mata_kuliah_screen.dart'; // Impor MataKuliahScreen
import 'package:academic_web/modules/mahasiswa/lihat_nilai_screen.dart'; // Impor LihatNilaiScreen
import 'package:academic_web/modules/mahasiswa/cek_khs_screen.dart'; // Impor CekKHSScreen
import 'package:academic_web/modules/mahasiswa/cetak_khs_screen.dart'; // Impor CetakKHSScreen
import 'package:academic_web/modules/mahasiswa/lihat_mata_kuliah_screen.dart'; // Impor LihatMataKuliahScreen

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        // Halaman login
        GetPage(name: '/login', page: () => const AuthScreen()),

        // Halaman Dashboard untuk Mahasiswa
        GetPage(
          name: '/mahasiswa',
          page:
              () => DashboardMahasiswa(role: 'mahasiswa1'), // Menambahkan role
        ),

        // Rute lainnya untuk Dosen dan Akademik
        GetPage(
          name: '/dosen',
          page:
              () => const DosenScreen(
                role: 'dosen', // Ganti role sesuai dengan dosen yang login
              ),
        ),
        GetPage(
          name: '/akademik',
          page: () => const AkademikScreen(), // Rute untuk Akademik
        ),

        // Halaman untuk menambah pengguna (Akademik)
        GetPage(name: '/tambah_user', page: () => const TambahUserScreen()),

        // Halaman Transkrip Nilai
        GetPage(
          name: '/transkrip_nilai',
          page:
              () => TranskripNilaiScreen(
                mataKuliahId:
                    Get.parameters['mataKuliahId'] ??
                    '', // Ambil mataKuliahId dari URL
                kelas: Get.parameters['kelas'] ?? '', // Ambil kelas dari URL
              ),
        ),

        // Halaman Unggah Nilai
        GetPage(
          name: '/upload_nilai',
          page:
              () => UploadNilaiScreen(
                mataKuliahId:
                    Get.parameters['mataKuliahId'] ??
                    '', // Ambil mataKuliahId dari URL
                kelas: Get.parameters['kelas'] ?? '', // Ambil kelas dari URL
              ),
        ),

        // Halaman Daftar Mata Kuliah
        GetPage(name: '/mata_kuliah', page: () => const MataKuliahScreen()),

        // Halaman Persetujuan Akademik
        GetPage(
          name: '/approval',
          page:
              () => ApprovalScreen(
                mataKuliahId: 'someId',
                kelas: 'someClass',
              ), // Persetujuan Akademik
        ),

        // Rute lainnya
        GetPage(
          name: '/riwayat_upload',
          page: () => const RiwayatUploadScreen(role: 'dosen'),
        ),
        GetPage(
          name: '/lihat_nilai',
          page: () => LihatNilaiScreen(mataKuliahId: 'A', kelas: 'B'),
        ),
        GetPage(name: '/cek_khs', page: () => CekKHSScreen()),
        GetPage(name: '/cetak_khs', page: () => CetakKHSScreen()),
        GetPage(
          name: '/lihat_mata_kuliah',
          page: () => LihatMataKuliahScreen(),
        ),
        GetPage(name: '/page_1_khs', page: () => p1khs()),
      ],
    ),
  );
}
