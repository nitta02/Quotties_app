// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controll/quotes_controller.dart';
import 'package:flutter_application_1/view/widgets/custom_text.dart';
import 'package:flutter_application_1/view/widgets/shimmer_effect.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class RandomScreen extends StatelessWidget {
  const RandomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double customHeight = MediaQuery.of(context).size.height;
    final controller = Get.put(QuotesController());

    Future<void> _refreshRandomQuotes() async =>
        await controller.refreshRandomQuotes();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(IconlyLight.arrow_left_2)),
        title: const CustomText(
          text: 'Random Quotes',
          fontsize: 20,
          fontweight: FontWeight.normal,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 5)),
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
                init: QuotesController(),
                builder: (controller) {
                  return LiquidPullToRefresh(
                    onRefresh: _refreshRandomQuotes,
                    child: ListView.builder(
                      itemCount: controller.randomQuotesList.length,
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
                                text: controller.randomQuotesList[index].a
                                    .toString(),
                                fontsize: 20,
                                fontweight: FontWeight.bold,
                              ),
                              CustomText(
                                text: controller.randomQuotesList[index].q
                                    .toString(),
                                fontsize: 18,
                                fontweight: FontWeight.w400,
                              ),
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
      ),
    );
  }
}
