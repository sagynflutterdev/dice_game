import 'package:dice_app/dice_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PlayersRegisterPage extends StatelessWidget {
  PlayersRegisterPage({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();
  TextEditingController playbir = TextEditingController();
  TextEditingController playeki = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: playbir,
                    cursorColor: const Color(0xffFFE93B),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(),
                      hintText: 'Name is Player-1',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Сураныч, боштукту толтуруңуз!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: playeki,
                    cursorColor: const Color(0xffFFE93B),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(),
                      hintText: 'Name is Player-2',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Сураныч, боштукту толтуруңуз!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return (DiceGame(
                                  playerbir: playbir.text,
                                  playereki: playeki.text,
                                ));
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing play')),
                          );
                        }
                        ;
                      },
                      child: const Text(
                        'Play',
                        style: TextStyle(
                          fontFamily: 'Playball',
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
