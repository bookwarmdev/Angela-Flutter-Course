import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Layout-Challenge-Specs"),
          ),
          backgroundColor: Colors.grey,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 100,
              color: Colors.red,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.amber,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                )
              ],
            ),
            Container(
              width: 100,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    ),
  );
}
