import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotels_exploration/views/widgets/decoration_mixin.dart';

///Arrow Icon
class ArrowIcon extends StatelessWidget with DecorationMixin {
  ///Constructor
  const ArrowIcon({required this.arrow, super.key});

  ///arrow icon String
  final String arrow;

  @override
  Widget build(BuildContext context) => Container(
      height: 32,
      width: 32,
      padding: EdgeInsets.all(10),
      decoration: buildExpandedBtnDecoration(context),
      child: SvgPicture.asset(arrow));
}
