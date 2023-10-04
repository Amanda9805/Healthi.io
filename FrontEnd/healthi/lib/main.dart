import 'package:flutter/material.dart';
import 'package:healthi/home.dart';

void main() {
  runApp(const HEALTHI());
}

class HEALTHI extends StatelessWidget {
 const HEALTHI({super.key});

 @override
 Widget build(BuildContext context){
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Healthi',
    theme: ThemeData(
      brightness: Brightness.dark,
      backgroundColor: Color(0xFF3C3C3C),

    ),
    home: const MyHomePage(title: 'HEALTHI'),
  );
 }
}



