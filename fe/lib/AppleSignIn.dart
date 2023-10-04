import 'package:flutter/material.dart';

class AppleButton extends StatelessWidget {
  final Function()? onTap;
  const AppleButton({
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
        child: Row(
          children: [
            Image.asset('assets/images/apple-logo-transparent.png', height: 30, width: 30,),
            Text(
              '     Sign in with Apple',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}