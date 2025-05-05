import 'package:flutter/material.dart';

class CetakKHSScreen extends StatelessWidget {
  const CetakKHSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cetak KHS'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Fungsi untuk mencetak KHS
            print("Cetak KHS");
          },
          child: const Text("Cetak KHS"),
        ),
      ),
    );
  }
}
