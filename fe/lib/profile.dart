import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:healthi/blocks.dart';
import 'package:healthi/contact.dart';
// import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';
import 'package:healthi/user.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import 'challenge.dart';
import 'contactPage.dart';
import 'homePage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});

  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double _progressValue = 0.7;

  String fname='';
  String lname='';
  String email='';
  String fullname = '';
  int age=0;
  double weight=0.0;
  int height=0;
  Map<String,dynamic> weekly_hours=Map();


  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  Future<User> getUserDetails() async {
    try {
      final res = await http.post(Uri.parse('http://localhost:3000/getUserDetails?email=rashford@gmail.com'));

      if (res.statusCode == 200) {
        User user = User.fromJson(jsonDecode(res.body));
        return user;
      } else {
        throw Exception('Failed to get data: ${res.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }


  final List blocs = [
    'Points',
    'Water.in',
    'Calories.in',
    'Calories.out',
    'Sleep.in'
  ];

  int _selectedIndex=0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(null, null),
    Challenge(),
    Contact(title: 'CONTACT',)
  ];

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //title: Text('Marcus Rashford'),
        //centerTitle: true,
      ),
      body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: buildTitleSection(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: buildProfileInfoRow(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
            child: buildSleepGraph(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.0),
            child:buildSleepInfoSection()
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: buildBMISection(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.0, bottom: 10),
            child: buildMoodSection(),
          ),
        ],
      ),
    ),
    );
  }

  Widget buildTitleSection() {
  return FutureBuilder<User>(
    future: getUserDetails(), // Assuming getUserDetails returns a Future<User>
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // While the data is being fetched, show a loading indicator.
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        // If there is an error, display an error message.
        return Text('Error: ${snapshot.error}');
      } else if (!snapshot.hasData) {
        // Handle the case when no data is received.
        return Text('No data available');
      } else {
        // Data has been successfully fetched. Build your UI using snapshot.data.
        final user = snapshot.data;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Text(
                "Your Profile",
                style: TextStyle(
                  fontFamily: 'Nunito', 
                  fontSize: 22,
                  color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  'images/marcus.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                "${user!.fname} ${user.lname}",
                style: const TextStyle(
                  fontFamily: 'Nunito', 
                  fontSize: 18,
                  color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                user.email,
                style: const TextStyle(
                  fontFamily: 'Nunito', 
                  fontSize: 11,
                  color: Colors.white),
              ),
            ),
          ],
        );
      }
    },
  );
}


  Widget buildProfileInfoRow() {
  return FutureBuilder<User>(
    future: getUserDetails(), // Assuming getUserDetails returns a Future<User>
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // While the data is being fetched, show a loading indicator.
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        // If there is an error, display an error message.
        return Text('Error: ${snapshot.error}');
      } else if (!snapshot.hasData) {
        // Handle the case when no data is received.
        return Text('No data available');
      } else {
        // Data has been successfully fetched. Build your UI using snapshot.data.
        final user = snapshot.data;
        return Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    user!.age.toString(),
                    style: TextStyle(
                      fontSize: 27, 
                      fontFamily: 'Nunito',
                      color: Colors.white),
                  ),
                  Text(
                    'Age',
                    style: TextStyle(
                      fontSize: 12, 
                      fontFamily: 'Nunito',
                      color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    user.weight.toString(),
                    style: TextStyle(
                      fontSize: 27, 
                      fontFamily: 'Nunito',
                      color: Colors.white),
                  ),
                  Text(
                    'Weight',
                    style: TextStyle(
                      fontSize: 12, 
                      fontFamily: 'Nunito',
                      color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    user.height.toString(),
                    style: TextStyle(
                      fontSize: 27, 
                      fontFamily: 'Nunito',
                      color: Colors.white),
                  ),
                  Text(
                    'Height',
                    style: TextStyle(
                      fontSize: 12, 
                      fontFamily: 'Nunito',
                      color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        );
      }
    },
  );
}


  Widget buildSleepGraph() {
    return FutureBuilder<User>(
      future: getUserDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return Text('No data available');
        } else {
          final user = snapshot.data;
          final sleepData = user?.weekly_sleeping_hours; // Assuming you have a property called sleepData in your User class

          // Convert sleepData into FlSpot list
          List<FlSpot> sleepSpots = [];

          for (int i = 0; i < sleepData!.length; i++) {
            sleepSpots.add(FlSpot((i + 1).toDouble(), sleepData[i])); // Assuming sleepData is a List<double>
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: 350,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFF37434D), width: 1),
                ),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    minX: 0.6,
                    maxX: sleepData.length.toDouble(), // Adjust based on the length of sleepData
                    minY: sleepData.reduce((a, b) => a < b ? a : b), // Min value in sleepData
                    maxY: sleepData.reduce((a, b) => a > b ? a : b), // Max value in sleepData
                    lineBarsData: [
                      LineChartBarData(
                        spots: sleepSpots,
                        isCurved: true,
                        color: Color(0xF25E98E6),
                        dotData: FlDotData(show: true),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }



  Widget buildSleepInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 95, // Adjust the height of the container to accommodate the graph
          width: 370,
          color: const Color(0xF2474D5F),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 35),
                    child: Icon(
                      Icons.bed_outlined,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17.0, top: 35.0),
                    child: Text(
                      "SLEEP",
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    ),
                  ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 55.0, bottom: 5.0, top: 30),
                    child: Text(
                      "07h30m",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Nunito'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 55.0, bottom: 5.0),
                    child: Center(
                      child: Text(
                        "Your 7-day average",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontFamily: 'Nunito'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateBMI(double w, double h)
  {
    double hMSq = (h/100)*(h/100);
    return (w/hMSq);
  }
  Widget buildBMISection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: FutureBuilder<User>(
            future: getUserDetails(), // Use your existing function to fetch user data
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Show a loading indicator while fetching data
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                if (snapshot.data != null) {
                  final user = snapshot.data;
                  double bmi = calculateBMI(user!.weight, user.height as double);
                  return Container(
                    height: 95,
                    width: 370,
                    color: const Color(0xF2474D5F),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Icon(Icons.scale_outlined),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20.0, top: 35.0),
                              child: Text(
                                "BMI",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'Nunito'
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 70.0, bottom: 5.0),
                          child: Text(
                            bmi.toStringAsFixed(1), // Format BMI to one decimal place
                            style: TextStyle(
                              fontFamily: 'Orbitron',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 177, 236, 109),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Text('User data not found');
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildSleepGraphSection() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 100,
                    width: 370,
                    color: const Color(0xF2474D5F),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        
                      ],
                  ),
                ),
              ),
      )
    );
  }

  Color progressBarColor = Colors.white;

  Map<String, Color> moodColors = {
    "Joyful": Color.fromARGB(255, 247, 222, 1),
    "Anxious": Color.fromARGB(255, 250, 92, 0),
    "Excited": Color.fromARGB(255, 134, 248, 3),
    "Sad": Color.fromARGB(255, 1, 23, 119),
  };

  // Function to update progress bar color based on mood
  void updateProgressBarColor(String mood) {
    setState(() {
      progressBarColor = moodColors[mood] ?? Colors.blue; // Default to blue if mood not found
    });
  }


Widget buildMoodSection() {
  double progress = 1.0; // Replace with your actual progress value between 0 and 1

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 110, // Set a specific height for the container
          width: 370,
          color: const Color(0xF2474D5F),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 10), // Add spacing between icon and text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 15),
                    child: Text(
                      "How are you feeling today?",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Nunito',
                        color: Colors.white,),
                    ),
                  ),
                  // Checkboxes
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 10),
                    child: Row(
                      children: <Widget>[
                        buildMoodCheckbox("Joyful"),
                        buildMoodCheckbox("Anxious"),
                        buildMoodCheckbox("Excited"),
                        buildMoodCheckbox("Sad"),
                      ],
                    ),
                  ),
                    SizedBox(height: 10), // Add spacing
                    Container(
                      width: 350, // Set the desired width here
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
                        border: Border.all(color: progressBarColor), // Optional border for styling
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0), // Same radius as the container
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 7, // Set the minimum height (which affects width) as needed
                          backgroundColor: Colors.grey, // Color behind the progress bar
                          valueColor: AlwaysStoppedAnimation<Color>(progressBarColor), // Color of the progress bar
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

  Widget buildMoodCheckbox(String mood) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: false, // You can set the initial value here
          onChanged: (bool? newValue) {
            // Handle checkbox change
            if (newValue == true) {
              updateProgressBarColor(mood);
            }
          },
        ),
        Text(mood, style: const TextStyle(color: Colors.white)),
      ],
    );
  }






}

