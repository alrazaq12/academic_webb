import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UploadNilaiScreen extends StatefulWidget {
  final String mataKuliahId; // Terima parameter mataKuliahId
  final String kelas;        // Terima parameter kelas

  const UploadNilaiScreen({super.key, required this.mataKuliahId, required this.kelas});

  @override
  _UploadNilaiScreenState createState() => _UploadNilaiScreenState();
}

class _UploadNilaiScreenState extends State<UploadNilaiScreen> {
  // Data yang akan ditambahkan
  List<Map<String, dynamic>> data = [];

  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _npmController = TextEditingController();
  final _kelasController = TextEditingController();
  final _kehadiranController = TextEditingController();
  final _quiz1Controller = TextEditingController();
  final _quiz2Controller = TextEditingController();
  final _utsController = TextEditingController();
  final _uasController = TextEditingController();
  final _gradeController = TextEditingController();

  // Fungsi untuk menambah data
  void _addData() {
    setState(() {
      data.add({
        'no': data.length + 1,  // Menambahkan No otomatis berdasarkan jumlah data
        'npm': _npmController.text,
        'nama': _namaController.text,
        'kelas': _kelasController.text,
        'kehadiran': _kehadiranController.text,
        'quiz1': _quiz1Controller.text,
        'quiz2': _quiz2Controller.text,
        'uts': _utsController.text,
        'uas': _uasController.text,
        'grade': _gradeController.text,
      });
    });
    _clearForm();
  }
  // Fungsi untuk menghapus data
  void _deleteData(int index) {
    setState(() {
      data.removeAt(index);
    });
  }

  // Fungsi untuk mengedit data
  void _editData(int index) {
    setState(() {
      data[index] = {
        'no': data[index]['no'],
        'npm': _npmController.text,
        'nama': _namaController.text,
        'kelas': _kelasController.text,
        'kehadiran': _kehadiranController.text,
        'quiz1': _quiz1Controller.text,
        'quiz2': _quiz2Controller.text,
        'uts': _utsController.text,
        'uas': _uasController.text,
        'grade': _gradeController.text,
      };
    });
    _clearForm();
  }

  // Fungsi untuk mengisi data ke form (untuk edit)
  void _populateForm(int index) {
    _npmController.text = data[index]['npm'];
    _namaController.text = data[index]['nama'];
    _kelasController.text = data[index]['kelas'];
    _kehadiranController.text = data[index]['kehadiran'];
    _quiz1Controller.text = data[index]['quiz1'];
    _quiz2Controller.text = data[index]['quiz2'];
    _utsController.text = data[index]['uts'];
    _uasController.text = data[index]['uas'];
    _gradeController.text = data[index]['grade'];
  }

  // Fungsi untuk membersihkan form
  void _clearForm() {
    _npmController.clear();
    _namaController.clear();
    _kelasController.clear();
    _kehadiranController.clear();
    _quiz1Controller.clear();
    _quiz2Controller.clear();
    _utsController.clear();
    _uasController.clear();
    _gradeController.clear();
  }

  // Fungsi untuk upload nilai
  Future<void> _uploadNilai() async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3001/api/upload_nilai'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'mata_kuliah_id': widget.mataKuliahId, // Kirimkan mataKuliahId
          'kelas': widget.kelas, // Kirimkan kelas
          'data': data,
        }), // Kirimkan data dalam bentuk JSON
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Upload Nilai Berhasil! Menunggu Persetujuan Akademik.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Upload Nilai Gagal!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Terjadi kesalahan saat upload nilai.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload Nilai")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Button Add Data for Popup
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Tambah Data'),
                      content: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Container(  // Wrap in Container
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _namaController,
                                  decoration: const InputDecoration(labelText: 'Nama'),
                                  validator: (value) =>
                                      value!.isEmpty ? 'Nama tidak boleh kosong' : null,
                                ),
                                TextFormField(
                                  controller: _npmController,
                                  decoration: const InputDecoration(labelText: 'NPM'),
                                  validator: (value) =>
                                      value!.isEmpty ? 'NPM tidak boleh kosong' : null,
                                ),
                                TextFormField(
                                  controller: _kelasController,
                                  decoration: const InputDecoration(labelText: 'Kelas'),
                                  validator: (value) =>
                                      value!.isEmpty ? 'Kelas tidak boleh kosong' : null,
                                ),
                                TextFormField(
                                  controller: _kehadiranController,
                                  decoration: const InputDecoration(labelText: 'Kehadiran'),
                                  keyboardType: TextInputType.number,
                                  validator: (value) =>
                                      value!.isEmpty ? 'Kehadiran tidak boleh kosong' : null,
                                ),
                                TextFormField(
                                  controller: _quiz1Controller,
                                  decoration: const InputDecoration(labelText: 'Quiz 1'),
                                  keyboardType: TextInputType.number,
                                  validator: (value) =>
                                      value!.isEmpty ? 'Quiz 1 tidak boleh kosong' : null,
                                ),
                                TextFormField(
                                  controller: _quiz2Controller,
                                  decoration: const InputDecoration(labelText: 'Quiz 2'),
                                  keyboardType: TextInputType.number,
                                  validator: (value) =>
                                      value!.isEmpty ? 'Quiz 2 tidak boleh kosong' : null,
                                ),
                                TextFormField(
                                  controller: _utsController,
                                  decoration: const InputDecoration(labelText: 'Nilai UTS'),
                                  keyboardType: TextInputType.number,
                                  validator: (value) =>
                                      value!.isEmpty ? 'Nilai UTS tidak boleh kosong' : null,
                                ),
                                TextFormField(
                                  controller: _uasController,
                                  decoration: const InputDecoration(labelText: 'Nilai UAS'),
                                  keyboardType: TextInputType.number,
                                  validator: (value) =>
                                      value!.isEmpty ? 'Nilai UAS tidak boleh kosong' : null,
                                ),
                                TextFormField(
                                  controller: _gradeController,
                                  decoration: const InputDecoration(labelText: 'Grade'),
                                  validator: (value) =>
                                      value!.isEmpty ? 'Grade tidak boleh kosong' : null,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _addData();
                              Navigator.pop(context);  // Close the dialog after adding data
                            }
                          },
                          child: const Text('Tambah'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); // Close dialog without saving
                          },
                          child: const Text('Batal'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Tambah Data'),
            ),

            // Tombol Upload Nilai
            ElevatedButton(
              onPressed: _uploadNilai,
              child: const Text('Upload Nilai ke Akademik'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${data[index]['nama']}'),
                    subtitle: Text('NPM: ${data[index]['npm']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _deleteData(index);
                      },
                    ),
                    onTap: () {
                      _populateForm(index);
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
