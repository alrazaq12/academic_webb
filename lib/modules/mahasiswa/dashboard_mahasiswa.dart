// lib/modules/mahasiswa/dashboard_mahasiswa.dart

import 'dart:io';

import 'package:academic_web/modules/academic/KurCheck.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void _logout() {
  Get.offAllNamed('/login');
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _showPopup(context));
  }
}

class _showPopup extends StatelessWidget {
  _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Peringatan"),
          content: Text("Ini adalah popup dari tombol tanda seru!"),
          actions: [
            TextButton(
              child: Text("Tutup"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contoh Popup")),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.error, color: Colors.red, size: 40),
          onPressed: () => _showPopup(context),
        ),
      ),
    );
  }
}

class DashboardMahasiswa extends StatefulWidget {
  final String role;

  const DashboardMahasiswa({super.key, required this.role});

  @override
  _DashboardMahasiswaState createState() => _DashboardMahasiswaState();
}

class _DashboardMahasiswaState extends State<DashboardMahasiswa> {
  List<String> mataKuliahMahasiswa = [];

  @override
  void initState() {
    super.initState();
    // Menampilkan mata kuliah mahasiswa berdasarkan role
    _loginAndFetchMatakuliah();
  }

  Future<void> _loginAndFetchMatakuliah() async {
    final response = await http.post(
      Uri.parse('http://localhost:3001/api/login'), // Pastikan API ini benar
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'id': widget.role, // Role mahasiswa yang login
        'password': 'password123', // Password mahasiswa yang sesuai
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        mataKuliahMahasiswa = List<String>.from(data['mata_kuliah']);
      });
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login failed: ${response.body}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Mahasiswa'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: const Color.fromARGB(255, 177, 147, 228),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text(
                'Menu Mahasiswa', // Mengubah title menu sesuai kebutuhan
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.assignment_ind), // Ikon untuk Cek KHS
              title: const Text('Kartu Hasil Studi'),
              onTap: () {
                Get.toNamed('/cek_khs');
              },
            ),
            ListTile(
              leading: const Icon(Icons.school), // Ikon untuk Lihat Mata Kuliah
              title: const Text('Transkrip Nilai'),
              onTap: () {
                Get.toNamed('/lihat_mata_kuliah');
              },
            ),

            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            //container base 1
            top: 8,
            left: 8,
            right: 8,
            bottom: 8,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 233, 255),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  //container base ke 2
                  top: 30,
                  left: 8,
                  child: Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Positioned(
                  //curriculum checklist
                  left: 10,
                  bottom: 10,
                  child: Stack(
                    children: [
                      Container(
                        child: Kurikcheck(title: 'Curriculum Checklist :'),
                        width: 400,
                        height: 600,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  // text matkul minat
                  top: 50,
                  left: 360,
                  child: Container(
                    child: Center(
                      child: Text(
                        'Matkul yang diminati :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    width: 300,
                    height: 35,
                  ),
                ),
                Positioned(
                  // container question matkul minat
                  top: 50,
                  left: 939,
                  child: Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.question_mark,
                        color: Colors.grey,
                        size: 20,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Matkul yang diminati :'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start, // ini penting
                                children: [
                                  Text(
                                    'Memilih Mata Kulyeah sesuai dengan minat dan rencana karier Mahasiswa.',
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Memilih Mata Kulyeah Peminatan juga berfungsi sebagai dasar',
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'dalam menentukan topik Tugas Akhir/TA dan Skripsi.',
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Tutup'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  //container matkul minat
                  top: 93,
                  left: 430,
                  child: Container(
                    width: 550,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  //kalender akademik
                  top: 230,
                  left: 430,
                  child: Container(
                    width: 550,
                    height: 463,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  //info kampus
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 510,
                    height: 400,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  // text progres mata kulyeah
                  top: 50,
                  right: 288,
                  child: Container(
                    child: Center(
                      child: Text(
                        'Progres Mata Kulyeah :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    width: 300,
                    height: 35,
                  ),
                ),
                Positioned(
                  // grafik matkul yg telah di tempuh
                  top: 93,
                  right: 10,
                  child: Container(
                    width: 510,
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
