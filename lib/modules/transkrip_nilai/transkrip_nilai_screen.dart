// lib/modules/transkrip_nilai/transkrip_nilai_screen.dart
import 'package:flutter/material.dart';

class TranskripNilaiScreen extends StatelessWidget {
  // Constructor untuk menerima parameter jika diperlukan
  final String mataKuliahId;
  final String kelas;

  const TranskripNilaiScreen({super.key, required this.mataKuliahId, required this.kelas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transkrip Nilai"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Menampilkan informasi mata kuliah dan kelas
            Text(
              'Mata Kuliah: $mataKuliahId',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Kelas: $kelas',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),

            // Tabel untuk menampilkan data transkrip nilai
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('No')),
                    DataColumn(label: Text('Nama')),
                    DataColumn(label: Text('NPM')),
                     DataColumn(label: Text('kehadiran')),
                      DataColumn(label: Text('QUIZ 1')),
                       DataColumn(label: Text('QUIZ 2')),
                    DataColumn(label: Text('Nilai UTS')),
                    DataColumn(label: Text('Nilai UAS')),
                    DataColumn(label: Text('Grade')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('John Doe')),
                      DataCell(Text('12345')),
                      DataCell(Text('80')),
                      DataCell(Text('85')),
                      DataCell(Text('A')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('Jane Smith')),
                      DataCell(Text('67890')),
                      DataCell(Text('75')),
                      DataCell(Text('80')),
                      DataCell(Text('B')),
                    ]),
                    // Tambahkan data lainnya jika perlu
                  ],
                ),
              ),
            ),

            // Tombol untuk kembali atau navigasi
            ElevatedButton(
              onPressed: () {
                // Arahkan ke halaman sebelumnya atau aksi lainnya
                Navigator.pop(context);
              },
              child: Text("Kembali"),
            ),
          ],
        ),
      ),
    );
  }
}
