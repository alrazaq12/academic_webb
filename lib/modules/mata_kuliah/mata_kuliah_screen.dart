import 'package:flutter/material.dart';

class MataKuliahScreen extends StatelessWidget {
  const MataKuliahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Mata Kuliah'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daftar Mata Kuliah yang Diajarkan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Ganti dengan data yang sesuai
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Mata Kuliah ${index + 1}'),
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
