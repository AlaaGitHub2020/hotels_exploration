import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotels_exploration/views/widgets/dots_indicator.dart';

///Images Slider
class ImagesSlider extends StatefulWidget {
  ///Constructor
  const ImagesSlider({super.key});

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

final List<String> imgList = [
  'https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg',
  'https://media.admagazine.ru/photos/61408b2f4311246f36873963/16:9/w_1280,c_limit/w2000%20-%202020-07-14T164056.159.jpg',
  'https://travelata.ru/blog/wp-content/uploads/2019/06/Starlight-Convention-Center-Thalasso-Spa.jpg'
];

final List<Widget> imageSliders = imgList
    .map((item) => Card(
          elevation: 0,
          // color: Theme.of(context).scaffoldBackgroundColor,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              item,
              fit: BoxFit.cover,
              width: 343,
              height: 257,
            ),
          ),
        ))
    .toList();

class _ImagesSliderState extends State<ImagesSlider> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          buildSlider(),
          DotsIndicator(
            controller: _controller,
            currentIndex: _currentIndex,
            imgList: imgList,
          ),
        ],
      );

  ///Slider
  CarouselSlider buildSlider() => CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 2,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      );
}
