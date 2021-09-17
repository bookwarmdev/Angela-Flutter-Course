import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Fluttertoast.showToast(
                msg: "Bro send money na aje I broke",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          },
          backgroundColor: Colors.blueGrey,
          child: Icon(Icons.money_off_csred),
        ),
        appBar: AppBar(
          title: Center(
            child: Text('I Am Poor'),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/iam_poor.png'),
            ),
          ),
        ),
      ),
    ),
  );
}
