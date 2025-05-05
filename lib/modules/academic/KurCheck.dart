import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Kurikcheck(title: 'Flutter Demo Home Page'),
    );
  }
}

class Kurikcheck extends StatefulWidget {
  Kurikcheck({required this.title});

  final String title;

  @override
  _KurikcheckState createState() => _KurikcheckState();
}

class _KurikcheckState extends State<Kurikcheck> {
  List<Map<String, dynamic>> data = [
    {'matkul': 'Algoritma', 'value': false},
    {'matkul': 'Bahasa Indonesia', 'value': false},
    {'matkul': 'Bahasa Inggris I', 'value': false},
    {'matkul': 'Bahasa Inggris II', 'value': false},
    {'matkul': 'Bahasa Inggris III', 'value': false},
    {'matkul': 'Pendidikan Pancasila', 'value': false},
    {'matkul': 'Bahasa Indonesia', 'value': false},
    {'matkul': 'Pemrograman VB.net I', 'value': false},
    {'matkul': 'Pemrograman VB.net II', 'value': false},
    {'matkul': 'Pemrograman Web I', 'value': false},
    {'matkul': 'Pemrograman Web II', 'value': false},
    {'matkul': 'Arsitektur Komputer', 'value': false},
    {'matkul': 'Enterprise Resource Planning', 'value': false},
    {'matkul': 'Decision Support System', 'value': false},
    {'matkul': 'Rangkaian Listrik', 'value': false},
    {'matkul': 'Praktikum Rangkaian Listrik', 'value': false},
    {'matkul': 'Dasar Elektro', 'value': false},
    {'matkul': 'Praktikum Elektronika Dasar', 'value': false},
    {'matkul': 'Microprocessor', 'value': false},
    {'matkul': 'Microcontroller', 'value': false},
    {'matkul': 'Artificial Intelligence', 'value': false},
    {'matkul': 'Bahasa Otomata', 'value': false},
    {'matkul': 'Proyek Inovasi Teknologi', 'value': false},
    {'matkul': 'Pemodelan dan Simulasi', 'value': false},
    {'matkul': 'Testing dan Implementasi Sistem', 'value': false},
    {'matkul': 'Sistem PLC', 'value': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(data[index]['matkul']),
            value: data[index]['value'],
            onChanged: (value) {
              setState(() {
                data[index]['value'] = value!;
              });
            },
          );
        },
      ),
    );
  }
}
