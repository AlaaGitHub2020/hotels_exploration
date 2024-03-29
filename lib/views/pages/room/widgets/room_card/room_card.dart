import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/pages/room/widgets/room_card/room_details.dart';
import 'package:hotels_exploration/views/pages/room/widgets/room_card/select_room_btn.dart';
import 'package:hotels_exploration/views/widgets/custom_card.dart';

///Room Card
class RoomCard extends StatelessWidget {
  ///Constructor
  const RoomCard({
    required this.controller,
    required this.currentIndex,
    required this.imgList,
    required this.onPageChanged,
    required this.roomName,
    required this.roomPrice,
    required this.roomPricePer,
    required this.roomPeculiarities,
    required this.onPressSelectRoom,
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

  ///Room Name
  final String roomName;

  ///Room Price
  final String roomPrice;

  ///Room PricePer
  final String roomPricePer;

  ///Room Peculiarities list
  final List<String?> roomPeculiarities;

  ///on Pressed selectRoom
  final Function()? onPressSelectRoom;

  @override
  Widget build(BuildContext context) => CustomCard(
        padding: EdgeInsets.zero,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          buildRoomDetails(),
          const SizedBox(height: 10),
          SelectRoomBtn(onPressSelectRoom: onPressSelectRoom),
          const SizedBox(height: 20),
        ],
      );

  ///Room Details
  RoomDetails buildRoomDetails() => RoomDetails(
        controller: controller,
        currentIndex: currentIndex,
        imgList: imgList,
        roomName: roomName,
        roomPrice: roomPrice,
        roomPricePer: roomPricePer,
        roomPeculiarities: roomPeculiarities,
        onPageChanged: onPageChanged,
      );
}
