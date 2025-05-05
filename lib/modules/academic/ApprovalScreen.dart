// lib/modules/akademik/approval_screen.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApprovalScreen extends StatefulWidget {
  final String mataKuliahId; // Terima parameter mataKuliahId
  final String kelas;        // Terima parameter kelas

  const ApprovalScreen({super.key, required this.mataKuliahId, required this.kelas});

  @override
  _ApprovalScreenState createState() => _ApprovalScreenState();
}

class _ApprovalScreenState extends State<ApprovalScreen> {
  // Untuk menyimpan data pengajuan
  List<Map<String, dynamic>> data = [];

  // Fungsi untuk mengambil data pengajuan dari server
  Future<void> _fetchApprovalData() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:3001/api/get_pengajuan'), // Endpoint untuk mendapatkan pengajuan
      );

      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> approvalData = List<Map<String, dynamic>>.from(json.decode(response.body));
        setState(() {
          data = approvalData;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal mengambil data pengajuan')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Terjadi kesalahan saat mengambil data pengajuan')),
      );
    }
  }

  // Fungsi untuk menyetujui atau meminta revisi
  Future<void> _approveOrRevise(String status, String note) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3001/api/persetujuan'), // Endpoint untuk memberikan persetujuan atau revisi
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'mata_kuliah_id': widget.mataKuliahId,
          'kelas': widget.kelas,
          'status': status,  // Status "approved" or "revised"
          'note': note,      // Catatan revisi jika ada
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Persetujuan Berhasil')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Persetujuan Gagal')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Terjadi kesalahan saat memberi persetujuan')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchApprovalData(); // Fetch pengajuan saat layar pertama kali dimuat
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Persetujuan Akademik")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${data[index]['mata_kuliah']}'),
                    subtitle: Text('Status: ${data[index]['status']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () {
                        // Setujui atau revisi pengajuan
                        _approveOrRevise('approved', 'Semua nilai sudah sesuai');
                      },
                    ),
                    onTap: () {
                      // Tindakan jika perlu melihat detail pengajuan
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
