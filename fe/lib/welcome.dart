import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:healthi/challenge.dart';
import 'package:healthi/profile.dart';
import 'package:healthi/homePage.dart';
import 'package:healthi/contactPage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  int _selectedIndex=0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(null, null),
    Challenge(),
    Contact(title: 'CONTACT')
  ];

    @override
  void initState(){
    super.initState();
    // getUserDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // child: _widgetOptions .elementAt(_selectedIndex),
        child: WelcomePage(),
      ),
    );
  }
}