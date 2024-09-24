import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyCartLoadingCard extends StatelessWidget {
  const MyCartLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Tạo khoảng cách xung quanh
        child: Row(
          children: [
            // Phần hình ảnh sản phẩm (bên trái)
            Expanded(
              flex: 1,
              child: Container(
                height: 100, // Đặt chiều cao cố định cho khung hình ảnh
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10), // Bo góc
                ),
              ),
            ),
            const SizedBox(width: 10), // Khoảng cách giữa các phần
            // Phần thông tin sản phẩm (bên phải)
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5), // Bo góc
                    ),
                  ),
                  const SizedBox(height: 10), // Khoảng cách giữa các container
                  Container(
                    height: 20,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5), // Bo góc
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5), // Bo góc
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
