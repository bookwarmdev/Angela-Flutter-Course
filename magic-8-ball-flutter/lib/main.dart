import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  // const BallPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Me Anything'),
        backgroundColor: Colors.blue.shade900,
      ),
      backgroundColor: Colors.blue,
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  // const Ball({ Key? key }) : super(key: key);

  @override
  _BallState createState() => _BallState();
}

int ballNumber = 1;

class _BallState extends State<Ball> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: (){  
            
            setState(() {
              var num = new Random(); 
            ballNumber = num.nextInt(5) + 1;  
            });        
        },
        child: Image.asset('images/ball${ballNumber}.png'),
      ),
    );
  }
}
