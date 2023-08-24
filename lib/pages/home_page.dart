import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sol = 2;
  int on = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Тапшырма - 5',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: const Color(0xffFFE93B),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      sol = Random().nextInt(7);
                    });
                  },
                  child: Image.asset(
                    'assets/dice${sol == 0 ? sol + 1 : sol}.png',
                    //width: 130,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      on = Random().nextInt(7);
                    });
                  },
                  child: Image.asset(
                    'assets/dice${on == 0 ? on + 1 : on}.png',
                    //width: 130,
                  ),
                ),
              ),
            ),

            // Icon(Icons.phone),
            // Icon(Icons.phone),
          ],
        ),
      ),
    );
  }
}
