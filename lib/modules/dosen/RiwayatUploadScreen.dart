import 'package:flutter/material.dart';

class RiwayatUploadScreen extends StatelessWidget {
  final String role;
  const RiwayatUploadScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    // Data riwayat upload untuk masing-masing dosen (dummy data)
    List<Map<String, dynamic>> riwayatUpload = [
      {
        'mata_kuliah': 'Matakuliah A',
        'status': 'Diproses',
        'note': '',
        'tanggal': '2025-04-15',
        'kelas': 'Kelas A',
      },
      {
        'mata_kuliah': 'Matakuliah B',
        'status': 'Disetujui',
        'note': '',
        'tanggal': '2025-04-14',
        'kelas': 'Kelas B',
      },
      {
        'mata_kuliah': 'Matakuliah C',
        'status': 'Revisi',
        'note': 'Perbaiki nilai UTS',
        'tanggal': '2025-04-10',
        'kelas': 'Kelas C',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Upload Nilai'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Riwayat Upload Nilai',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: riwayatUpload.length,
                itemBuilder: (context, index) {
                  var item = riwayatUpload[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        item['status'] == 'Diproses'
                            ? Icons.hourglass_empty
                            : item['status'] == 'Disetujui'
                                ? Icons.check_circle
                                : Icons.cancel,
                        color: item['status'] == 'Diproses'
                            ? Colors.orange
                            : item['status'] == 'Disetujui'
                                ? Colors.green
                                : Colors.red,
                      ),
                      title: Text('${item['mata_kuliah']} (${item['kelas']})'),
                      subtitle: Text(
                          'Status: ${item['status']}\nTanggal: ${item['tanggal']}'),
                      trailing: item['status'] == 'Revisi'
                          ? IconButton(
                              icon: const Icon(Icons.info),
                              onPressed: () {
                                _showRevisiNoteDialog(context, item['note']);
                              },
                            )
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Menampilkan catatan revisi
  void _showRevisiNoteDialog(BuildContext context, String note) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Catatan Revisi'),
          content: Text(note),
          actions: [
            TextButton(
              child: const Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
