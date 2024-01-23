import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/views/widgets/decoration_mixin.dart';

///Arrow Up Icon
class ArrowUpIcon extends StatelessWidget with DecorationMixin {
  ///Constructor
  const ArrowUpIcon({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 32,
        width: 32,
        padding: EdgeInsets.all(10),
        decoration: buildExpandedBtnDecoration(context),
        child: SvgPicture.asset(ViewsConstants.icArrowUp),
      );
}
