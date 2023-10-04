// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class blocks extends StatelessWidget{
  final String card;
  final int target;
  final int currentValue;

  blocks({
    required this.card,
    required this.currentValue,
    required this.target
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        width: 350,
        decoration: BoxDecoration(
          color: Color(0xF2474D5F),
          borderRadius: BorderRadius.circular(25)
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Text(
                      card,
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      currentValue.toString() + '/' + target.toString(),
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 40),
                    LinearPercentIndicator(
                      animation: true,
                      animationDuration: 800,
                      lineHeight: 15,
                      percent: currentValue/target,
                      progressColor: Color(0xF29AC5FF),
                      backgroundColor: Colors.white,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}