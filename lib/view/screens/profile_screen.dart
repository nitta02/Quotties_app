import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/widgets/custom_icon.dart';
import 'package:flutter_application_1/view/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double coverHeight = 260;
    const double profileHieght = 150;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            IconlyLight.arrow_left_2,
            size: 40,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(children: [
        Container(
            margin: const EdgeInsets.only(
              bottom: profileHieght / 2,
            ),
            child: upperSection(coverHeight, profileHieght)),
        Column(
          children: [
            const CustomText(
              text: 'Name',
              fontsize: 30,
              fontweight: FontWeight.bold,
            ),
            const CustomText(
              text: 'gmail@gmail.com',
              fontsize: 25,
              fontweight: FontWeight.w500,
            ),
            15.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CustomIcon(
                      onPressed: () {},
                      iconSize: 20,
                      icon: Icons.edit,
                      color: Colors.white,
                    ),
                    const CustomText(
                      text: 'Edit',
                      fontsize: 18,
                      fontweight: FontWeight.w300,
                    )
                  ],
                ),
                50.widthBox,
                Column(
                  children: [
                    CustomIcon(
                      onPressed: () {},
                      iconSize: 20,
                      icon: Icons.logout,
                      color: Colors.white,
                    ),
                    const CustomText(
                      text: 'Log-Out',
                      fontsize: 18,
                      fontweight: FontWeight.w300,
                    )
                  ],
                )
              ],
            )
          ],
        )
      ]),
    );
  }

  Stack upperSection(double coverHeight, double profileHieght) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        coverImage(coverHeight),
        Positioned(
          top: coverHeight - profileHieght / 1.5,
          child: CircleAvatar(
            radius: profileHieght / 2,
            backgroundColor: Colors.white,
            backgroundImage: const AssetImage(
              'assets/images/img3.png',
            ),
          ),
        )
      ],
    );
  }

  Container coverImage(double coverHeight) {
    return Container(
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.black,
          width: 0.25,
        ))),
        child: Image.asset(
          'assets/images/welcome.png',
          height: coverHeight,
          fit: BoxFit.cover,
          width: double.infinity,
        ));
  }
}
