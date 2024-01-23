import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/pages/room/widgets/room_card/more_details_btn.dart';
import 'package:hotels_exploration/views/pages/room/widgets/room_card/price.dart';
import 'package:hotels_exploration/views/pages/room/widgets/room_card/room_name_text.dart';
import 'package:hotels_exploration/views/pages/room/widgets/room_card/room_peculiarities_list.dart';
import 'package:hotels_exploration/views/widgets/slider/image_slider.dart';

///Room Details
class RoomDetails extends StatelessWidget {
  ///Constructor
  const RoomDetails({
    required this.controller,
    required this.currentIndex,
    required this.imgList,
    required this.onPageChanged,
    required this.roomPeculiarities,
    required this.roomName,
    required this.roomPrice,
    required this.roomPricePer,
    super.key,
  });

  ///Carousel Controller
  final CarouselController controller;

  ///currentIndex
  final int currentIndex;

  ///images List
  final List<String?> imgList;

  /// onPageChanged Function
  final Function(int, CarouselPageChangedReason)? onPageChanged;

  ///Room Peculiarities list
  final List<String?> roomPeculiarities;

  ///Room Name
  final String roomName;

  ///Room Price
  final String roomPrice;

  ///Room PricePer
  final String roomPricePer;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlider(
              controller: controller,
              currentIndex: currentIndex,
              imgList: imgList,
              onPageChanged: onPageChanged,
            ),
            const SizedBox(height: 8),
            buildDetails()
          ],
        ),
      );

  ///Details
  Padding buildDetails() => Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoomNameText(roomName),
            const SizedBox(height: 8),
            RoomPeculiaritiesList(roomPeculiarities),
            const SizedBox(height: 4),
            const MoreDetails(),
            const SizedBox(height: 4),
            Price(roomPricePer: roomPricePer, roomPrice: roomPrice),
          ],
        ),
      );
}
