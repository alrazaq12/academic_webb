import 'package:flutter/material.dart';

class LihatMataKuliahScreen extends StatelessWidget {
  const LihatMataKuliahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transkrip Nilai')),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 30,
            child: Container(
              width: 1470,
              height: 550,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 95,
            right: 35,
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'CETAK',
                  style: TextStyle(color: Colors.blue.shade200),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
