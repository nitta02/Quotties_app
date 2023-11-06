import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants.dart';
import 'package:flutter_application_1/controll/quotes_controller.dart';
import 'package:flutter_application_1/view/widgets/custom_icon.dart';
import 'package:flutter_application_1/view/widgets/custom_text.dart';
import 'package:flutter_application_1/view/widgets/shimmer_effect.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:velocity_x/velocity_x.dart';

class QuotesDayScreen extends StatelessWidget {
  const QuotesDayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = QuotesController();
    final double customHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(IconlyLight.arrow_left_2)),
        title: const CustomText(
          text: 'Quotes Day',
          fontsize: 20,
          fontweight: FontWeight.normal,
        ),
      ),
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CustomShimmer();
              },
            );
          } else {
            return GetBuilder<QuotesController>(
              init: QuotesController(),
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: controller.dayQuotesList.length,
                    itemBuilder: (context, index) {
                      // print('Items${controller.dayQuotesList.length}');
                      return Container(
                        height: customHeight * 0.25,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                              text:
                                  controller.dayQuotesList[index].a.toString(),
                              fontsize: 20,
                              fontweight: FontWeight.bold,
                            ),
                            CustomText(
                              text:
                                  controller.dayQuotesList[index].q.toString(),
                              fontsize: 18,
                              fontweight: FontWeight.w400,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomIcon(
                                  onPressed: () {},
                                  iconSize: 25,
                                  icon: Icons.favorite_border,
                                  color: color3,
                                ),
                                30.widthBox,
                                CustomIcon(
                                  onPressed: () {},
                                  iconSize: 25,
                                  icon: Icons.share,
                                  color: Colors.green,
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
