import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

///Reservation Route
@RoutePage()
class ReservationRoute extends StatelessWidget {
  ///Constructor
  const ReservationRoute({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: Text('ReservationRoute'),
      );
}
