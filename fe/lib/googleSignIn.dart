import 'package:flutter/material.dart';

class googleButton extends StatelessWidget {
  final Function()? onTap;
  const googleButton({
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
            Image.asset('assets/images/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png', height: 30, width: 30,),
            Text(
              '     Sign in with Google',
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