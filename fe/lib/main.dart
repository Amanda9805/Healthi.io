import 'package:flutter/material.dart';
import 'package:healthi/home.dart';
import 'package:healthi/welcome.dart';
import 'package:healthi/Login.dart';

import 'homePage.dart';

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
      // brightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xFF3C3C3C),
      useMaterial3: true,
    ),
    home: Login(),
  );
 }
}


