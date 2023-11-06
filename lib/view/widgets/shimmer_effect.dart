import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
        gradient: const LinearGradient(colors: [
          Color.fromRGBO(0, 40, 80, 0.5),
          Color.fromRGBO(188, 190, 195, 0.494),
        ]),
        child: ListTile(
          title: Container(
            height: 20,
            color: Colors.white54,
          ),
          subtitle: Container(
            height: 10,
            color: Colors.white30,
          ),
        ));
  }
}
