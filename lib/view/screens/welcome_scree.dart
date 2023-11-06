// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screens/main_screen.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/welcome.png'),
            5.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hey, Find',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    3.heightBox,
                    const Text(
                      'Your Favorite',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    5.heightBox,
                    const Text(
                      'Quotes Here',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {
                    // ignore: prefer_const_constructors
                    Get.to(() => MainScreen());
                  },
                  icon: const Icon(
                    CupertinoIcons.arrow_right_circle_fill,
                    size: 50,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
