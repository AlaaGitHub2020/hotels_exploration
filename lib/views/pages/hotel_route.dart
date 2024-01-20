import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotels_exploration/injection.dart';
import 'hotel/hotel_page.dart';

///Hotel Route
@RoutePage()
class HotelRoute extends StatelessWidget {
  ///Constructor
  const HotelRoute({super.key});

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: getIt.allReady(),
        builder: (BuildContext _, AsyncSnapshot<void> snapshot) {
          if (snapshot.hasData) {
            return const HotelPage();
          }
          return const Center(child: CircularProgressIndicator());
        },
      );
}
