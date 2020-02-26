import 'package:flutter/material.dart';
import 'package:flutter_wallet_transaction/src/app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: App(title: 'Flutter Demo Home Page'),
    );
  }
}
