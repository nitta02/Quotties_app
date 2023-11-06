import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/category_constants.dart';
import 'package:flutter_application_1/controll/quotes_controller.dart';
import 'package:flutter_application_1/view/screens/all_quotes.dart';
import 'package:flutter_application_1/view/widgets/shimmer_effect.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double customHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              IconlyLight.arrow_left_2,
              // color: Colors.black,
            )),
      ),
      body: FutureBuilder(
        future: Future.delayed(const Duration(
          seconds: 5,
        )),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return const CustomShimmer();
              },
            );
          } else {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<QuotesController>(
                  init: QuotesController(),
                  builder: (controller) {
                    return GridView.builder(
                      itemCount: categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => const AllQuotesScreen());
                          },
                          child: Container(
                            height: customHeight * 0.5,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.blueGrey,
                            ),
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              categories[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ));
          }
        },
      ),
    );
  }
}
