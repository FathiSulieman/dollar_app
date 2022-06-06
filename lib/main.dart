import 'package:dollar/exchange_rate/screens/lebanon_rate_widegt.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dollar Today Lebanon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LebanonRateWidget(),
    );
  }
}
