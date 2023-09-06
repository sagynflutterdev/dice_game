import 'dart:math';

import 'package:flutter/material.dart';

class DiceGame extends StatefulWidget {
  const DiceGame({
    super.key,
    required this.playerbir,
    required this.playereki,
  });

  final String playerbir;
  final String playereki;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DiceGame> {
  int gamerFirstDiceIndex = 1;
  int gamerSecondDiceIndex = 1;
  int gamerSum = 0;

  //App
  int appSecondDiceIndex = 1;
  int appFirstDiceIndex = 1;
  int appSum = 1;

  Random random = Random();

  void changeDice() {
    gamerFirstDiceIndex = Random().nextInt(7);
    gamerSecondDiceIndex = Random().nextInt(7);
    gamerSum = gamerSum + gamerFirstDiceIndex + gamerSecondDiceIndex;
    setState(() {});
  }

  void changeAppDice() {
    appFirstDiceIndex = random.nextInt(6) + 1;
    appSecondDiceIndex = random.nextInt(6) + 1;
    appSum = appSum + appFirstDiceIndex + appSecondDiceIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Dice roller game',
          style: TextStyle(
            color: Colors.black,
            fontSize: 42,
            fontWeight: FontWeight.bold,
            fontFamily: 'Remachine',
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: const Color(0xffFFE93B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GamerIndex(
              text: widget.playerbir,
              playersSum: gamerSum,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () {
                        changeDice();
                      },
                      child: Image.asset(
                        'assets/icons/dice${gamerFirstDiceIndex == 0 ? gamerFirstDiceIndex + 1 : gamerFirstDiceIndex}.png',
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
                        changeDice();
                      },
                      child: Image.asset(
                        'assets/icons/dice${gamerSecondDiceIndex == 0 ? gamerSecondDiceIndex + 1 : gamerSecondDiceIndex}.png',
                        //width: 130,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () {
                        changeAppDice();
                      },
                      child: Image.asset(
                        'assets/icons/dice${appFirstDiceIndex == 0 ? appFirstDiceIndex + 1 : appFirstDiceIndex}.png',
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
                        changeAppDice();
                      },
                      child: Image.asset(
                        'assets/icons/dice${appSecondDiceIndex == 0 ? appSecondDiceIndex + 1 : appSecondDiceIndex}.png',
                        //width: 130,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            GamerIndex(
              text: widget.playereki,
              playersSum: appSum,
            ),
          ],
        ),
      ),
    );
  }
}

class GamerIndex extends StatelessWidget {
  const GamerIndex({
    super.key,
    required this.text,
    required this.playersSum,
  });
  final int playersSum;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 50,
      width: 400,
      child: Center(
        child: Text(
          '$text: $playersSum',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 34,
            fontWeight: FontWeight.bold,
            fontFamily: 'Playball',
          ),
        ),
      ),
    );
  }
}
