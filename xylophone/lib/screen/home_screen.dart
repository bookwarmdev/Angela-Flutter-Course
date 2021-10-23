import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

void playSound(int value) {
  final player = AudioCache();
  player.play('note$value.wav');
}

Expanded setColorPalette({Color? color, int? getMusicSound}) {
  return Expanded(
    child: InkWell(
      onTap: (){
        playSound(getMusicSound!);
      },
      child: Container(color: color,),
    ),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            setColorPalette(color: Colors.red, getMusicSound: 1),
            setColorPalette(color: Colors.orange, getMusicSound: 2),
            setColorPalette(color: Colors.yellow, getMusicSound: 3),
            setColorPalette(color: Colors.green, getMusicSound: 4),
            setColorPalette(color: Colors.teal, getMusicSound: 5),
            setColorPalette(color: Colors.blue, getMusicSound: 6),
            setColorPalette(color: Colors.purple, getMusicSound: 7),
          ],
        ),
      ),
    );
  }
}
