import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/views/pages/room/widgets/page_title.dart';
import 'package:hotels_exploration/views/pages/room/widgets/room_page_body.dart';

///Room Page
class RoomPage extends StatelessWidget {
  ///Contractor
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: buildAppBar(context),
          body: const RoomPageBody(),
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

  ///Card Decoration
  BoxDecoration buildCardDecoration(BuildContext context) => BoxDecoration(
      color: Theme.of(context).color.mainBackground,
      borderRadius: buildBorder());

  ///BorderRadius
  BorderRadius buildBorder() => const BorderRadius.all(Radius.circular(15));
}
