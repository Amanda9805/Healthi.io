// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:healthi/blocks.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List blocs = [
    'Points',
    'Water.in',
    'Calories.in',
    'Calories.out',
    'ZZZ.in'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,
 
        title: const Text('HEALTHI.io'),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: const Icon(Icons.person_2),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: blocs.length,
        itemBuilder: (context, index) {
          return blocks(
            card: blocs[index],
            currentValue: 1250,
            target: 2500,
          );
        }
      ),
      bottomNavigationBar: Container(
        color: Color(0xF25E98E6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: GNav(
            backgroundColor: Color(0xF25E98E6),
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade400,
            gap: 5,
            onTabChange: (index){
              print(index);
            },
            padding: const EdgeInsets.all(10),
            tabs: [
              const GButton(
                icon: Icons.home,
                text: 'home',
              ),
              const GButton(
                icon: Icons.sports_gymnastics,
                text: 'challenges',
              ),
              const GButton(
                icon: Icons.chat_bubble,
                text: 'Connect',
              ),
              const GButton(
                icon: Icons.settings,
                text: 'settings',
              )
            ],
          ),
        ),
      ),
    );
  }
}