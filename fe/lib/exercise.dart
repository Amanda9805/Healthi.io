import 'package:flutter/material.dart';

class Exercise extends StatefulWidget {
  const Exercise({
    super.key,
    required this.title,
    required this.currCaloriesOut,
    required this.onCaloriesUpdated,
  });

  final String title;
  final int currCaloriesOut;
  final Function(int) onCaloriesUpdated;

  @override
  State<Exercise> createState() => ExerciseState();
}

class ExerciseState extends State<Exercise> {
  bool isJoggingSelected = false;
  bool isCyclingSelected = false;
  bool isWalkingSelected = false;

  int joggingCalories = 298;
  int cyclingCalories = 260;
  int walkingCalories = 149;

  int displayTotal = 0;
  bool isSendingData = false;

  int calculate() {
    int totalCalories = 0;
    if (isJoggingSelected) {
      totalCalories += joggingCalories;
    }
    if (isCyclingSelected) {
      totalCalories += cyclingCalories;
    }
    if (isWalkingSelected) {
      totalCalories += walkingCalories;
    }

    int newTotal = widget.currCaloriesOut + totalCalories;
    widget.onCaloriesUpdated(newTotal);
    displayTotal = newTotal;
    return newTotal;
  }

  Widget buildAddExercises() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 350,
          width: 370,
          color: const Color(0xFF995BFC), //const Color(0xF2474D5F),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 15),
                child: Text(
                  'Select the activities you have performed',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: CheckboxListTile(
                  title: Text('Jogging: 298 kcal', style: TextStyle(color: Colors.white)),
                  value: isJoggingSelected,
                  onChanged: (newValue) {
                    setState(() {
                      isJoggingSelected = newValue!;
                      displayTotal = calculate();
                    });
                  },
                  checkColor: Colors.white54,
                ),
              ),
              CheckboxListTile(
                title: Text('Cycling: 260 kcal', style: TextStyle(color: Colors.white)),
                value: isCyclingSelected,
                onChanged: (newValue) {
                  setState(() {
                    isCyclingSelected = newValue!;
                    displayTotal = calculate();
                  });
                },
                checkColor: Colors.white54,
              ),
              CheckboxListTile(
                title: Text('Walking: 149 kcal', style: TextStyle(color: Colors.white)),
                value: isWalkingSelected,
                onChanged: (newValue) {
                  setState(() {
                    isWalkingSelected = newValue!;
                    displayTotal = calculate();
                  });
                },
                checkColor: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 15),
                child: Text(
                  'Total Calories Burned: ' + displayTotal.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 130.0, top: 25),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isSendingData = true;
                        });

                        // Simulate sending data to the home page (replace with actual logic)
                        await Future.delayed(Duration(seconds: 2));

                        int newTotalCalories = calculate();

                        setState(() {
                          isSendingData = false;
                        });
                      },
                      child: Text('Submit'),
                    ),
                    Visibility(
                      visible: isSendingData,
                      child: CircularProgressIndicator(
                        color: Colors.deepPurpleAccent,
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10),
        child: buildAddExercises(),
      ),
    );
  }
}
