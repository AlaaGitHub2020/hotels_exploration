import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_body.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: const HotelBody(),
      ),
    );
  }
}
