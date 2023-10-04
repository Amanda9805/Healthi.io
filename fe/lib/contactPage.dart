import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healthi/specialist.dart';
import 'package:http/http.dart' as http;

class Contact extends StatefulWidget{
  const Contact({super.key, required this.title});

  final String title;

  @override
  State<Contact> createState() =>_Contact();
}

class _Contact extends State<Contact>{

  late List<Map<String, dynamic>> _specialists;

  List<String> titles=[
    'Physio',
    'Psychologist',
    'Chiropractor',
  ];

  List<String> images=[
    'images/grunner.jpg',
    'images/jose3.jpg',
    'images/pitso2.jpg'
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      _specialists = await getMedicalProfessionals();
      // if (_specialists.isNotEmpty) {
      //   var firstItem = _specialists[0];
      //   print(firstItem);
      // }
    } catch (e) {
      print('Error: $e');
      // Handle error here
    }
  }

  Future<List<Map<String, dynamic>>> getMedicalProfessionals() async {
    final apiUrl = 'http://localhost:3000/getMedicalProfessionals';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        // for (var item in data) {
        //   print(item);
        // }

        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          BuildMainTitle(),
          BuildFilterTiles(),
          Expanded(
            // Use an Expanded widget to make the ListView take the remaining space
            child: BuildSpecialistListView(),
          )
        ],
      ),
    );
  }


  Widget BuildSpecialistListView(){
    return FutureBuilder(
        future: getMedicalProfessionals(),
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
          }
          else {
            return
              ListView.builder(
                  itemCount: _specialists.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0,top: 15.0),
                                  child: Image.asset(
                                    images[index],
                                    width: 100,
                                    height: 100,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0,top: 10.0),
                                  child: Text(
                                    'Dr '+_specialists[index]['fname']+" "+_specialists[index]['lname'],
                                    style: TextStyle(color: Colors.black,fontFamily: 'Nunito',fontWeight: FontWeight.bold,fontSize: 15),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20.0,top: 10.0),
                                      child: Text(
                                        _specialists[index]['specialty'],
                                        style: TextStyle(color: Colors.black,fontFamily: 'Nunito',fontWeight: FontWeight.bold,fontSize: 13),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0, left: 1.0),
                                      child: Text(
                                        '.'+_specialists[index]['location'],
                                        style: TextStyle(color: Colors.black,fontFamily: 'Nunito',fontWeight: FontWeight.bold,fontSize: 13),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0,top: 10.0),
                                  child: Text(
                                    _specialists[index]['email'],
                                    style: TextStyle(color: Colors.black,fontFamily: 'Nunito',fontWeight: FontWeight.bold,fontSize: 15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0,top: 10.0),
                                  child: Text(
                                    _specialists[index]['cell'],
                                    style: TextStyle(color: Colors.black,fontFamily: 'Nunito',fontWeight: FontWeight.bold,fontSize: 15),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
          }
        }
    );
  }


  Widget BuildFilterTiles(){
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 35.0, top: 10.0),
                  child: Center(
                    child: Container(
                      width: 150, // Set the width as desired for the parent container
                      height: 150, // Set the height as desired for the parent container
                      decoration: BoxDecoration(
                        color: Color(0xFF4E8ADC), // Background color for the parent container
                        border: Border.all(
                          width: 0.0, // Border width for the parent container
                        ),
                        borderRadius: BorderRadius.circular(20.0), // Border radius for the parent container
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50, // Set the width as desired for the inner container
                              height: 50, // Set the height as desired for the inner container
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color for the inner container
                                borderRadius: BorderRadius.circular(10.0), // Border radius for the inner container
                              ),
                              child: Image.asset(
                                'images/psychologist.png', // Replace with the path to your image
                                width: 50, // Set the image width as desired
                                height: 50, // Set the image height as desired
                                fit: BoxFit.cover, // Adjust the image fit as needed
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Psychologist',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Center(
                    child: Container(
                      width: 150, // Set the width as desired for the parent container
                      height: 150, // Set the height as desired for the parent container
                      decoration: BoxDecoration(
                        color: Color(0xFF4FAF46), // Background color for the parent container
                        border: Border.all(
                          width: 0.0, // Border width for the parent container
                        ),
                        borderRadius: BorderRadius.circular(20.0), // Border radius for the parent container
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50, // Set the width as desired for the inner container
                              height: 50, // Set the height as desired for the inner container
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color for the inner container
                                borderRadius: BorderRadius.circular(10.0), // Border radius for the inner container
                              ),
                              child: Image.asset(
                                'images/dietician.png', // Replace with the path to your image
                                width: 50, // Set the image width as desired
                                height: 50, // Set the image height as desired
                                fit: BoxFit.cover, // Adjust the image fit as needed
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Dietician',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 35.0, top: 10.0),
                  child: Center(
                    child: Container(
                      width: 150, // Set the width as desired for the parent container
                      height: 150, // Set the height as desired for the parent container
                      decoration: BoxDecoration(
                        color: Color(0xFFFEA725 ), // Background color for the parent container
                        border: Border.all(
                          width: 0.0, // Border width for the parent container
                        ),
                        borderRadius: BorderRadius.circular(20.0), // Border radius for the parent container
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50, // Set the width as desired for the inner container
                              height: 50, // Set the height as desired for the inner container
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color for the inner container
                                borderRadius: BorderRadius.circular(10.0), // Border radius for the inner container
                              ),
                              child: Image.asset(
                                'images/physio.png', // Replace with the path to your image
                                width: 50, // Set the image width as desired
                                height: 50, // Set the image height as desired
                                fit: BoxFit.cover, // Adjust the image fit as needed
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Physio',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Center(
                    child: Container(
                      width: 150, // Set the width as desired for the parent container
                      height: 150, // Set the height as desired for the parent container
                      decoration: BoxDecoration(
                        color: Color(0xFF948BFF ), // Background color for the parent container
                        border: Border.all(
                          width: 0.0, // Border width for the parent container
                        ),
                        borderRadius: BorderRadius.circular(20.0), // Border radius for the parent container
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50, // Set the width as desired for the inner container
                              height: 50, // Set the height as desired for the inner container
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color for the inner container
                                borderRadius: BorderRadius.circular(10.0), // Border radius for the inner container
                              ),
                              child: Image.asset(
                                'images/chiroprotractor.png', // Replace with the path to your image
                                width: 50, // Set the image width as desired
                                height: 50, // Set the image height as desired
                                fit: BoxFit.cover, // Adjust the image fit as needed
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Chiropractor',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 30.0, top: 20.0),
              child: Text(
                'Doctors Available',
                style: const TextStyle(fontFamily: 'Nunito', fontSize: 25, fontWeight: FontWeight.bold,color: Color(0xFFFFFFFF)),
              ),
            )
          ],
        ),
      ],
    );
  }


  Widget BuildMainTitle(){
    return Column(
      children: const [
        SizedBox(
          width: double.infinity,
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
          children: [
            Text(
              'Connect',
              style: TextStyle(fontSize: 30, fontFamily: 'Nunito', color: Color(0xFF4FAF46), fontWeight: FontWeight.bold),
            ),
            Text(
              ' to a Doctor',
              style: TextStyle(fontSize: 30,fontFamily: 'Nunito', fontWeight: FontWeight.bold,color: Color(0xFFFFFFFF)),
            ),
          ],
        ),
      ],
    );
  }
}

