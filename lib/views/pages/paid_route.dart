import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/pages/paid/paid_page.dart';

///Paid Route
@RoutePage()
class PaidRoute extends StatelessWidget {
  ///Constructor
  const PaidRoute({super.key});

  @override
  Widget build(BuildContext context) => const PaidPage();
}
