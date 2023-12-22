import 'package:agri_mechanic/Screens/Form.dart';
import 'package:agri_mechanic/uihelper.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class mainscreen2 extends StatefulWidget {
  const mainscreen2({super.key});

  @override
  State<mainscreen2> createState() => _mainscreen2State();
}

class _mainscreen2State extends State<mainscreen2> {
  Logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Welcome!!',
              textStyle: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              speed: const Duration(milliseconds: 500),
            ),
            TypewriterAnimatedText(
              'Agro Mechanics...',
              textStyle: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
              speed: const Duration(milliseconds: 500),
            ),
          ],
          totalRepeatCount: 4,
          pause: const Duration(milliseconds: 1000),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Logout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: AssetImage("images/Logo.png")),
            ),
            SizedBox(
              height: 20,
            ),
            UiHelper.CustomButton(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => mainScreen()));
            }, "Old Customer"),
            SizedBox(
              height: 20,
            ),
            UiHelper.CustomButton(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => mainScreen()));
            }, "New Customer")
          ]),
    );
    ;
  }
}