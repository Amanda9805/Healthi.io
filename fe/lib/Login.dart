// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:healthi/AppleSignIn.dart';
import 'package:healthi/button.dart';
import 'package:healthi/clientDashboard.dart';
import 'package:healthi/googleSignIn.dart';
import 'package:healthi/home.dart';
import 'package:healthi/myTField.dart';
import 'package:healthi/homePage.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final uController = TextEditingController();
  final pController = TextEditingController();
  void signIn(){

  }
  void googleSignIn(){
    // Navigator.push(
    //   Context,
    //   MaterialPageRoute(builder: (context)=> const MyHomePage(title: 'Home'))
    // );
  }
  void appleSignIn(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // Welcome Back
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    ' Back',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 24,
                      color: Color(0xFF6DFA60),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    '!',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              // Login
              Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              // Picture/Logo
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset(
                  'assets/images/healthiioLogo.png',
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30),
              // Apple Sign In
              AppleButton(
                onTap: appleSignIn
              ),
              SizedBox(height: 10),
              // Google Sign in
              InkWell(
                child: googleButton(
                  onTap: googleSignIn,
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(title: 'Home'),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              // Email
              MyTextField(
                contollr: uController,
                obscure: false,
                hint: 'Name',
              ),
              SizedBox(height: 30),
              // Password
              MyTextField(
                contollr: pController,
                obscure: true,
                hint: 'Password',
              ),
              SizedBox(height: 10),
              // forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:25.0),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w100,
                        fontSize: 12,
                        color: Color(0xFF399197)
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Login Button
              InkWell(
                child: myButton(
                  onTap: signIn,
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              // Don't have account 
              Text(
                'Don\'t have an account yet?',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w100,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 5),
              // sign up
              Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: Color(0xFF399197),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}