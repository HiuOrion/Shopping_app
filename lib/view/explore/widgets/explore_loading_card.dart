import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ExploreLoadingCard extends StatelessWidget {
  const ExploreLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      shadowColor: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300 ,
            highlightColor: Colors.white,
            child: Column(
              children: [
                Flexible(
                flex: 1,
                child: Container()),
                Flexible(
                    flex: 1,
                    child: Container()),
              ],
            ),),
      ),
    );
  }
}
