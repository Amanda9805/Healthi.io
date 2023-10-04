import 'package:flutter/material.dart';

class ChallengeCards extends StatefulWidget {
  const ChallengeCards({super.key});

  @override
  State<ChallengeCards> createState() => _ChallengeCardsState();
}

class _ChallengeCardsState extends State<ChallengeCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[100],
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.star),
              Text('4.9'),
            ],
          ),
          Text('Daily Calories Intake'),
          Text('Eat up to 2500 Calories')
        ],
      ),
    );
  }
}