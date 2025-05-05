import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DosenScreen extends StatefulWidget {
  final String role;
  const DosenScreen({super.key, required this.role});

  @override
  _DosenScreenState createState() => _DosenScreenState();
}

class _DosenScreenState extends State<DosenScreen> {
  List<String> mataKuliahDosen = [];

  @override
  void initState() {
    super.initState();
    // Menampilkan mata kuliah berdasarkan role dosen
    _loginAndFetchMatakuliah();
  }

  Future<void> _loginAndFetchMatakuliah() async {
    final response = await http.post(
      Uri.parse('http://localhost:3001/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'id': widget.role,  // Role dosen yang login
        'password': 'password123',  // Password dosen yang sesuai
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        mataKuliahDosen = List<String>.from(data['mata_kuliah']);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login failed: ${response.body}'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Dosen'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menu Dosen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('Lihat Transkrip Nilai'),
              onTap: () {
                // Navigasi ke halaman transkrip nilai
                Get.toNamed('/transkrip_nilai');
              },
            ),
            ListTile(
              leading: const Icon(Icons.upload),
              title: const Text('Unggah Nilai'),
              onTap: () {
                // Navigasi ke halaman unggah nilai
                Get.toNamed('/upload_nilai');
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Daftar Mata Kuliah'),
              onTap: () {
                // Navigasi ke halaman daftar mata kuliah yang diajarkan
                Get.toNamed('/mata_kuliah');
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Riwayat Upload Nilai'),
              onTap: () {
                // Navigasi ke halaman riwayat upload
                Get.toNamed('/riwayat_upload');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat datang, Dosen!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Mata Kuliah yang Anda Ajar:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: mataKuliahDosen.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(mataKuliahDosen[index]),
                    onTap: () {
                      // Tindakan saat memilih mata kuliah
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
