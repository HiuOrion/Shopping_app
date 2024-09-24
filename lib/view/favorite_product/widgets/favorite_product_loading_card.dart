import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteProductLoadingCard extends StatelessWidget {
  const FavoriteProductLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: Colors.grey.shade300,
        child: Row(
          children: [
            SizedBox(
              width: 50,
              height: 80,
              child: Container(
                color: Colors.grey.shade300,
              ),
            ),
            SizedBox(width: 10), // Add spacing between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity, // Fill available width
                    height: 18,
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(height: 5), // Add spacing between text lines
                  Container(
                    width: double.infinity, // Fill available width
                    height: 18,
                    color: Colors.grey.shade300,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
