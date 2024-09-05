import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

class CarouselLoading extends StatefulWidget {
  const CarouselLoading({super.key});

  @override
  State<CarouselLoading> createState() => _CarouselLoadingState();
}

class _CarouselLoadingState extends State<CarouselLoading> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> imageslider = [
      'assets/images/banner2.jpg',
      'assets/images/banner3.jpg',
      'assets/images/banner4.jpg'
    ];
    // TODO: implement build
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          decoration: BoxDecoration(
            // color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            // đảm bảo tỉ lệ khung hình
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      viewportFraction: 1,

                      //cập nhật giá trị _current khi thay đổi trang
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(seconds: 1),
                    ),
                    items: imageslider
                        .map((item) => Container(
                              child: Center(
                                child: Image.asset(
                                  item,
                                  fit: BoxFit.cover,
                                  width: 1000,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          //Lặp qua các phần tử trong list imagesSlider
          children: imageslider.map((e) {
            int index = imageslider.indexOf(e); //lấy ra chỉ số
            return Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.1),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
