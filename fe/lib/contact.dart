import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:healthi/blocks.dart';
import 'package:fl_chart/fl_chart.dart';


class ContactPage extends StatefulWidget {
  const ContactPage({super.key, required this.title});

  

  final String title;

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final double _progressValue = 0.7;

  @override
  void initState() {
    super.initState();
  }

  final List blocs = [
    'Points',
    'Water.in',
    'Calories.in',
    'Calories.out',
    'Sleep.in'
  ];

Widget buildProfilePic(){
  return const Padding(
    padding: EdgeInsets.all(10.0),
    child: Icon(
      Icons.person,
    ),
  );
}

Widget buildSleepProgress(){
  return Container(
    width: 200, // Set a specific width for the chart container
    height: 100, // Set a specific height for the chart container
    child: LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1),
        ),
        minX: 1,
        maxX: 7,
        minY: 5,
        maxY: 8,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(1, 5),
              FlSpot(2, 6),
              FlSpot(3, 7),
              FlSpot(4, 6),
              FlSpot(5, 6),
              FlSpot(6, 7),
              FlSpot(7, 7),
            ],
            isCurved: true,
            color: Colors.blue,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    ),
  );
}
 
Widget buildSearchSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 90, // Adjust the height of the container to accommodate the graph
        width: 370,
        color: const Color(0xF2474D5F),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.search,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Contact'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          buildSearchSection(),
        ],
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
            selectedIndex: -1,
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

