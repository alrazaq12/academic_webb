import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:http/http.dart';

class CekKHSScreen extends StatelessWidget {
  const CekKHSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cek KHS')),
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 30,
            child: Stack(
              children: [
                Container(
                  width: 1470,
                  height: 650,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 184, 176, 240),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  //page 1
                  top: 25,
                  left: 15,
                  child: Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: Center(
                      child: Text(
                        'SMSTR 1',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  //page 2
                  top: 25,
                  left: 65,
                  child: Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(blurRadius: 5, offset: Offset(1, 1)),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'SMSTR 2',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  //ini kotak khs
                  top: 50,
                  left: 15,
                  child: Stack(
                    children: [
                      Container(
                        width: 1440,
                        height: 500,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(1),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(
                                255,
                                184,
                                176,
                                240,
                              ).withOpacity(0.5),
                              blurRadius: 5,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 40,
                  right: 15,
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
          ),
        ],
      ),
    );
  }
}
