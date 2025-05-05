import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Fungsi untuk login
  Future<void> _login() async {
    print("Login button pressed");

    final response = await http.post(
      Uri.parse('http://localhost:3001/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'id': usernameController.text,
        'password': passwordController.text,
      }),
    );

    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200) {
      print("Login successful!");
      final Map<String, dynamic> data = json.decode(response.body);
      String role = data['role'];

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login successful as $role')));

      // Navigasi sesuai role
      if (role == 'mahasiswa') {
        Get.toNamed('/mahasiswa');
      } else if (role == 'dosen') {
        Get.toNamed('/dosen');
      } else if (role == 'akademik') {
        Get.toNamed('/akademik');
      }
    } else {
      print("Login failed");
      final Map<String, dynamic> errorData = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${errorData['message']}')),
      );
    }
  }

  // Widget untuk tombol login
  Widget button() {
    return ElevatedButton(
      onPressed: _login, // Memanggil fungsi _login saat tombol ditekan
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent, // Warna background tombol
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ), // Padding tombol
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Radius sudut tombol
        ),
        minimumSize: Size(440, 35), // Ukuran tombol
      ),
      child: const Center(
        child: Text(
          "Login", // Teks pada tombol
          style: TextStyle(color: Colors.white), // Warna teks tombol
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Row(
            children: [
              Container(
                width: 800,
                height: 700,
                color: Colors.purple,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              margin: const EdgeInsets.only(top: 200, left: 70),
                              child: Image(
                                image: AssetImage('assets/images/piksi.png'),
                              ),
                              //isi logo piksi
                            ),
                            Container(
                              width: 3,
                              height: 125,
                              color: Colors.white,
                              margin: const EdgeInsets.only(top: 200, left: 20),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 200,
                                      right: 65,
                                    ),
                                    child: const Text(
                                      'PORTAL MAHASISWA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 45,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      right: 60,
                                      left: 10,
                                    ),
                                    child: const Text(
                                      'POLITEKNIK PIKSI GANESHA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 480,
                height: 700,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 150,
                                  right: 240,
                                  left: 10,
                                ),
                                child: const Text(
                                  'Sign in mahasiswa',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              Container(
                                width: 480,
                                height: 40,
                                margin: const EdgeInsets.only(top: 20),
                                padding: const EdgeInsets.only(
                                  right: 20,
                                  left: 20,
                                ),
                                child: Center(
                                  child: TextField(
                                    controller: usernameController,
                                    decoration: const InputDecoration(
                                      labelText: 'Username',
                                      prefixIcon: Icon(Icons.person),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 480,
                                height: 40,
                                margin: const EdgeInsets.only(top: 20),
                                padding: const EdgeInsets.only(
                                  right: 20,
                                  left: 20,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: TextField(
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Password',
                                      prefixIcon: Icon(Icons.lock),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              button(), // Tombol login
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
