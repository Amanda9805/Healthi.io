import 'package:flutter/material.dart';
import 'package:healthi/blocks.dart';
import 'package:healthi/exercise.dart';
import 'package:healthi/profile.dart';
import 'challenge.dart';
import 'contactPage.dart';


class HomePage extends StatefulWidget {
  final int? currentValue;
  final Function(int)? updateCalories;

  HomePage(this.currentValue, this.updateCalories);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  final List<Map<String, dynamic>> blocsData = [
  {
  'card': 'Points',
  'currentValue': 1450,
  'target': 2500,
  'units': 'pts',
  'card2': '.         ',
  'accentColor': const Color(0xFFFFDE2E),
  'imageP': 'assets/images/high-score.png',
  },
  {
  'card': 'Water.',
  'currentValue': 800,
  'target': 2000,
  'units': 'ml',
  'card2': 'in       ',
  'accentColor': const Color(0xFF5E98E6),
  'imageP': 'assets/images/water.png',
  },
  {
  'card': 'Calories.',
  'currentValue': 1500,
  'target': 1800,
  'units': 'kcal',
  'card2': 'in  ',
  'accentColor': const Color(0xFF6DFA60),
  'imageP': 'assets/images/calories-calculator.png',
  },
  {
  'card': 'Calories.',
  'currentValue': 0,
  'target': 707,
  'units': 'kcal',
  'card2': 'out',
  'accentColor': const Color(0xFF995BFC),
  'imageP': 'assets/images/calories.png',
  },
  {
  'card': 'Sleep.',
  'currentValue': 7,
  'target': 8,
  'units': 'h',
  'card2': 'hours',
  'accentColor': const Color(0xFFFEA725),
  'imageP': 'assets/images/bed.png',
  },
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
      // appBar: AppBar(

      //   backgroundColor: Color(0xFF5E98E6),
      //   elevation: 0,

      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text(
      //         'HEALTHI.',
      //         style: TextStyle(
      //           fontFamily: 'Nunito',
      //           color: Colors.white,
      //         fontWeight: FontWeight.bold),
      //         ),
      //         const Text(
      //           'io',
      //           style: TextStyle(
      //             fontFamily: 'Nunito',
      //             color: Color(0xFF6DFA60),
      //             fontWeight: FontWeight.bold),
      //         )
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => const ProfilePage(title: "PROFILE")),
      //         );
      //       },
      //       icon: const Icon(Icons.person_3_outlined),
      //     )
      //   ],
      // ),
      body: Container(
      child: ListView.builder(
        itemCount: blocsData.length,
        itemBuilder: (context, index) {
          final data = blocsData[index];
          return GestureDetector(
            onTap: () {
              if (data['card2'] == 'out') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Exercise(
                      title: 'Exercise',
                      currCaloriesOut: data['currentValue'],
                      onCaloriesUpdated: (newValue) {
                        // Update the 'currentValue' of the corresponding block
                        setState(() {
                          blocsData[index]['currentValue'] = newValue;
                        });
                      },
                    ),
                  ),
                );
              }
            },
            child: blocks(
              card: data['card'],
              currentValue: data['currentValue'],
              target: data['target'],
              units: data['units'],
              Card2: data['card2'],
              accentColor: data['accentColor'],
              imageP: data['imageP'],
            ),
          );
        },
      ),
    ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Color(0xFF5E98E6),
      //   selectedIconTheme: IconThemeData(
      //     color: Color(0xF2474D5F),
      //     // backgroundColor: Colors.grey.shade400,
      //     // backgroundColor: Colors.black
      //   ),
      //   unselectedIconTheme: IconThemeData(
      //     color: Colors.black
      //   ),
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home_outlined),
      //         label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.sports_gymnastics_outlined),
      //         label: 'Challenges'
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.chat_bubble_outline),
      //         label: 'Professionals'
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTap,
      // ),
    );
  }
}



  /*@override
  Widget build(BuildContext context) {

    body: Container(
      child: ListView.builder(
        itemCount: blocsData.length,
        itemBuilder: (context, index) {
          final data = blocsData[index];
          return GestureDetector(
            onTap: () {
              if (data['card2'] == 'out') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Exercise(
                      title: 'Exercise',
                      currCaloriesOut: data['currentValue'],
                      onCaloriesUpdated: (newValue) {
                        // Update the 'currentValue' of the corresponding block
                        setState(() {
                          blocsData[index]['currentValue'] = newValue;
                        });
                      },
                    ),
                  ),
                );
              }
            },
            child: blocks(
              card: data['card'],
              currentValue: data['currentValue'],
              target: data['target'],
              units: data['units'],
              Card2: data['card2'],
              accentColor: data['accentColor'],
              imageP: data['imageP'],
            ),
          );
        },
      ),
    );
  }*/
