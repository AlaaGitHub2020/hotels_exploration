import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/page_title.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/reservation_page_body.dart';

///Reservation Page
class ReservationPage extends StatelessWidget {
  ///Constructor
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: buildAppBar(context),
          body: const ReservationPageBody(),
        ),
      );

  ///App Bar
  AppBar buildAppBar(BuildContext context) => AppBar(
        backgroundColor: Theme.of(context).color.mainBackground,
        surfaceTintColor: Theme.of(context).color.mainBackground,
        title: const PageTitle(),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: SvgPicture.asset(ViewsConstants.icArrowBack),
        ),
      );
}
