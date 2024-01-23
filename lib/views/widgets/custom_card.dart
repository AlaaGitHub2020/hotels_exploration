import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/views/widgets/decoration_mixin.dart';

///Custom Card
class CustomCard extends StatelessWidget with DecorationMixin {
  ///Constructor
  const CustomCard({
    required this.children,
    this.elevation,
    this.borderRadius,
    this.crossAxisAlignment,
    this.decoration,
    this.padding,
    super.key,
  });

  ///Card elevation
  final double? elevation;

  ///Card border Radius
  final BorderRadiusGeometry? borderRadius;

  ///Card decoration
  final Decoration? decoration;

  ///Card children crossAxisAlignment
  final CrossAxisAlignment? crossAxisAlignment;

  ///Card children
  final List<Widget> children;

  ///Card padding
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) => Material(
        elevation: elevation ?? 10,
        borderRadius:
            borderRadius ?? const BorderRadius.all(Radius.circular(15)),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: padding ?? const EdgeInsets.only(left: 16, right: 16),
          decoration: decoration ?? buildCardDecoration(context),
          child: Column(
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
            children: children,
          ),
        ),
      );

  ///Card Decoration
  @override
  BoxDecoration buildCardDecoration(BuildContext context) => BoxDecoration(
        color: Theme.of(context).color.mainBackground,
        borderRadius:
            borderRadius ?? const BorderRadius.all(Radius.circular(15)),
      );
}
