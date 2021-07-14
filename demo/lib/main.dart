import 'package:flutter/material.dart';
import 'package:yasam_dongusu/files/input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.lightBlue[300],
          primaryColor: Colors.lightBlue[300]),
      home: InputPage(),
    );
  }
}
