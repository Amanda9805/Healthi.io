// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:healthi/challenge.dart';
import 'package:healthi/clientDashboard.dart';
import 'package:healthi/profile.dart';
import 'package:healthi/homePage.dart';
import 'package:healthi/contactPage.dart';

import 'clientDashboard.dart';
// import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double _progressValue = 0.7;
  String fname='';
  String lname='';
  String email='';
  int age=0;
  double weight=0.0;
  int height=0;
  int current_exercise=0;
  int current_sleep=0;
  int current_food=0;
  int current_water=0;

  int _selectedIndex=0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(null, null),
    Challenge(),
    Contact(title: 'CONTACT')
  ];

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState(){
    super.initState();
    // getUserDetails();
  }

  final List blocs = [
    'Points',
    'Water.in',
    'Calories.in',
    'Calories.out',
    'Sleep.in'
  ];

  // Future<void> getUserDetails() async {
  //   final res = await http.post(Uri.parse('http://localhost:3000/getUserDetails?email=rashford@gmail.com'));

  //   if(res.statusCode == 200){
  //     //debugPrint(res.body);
  //     User user= User.fromJson(jsonDecode(res.body));

  //     fname = user.fname;
  //     lname = user.lname;
  //     email = user.email;
  //     age = user.age;
  //     height = user.height;
  //     weight = user.weight;
  //     current_exercise=user.current_exercise;
  //     current_sleep=user.current_sleep;
  //     current_food= user.current_food;
  //     current_water=user.current_water;
  //   }
  //   else{
  //     throw Exception('Failed to get the json Object from: http://localhost:3000/getUserDetails');
  //   }
  // }

  final List<Map<String, dynamic>> blocsData = [
    {
      'card': 'Points',
      'currentValue': 1250,
      'target': 2500,
    },
    {
      'card': 'Water.in',
      'currentValue': 800,
      'target': 2000,
    },
    {
      'card': 'Calories.in',
      'currentValue': 1500,
      'target': 1800,
    },
    {
      'card': 'Calories.out',
      'currentValue': 500,
      'target': 600,
    },
    {
      'card': 'Sleep.in',
      'currentValue': 7,
      'target': 8,
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Color(0xFF5E98E6),
        elevation: 0,
 
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HEALTHI.',
                  style: TextStyle(
                    fontFamily: 'Nunito', 
                    color: Colors.white,
                  fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'io',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Color(0xFF6DFA60),
                      fontWeight: FontWeight.bold),
                  )
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'welcome,',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Marcus RashFord',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Color(0xFF6DFA60),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Sept 23, Sat',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage(title: 'Profile')),
              );
            },
            icon: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image.asset(
                      'assets/images/marcus.jpg',
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
            ),
          )
        ],
      ),
      body: Container(
        child: _widgetOptions .elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF5E98E6),
        selectedIconTheme: IconThemeData(
          color: Color(0xF2474D5F),
          // backgroundColor: Colors.grey.shade400,
          // backgroundColor: Colors.black
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.black
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_gymnastics_outlined),
              label: 'Challenges'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'Professionals'
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
