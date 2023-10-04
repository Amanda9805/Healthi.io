import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final Function()? onTap;

  const myButton({
    super.key,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(horizontal: 25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF9AC5FF),
      ),
      child: Center(
        child: Text(
          'Login',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}