import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:healthi/exercise.dart';

class blocks extends StatefulWidget {
  final String card;
  final int target;
  int currentValue; // Change this line
  final String units;
  final String Card2;
  final Color accentColor;
  final String imageP;

  blocks({
    required this.card,
    required this.currentValue,
    required this.target,
    required this.units,
    required this.Card2,
    required this.accentColor,
    required this.imageP,
  });

  @override
  State<blocks> createState() => blocksState();
}

class blocksState extends State<blocks> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          if (widget.Card2 == 'out') {
            // Navigate to the new page when "Calories.out" is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Exercise(
                  title: 'Exercise',
                  currCaloriesOut: widget.currentValue,
                  onCaloriesUpdated: (newValue) {
                    // Update the 'currentValue' of the corresponding block
                    setState(() {
                      widget.currentValue = newValue;
                    });
                  },
                ),
              ),
            );
          }
        },
        child: Container(
          height: 250,
          width: 350,
          decoration: BoxDecoration(
            color: Color(0xF2474D5F),
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text(
                      widget.card,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 45,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.Card2,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 45,
                        color: widget.accentColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(
                        widget.imageP,
                        width: 83,
                        height: 83,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.currentValue.toString() + widget.units + '/',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 26,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.target.toString(),
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 26,
                        fontWeight: FontWeight.w100,
                        color: widget.accentColor,
                      ),
                    ),
                    Text(
                      widget.units,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 26,
                        fontWeight: FontWeight.w100,
                        color: widget.accentColor,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40),
                LinearPercentIndicator(
                  animation: true,
                  animationDuration: 800,
                  lineHeight: 15,
                  percent: widget.currentValue / widget.target,
                  progressColor: widget.accentColor,
                  backgroundColor: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
