import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/pages/reservation/reservation_page.dart';

///Reservation Route
@RoutePage()
class ReservationRoute extends StatelessWidget {
  ///Constructor
  const ReservationRoute({super.key});

  @override
  Widget build(BuildContext context) => const ReservationPage();
}
