import 'package:flutter/material.dart';
import 'package:parcial4/app/ui/pages/home/home_page.dart';

void main() {
  runApp(const Parcial4());
}

class Parcial4 extends StatelessWidget {
  const Parcial4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Maps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}