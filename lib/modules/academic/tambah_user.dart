import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TambahUserScreen extends StatefulWidget {
  const TambahUserScreen({super.key});

  @override
  _TambahUserScreenState createState() => _TambahUserScreenState();
}

class _TambahUserScreenState extends State<TambahUserScreen> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  // Fungsi untuk menambahkan pengguna
  Future<void> _addUser() async {
    final response = await http.post(
      Uri.parse('http://localhost:3001/api/users'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'role': 'akademik', // Pastikan yang mengakses adalah akademik
        'id': idController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 201) {
      // Menampilkan notifikasi sukses
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('User added successfully!'),
      ));
    } else {
      // Menampilkan notifikasi error
      final Map<String, dynamic> errorData = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorData['message']),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pengguna'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Tambah Pengguna Baru',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // ID pengguna
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: 'ID Pengguna',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Password pengguna
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Role pengguna
            TextField(
              controller: roleController,
              decoration: const InputDecoration(
                labelText: 'Role (mahasiswa/dosen)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol untuk menambah pengguna
            ElevatedButton(
              onPressed: _addUser,
              child: const Text('Tambah Pengguna'),
            ),
          ],
        ),
      ),
    );
  }
}
