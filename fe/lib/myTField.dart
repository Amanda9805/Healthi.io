import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final contollr;
  final String hint;
  final bool obscure;
  
  const MyTextField({
    super.key,
    required this.contollr,
    required this.hint,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: contollr,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w100
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF6DFA60)),
          ),
        ),
      ),
    );
  }
}