import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/user1.png'),
              ),
              Center(
                child: Text(
                  'Bookwarm Dev',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Center(
                child: Text(
                  'mobile app developer'.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Source_Sans_Pro',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2.5,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 200.0,
                child: Divider(
                  color: Colors.teal.shade400,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: ListTile(
                  title: Text(
                    '+234 8183570403',
                    style: TextStyle(
                        fontFamily:
                            'fonts/Source_Sans_Pro/SourceSansPro-Regular.ttf',
                        fontSize: 16.0,
                        color: Colors.teal.shade900),
                  ),
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: ListTile(
                  title: Text(
                    'bookwarmdev@gmail.com',
                    style: TextStyle(
                        fontFamily:
                            'fonts/Source_Sans_Pro/SourceSansPro-Regular.ttf',
                        fontSize: 16.0,
                        color: Colors.teal.shade900),
                  ),
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
