import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: Text('I AM RICH'),
            backgroundColor: Colors.blueGrey[900],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('images/Diamond_image.png'),
              ),
              Text(
                'My Diamond',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ],
          )),
    ),
  );
}
