import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/hotels_ui_logic/hotels_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/models/hotel/hotel_model.dart';
import 'package:hotels_exploration/views/widgets/slider/image_slider.dart';

///Hotel Image Slider
class HotelImageSlider extends StatelessWidget {
  ///Constructor
  const HotelImageSlider({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HotelsUiLogicBloc, HotelsUiLogicState>(
        builder: (BuildContext context,
                HotelsUiLogicState hotelsUiLogicState) =>
            hotelsUiLogicState.maybeWhen(
                orElse: Container.new,
                actionSuccess: (
                  HotelModel hotelModel,
                  int? currentIndex,
                  CarouselController? controller,
                ) {
                  final List<String?> imgList = hotelModel.imageUrls ?? [];
                  return ImageSlider(
                    controller: controller!,
                    currentIndex: currentIndex!,
                    imgList: imgList,
                    onPageChanged:
                        (int index, CarouselPageChangedReason reason) {
                      context
                          .read<HotelsUiLogicBloc>()
                          .add(HotelsUiLogicEvent.imageSliderChanged(index));
                    },
                  );
                }),
      );
}
