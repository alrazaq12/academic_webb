import 'package:flutter/material.dart';

class p1khs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('bebas isi gimana manh')),
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
                        offset: Offset(1, 1),
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
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ),
                Positioned(
                  //page 2
                  top: 25,
                  left: 65,
                  child: Container(width: 50, height: 30, color: Colors.white),
                ),

                Positioned(
                  //ini kotak khs page 1
                  top: 50,
                  left: 15,
                  child: Stack(
                    children: [
                      Container(
                        child: Text('page 1'),
                        width: 1440,
                        height: 560,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
