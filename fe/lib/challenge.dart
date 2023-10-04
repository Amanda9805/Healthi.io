import 'package:flutter/material.dart';

import 'contactPage.dart';
import 'homePage.dart';
import 'package:url_launcher/url_launcher.dart';


class Challenge extends StatefulWidget {
  const Challenge({super.key});

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {

  Widget buildCalorieBurnChart() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 90,
          width: 370,// Adjust the height of the container to accommodate the graph
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(left: 138), // Adjust the horizontal padding as needed
            child: Row(
              children: <Widget>[
                // Circular Progress Indicator with Percentage
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 80, // Adjust the width of the circular progress graph
                      height: 80, // Adjust the height of the circular progress graph
                      child: CircularProgressIndicator(
                        value: 0.6, // Pass the progress value here (between 0 and 1)
                        strokeWidth: 10, // Adjust the stroke width as needed
                        backgroundColor: Colors.white54, // Background color of the circle
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.deepPurpleAccent), // Progress color
                      ),
                    ),
                    // Display percentage in the middle of the circular progress graph
                    Text(
                      "${(0.6 * 100).toStringAsFixed(0)}%",
                      style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent, // Text color
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget buildCalorieIntakeChallenge_weekly() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 145, // Adjust the height of the container to accommodate the graph
          width: 175,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 75.0, top: 5),
                    child: Icon(
                      Icons.fastfood_outlined,
                      color: Colors.lightBlueAccent
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 10.0),
                    child: Text(
                      "Weekly Calorie\n      Intake",
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, top: 10.0),
                    child: Text(
                      "Eat up to 16,800\n       calories",
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
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
  Widget buildCalorieIntakeChallenge_today() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 145, // Adjust the height of the container to accommodate the graph
          width: 175,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 75.0, top: 5),
                    child: Icon(
                        Icons.flash_on_outlined,
                        color: Colors.pinkAccent,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 10.0),
                    child: Text(
                      "Current Calorie\n      Intake",
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35.0, top: 10.0),
                    child: Text(
                      "12,100 calories",
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
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
  Widget buildWaterIntakeChallenge(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 129, // Adjust the height of the container to accommodate the graph
          width: 370,
          color: Colors.white70,
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 17.0, top: 30.0),
                    child: Text(
                      "Your weekly plan is\nalmost complete!",
                      style: TextStyle(fontSize: 14.5, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17.0, top: 10.0),
                    child: Text(
                      "8 of 14 litres",
                      style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
              // Circular Progress Indicator with Percentage
              Padding(
                padding: EdgeInsets.only(left: 110.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 70, // Adjust the width of the circular progress graph
                      height: 70, // Adjust the height of the circular progress graph
                      child: CircularProgressIndicator(
                        value: 0.57, // Pass the progress value here (between 0 and 1)
                        strokeWidth: 6, // Adjust the stroke width as needed
                        backgroundColor: Colors.white54, // Background color of the circle
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.blueAccent), // Progress color
                      ),
                    ),
                    // Display percentage in the middle of the circular progress graph
                    Text(
                      "${(0.57 * 100).toStringAsFixed(0)}%",
                      style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent, // Text color
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildSleepChallenge() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 129, // Adjust the height of the container to accommodate the graph
          width: 370,
          color: Colors.orangeAccent,
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 17.0, top: 25.0),
                    child: Text(
                      "You're nearing the\nweekly sleep achievement \nfor a healthier you!",
                      style: TextStyle(fontSize: 14.5, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17.0, top: 10.0),
                    child: Text(
                      "44 of 56 hours",
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              // Circular Progress Indicator with Percentage
              Padding(
                padding: EdgeInsets.only(left: 60.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 70, // Adjust the width of the circular progress graph
                      height: 70, // Adjust the height of the circular progress graph
                      child: CircularProgressIndicator(
                        value: 0.78, // Pass the progress value here (between 0 and 1)
                        strokeWidth: 6, // Adjust the stroke width as needed
                        backgroundColor: Colors.white54, // Background color of the circle
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.white), // Progress color
                      ),
                    ),
                    // Display percentage in the middle of the circular progress graph
                    Text(
                      "${(0.78 * 100).toStringAsFixed(0)}%",
                      style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
        enableDomStorage: false,
        enableJavaScript: true, // Enable JavaScript if needed
      ),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 5, right: 250),
              child: Text(
                "Sleep Challenge",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 3),
              child: buildSleepChallenge(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 5, right: 200),
              child: Text(
                "Water Intake Challenge",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 3),
              child: buildWaterIntakeChallenge(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 5, right: 130),
              child: Text(
                "Your Weekly Calories Burned Chart",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 5),
              child: buildCalorieBurnChart(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 5, right: 200),
              child: Text(
                "Calorie Intake Challenge",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: buildCalorieIntakeChallenge_weekly(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: buildCalorieIntakeChallenge_today(),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                  final Uri usnUrl = Uri.parse('https://www.usn.co.za/collections/proteins');
                  _launchURL(usnUrl);
                },
                child: Image.asset(
                  'images/usn.jpg',
                  width: 100,
                  height: 100,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }


}