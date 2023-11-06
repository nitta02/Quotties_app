// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controll/quotes_controller.dart';
import 'package:flutter_application_1/view/screens/all_quotes.dart';
import 'package:flutter_application_1/view/screens/category_screen.dart';
import 'package:flutter_application_1/view/screens/day_quotes.dart';
import 'package:flutter_application_1/view/screens/random_screen.dart';
import 'package:flutter_application_1/view/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:velocity_x/velocity_x.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double customHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      child: Scaffold(
        appBar: appbarDetails(),
        body: GetBuilder<QuotesController>(
          init: QuotesController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    firstSection(customHeight),
                    const Divider(
                      indent: 20,
                      endIndent: 20,
                      thickness: 2,
                    ),
                    10.heightBox,
                    dayQuotes(customHeight, controller),
                    const Divider(
                      thickness: 2,
                    ),
                    10.heightBox,
                    randomQuotes(customHeight),
                    const Divider(
                      thickness: 2,
                    ),
                    10.heightBox,
                    checkMore(customHeight),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      onWillPop: () async {
        return await Get.dialog(
            AlertDialog(content: const Text('Are You Sure?'), actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back(
                result: true,
              );
            },
            child: const Text('Sure'),
          ),
        ]));
      },
    );
  }

  Container randomQuotes(double customHeight) {
    return Container(
      height: customHeight * 0.3,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(
            'assets/images/img6.png',
            height: 180,
            // width: 100,
          ),
          Positioned(
            right: 35,
            bottom: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Random quotes',
                  fontsize: 16,
                  fontweight: FontWeight.w400,
                ),
                20.heightBox,
                MaterialButton(
                  color: Colors.white,
                  // disabledColor: Colors.black12,
                  onPressed: () {
                    Get.to(() => const RandomScreen());
                  },
                  child: const CustomText(
                    text: 'Check Now',
                    fontsize: 14,
                    fontweight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container checkMore(double customHeight) {
    return Container(
      // decoration: BoxDecoration(
      // gradient: const LinearGradient(colors: [
      //   Color.fromRGBO(0, 40, 80, 0.5),
      //   Color.fromRGBO(188, 190, 195, 0.494),
      // ]),
      //     borderRadius: BorderRadius.circular(5)),
      height: customHeight * 0.25,
      width: double.infinity,
      child: Stack(
        // fit: StackFit.loose,

        alignment: Alignment.bottomRight,
        // fit: StackFit.loose,

        children: [
          Image.asset(
            'assets/images/img5.png',
            height: 180,
            // width: 100,
          ),
          Positioned(
            bottom: 5,
            left: 5,
            top: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Check all quotes',
                  fontsize: 16,
                  fontweight: FontWeight.w400,
                ),
                20.heightBox,
                MaterialButton(
                  color: Colors.white,
                  // disabledColor: Colors.black12,
                  onPressed: () {
                    Get.to(() => const AllQuotesScreen());
                  },
                  child: const CustomText(
                    text: 'Go',
                    fontsize: 18,
                    fontweight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container dayQuotes(double customHeight, QuotesController controller) {
    return Container(
        // decoration: BoxDecoration(
        //   gradient: const LinearGradient(colors: [
        //     Color.fromRGBO(0, 40, 80, 0.5),
        //     Color.fromRGBO(188, 190, 195, 0.494),
        //   ]),
        //   borderRadius: BorderRadius.circular(5),
        // ),
        height: customHeight * 0.3,
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(
              'assets/images/img1.png',
              height: 180,
            ),
            Positioned(
              right: 20,
              bottom: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                      text: 'Quotes of the Day',
                      fontsize: 16,
                      fontweight: FontWeight.w400),
                  20.heightBox,
                  MaterialButton(
                    color: Colors.white,
                    // disabledColor: Colors.black12,
                    onPressed: () {
                      Get.to(() => const QuotesDayScreen());
                    },
                    child: const CustomText(
                      text: 'Check Now',
                      fontsize: 14,
                      fontweight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Container firstSection(double customHeight) {
    return Container(
      // decoration: BoxDecoration(
      //     gradient: const LinearGradient(colors: [
      //       Color.fromRGBO(0, 40, 80, 0.5),
      //       Color.fromRGBO(188, 190, 195, 0.494),
      //     ]),
      //     borderRadius: BorderRadius.circular(5)),
      height: customHeight * 0.25,
      width: double.infinity,
      child: Stack(
        // fit: StackFit.loose,

        alignment: Alignment.bottomRight,
        // fit: StackFit.loose,

        children: [
          Image.asset(
            'assets/images/img2.png',
            height: 180,
            // width: 100,
          ),
          Positioned(
            bottom: 5,
            left: 5,
            top: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Hey,',
                  fontsize: 18,
                  fontweight: FontWeight.w200,
                ),
                5.heightBox,
                const CustomText(
                  text: 'All Quotes are Here.',
                  fontsize: 24,
                  fontweight: FontWeight.w800,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar appbarDetails() {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Get.to(() => const CategoryScreen());
        },
        icon: const Icon(IconlyLight.category),
        // color: Colors.black,
        iconSize: 25,
      ),
      actions: const [
        // IconButton(
        //   onPressed: () {
        //     Get.to(() => const ProfileScreen());
        //   },
        //   icon: const Icon(IconlyLight.profile),
        //   // color: Colors.black,
        //   iconSize: 25,
        // ),
      ],
    );
  }
}
