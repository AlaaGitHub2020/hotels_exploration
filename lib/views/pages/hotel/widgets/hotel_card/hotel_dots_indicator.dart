import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/hotels_ui_logic/hotels_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/models/hotel/hotel_model.dart';
import 'package:hotels_exploration/views/widgets/dots_indicator.dart';

///Hotel Dots Indicator
class HotelDotsIndicator extends StatelessWidget {
  ///Constructor
  const HotelDotsIndicator({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HotelsUiLogicBloc, HotelsUiLogicState>(
        builder: (_, HotelsUiLogicState hotelsUiLogicState) =>
            hotelsUiLogicState.maybeWhen(
                orElse: Container.new,
                actionSuccess: (
                  HotelModel hotelModel,
                  int? currentIndex,
                  CarouselController? controller,
                ) {
                  final List<String?> imgList = hotelModel.imageUrls ?? [];
                  return DotsIndicator(
                    controller: controller!,
                    currentIndex: currentIndex!,
                    imgList: imgList,
                  );
                }),
      );
}
