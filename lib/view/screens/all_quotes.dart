// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants.dart';
import 'package:flutter_application_1/controll/quotes_controller.dart';
import 'package:flutter_application_1/view/widgets/custom_icon.dart';
import 'package:flutter_application_1/view/widgets/custom_text.dart';
import 'package:flutter_application_1/view/widgets/shimmer_effect.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AllQuotesScreen extends StatelessWidget {
  const AllQuotesScreen({Key? key});

  @override
  Widget build(BuildContext context) {

    double customHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(IconlyLight.arrow_left_2),
        ),
        title: const CustomText(
          text: 'ALL',
          fontsize: 20,
          fontweight: FontWeight.normal,
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 2), () {
            // Placeholder for your loading duration
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView.builder(
                itemCount: snapshot.data,
                itemBuilder: (context, index) {
                  return const CustomShimmer();
                },
              );
            } else {
              return GetBuilder<QuotesController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.listData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          height: customHeight * 0.25,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(0, 40, 80, 0.5),
                                Color.fromRGBO(188, 190, 195, 0.494),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: controller.listData[index].a,
                                    fontsize: 16,
                                    fontweight: FontWeight.bold,
                                  ),
                                  Obx(
                                    () => CustomIcon(
                                      onPressed: () {
                                        if (controller.favQuotesList.contains(
                                            controller.listData[index]
                                                .toString())) {
                                          controller.removeFav(controller
                                              .listData[index]
                                              .toString());
                                        } else {
                                          controller.favQuotesList.add(
                                              controller.listData[index]
                                                  .toString());
                                        }

                                        Get.snackbar(
                                          'Favorite Quotes',
                                          'Added to favorite quotes',
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 3),
                                        );
                                        // controller.addTofavQuotes('quotes');
                                      },
                                      iconSize: 20,
                                      icon: controller.favQuotesList.contains(
                                              controller.listData[index]
                                                  .toString())
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: controller.favQuotesList.contains(
                                              controller.listData[index]
                                                  .toString())
                                          ? color3
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: CustomText(
                                    text: controller.listData[index].q,
                                    fontsize: 20,
                                    fontweight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
