import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/generated/l10n.dart';

///Facilities Button
class FacilitiesBtn extends StatelessWidget {
  ///Constructor
  const FacilitiesBtn({super.key});

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(S.current.facilities),
        subtitle: Text(S.current.essentials),
        leading: SvgPicture.asset(ViewsConstants.icFacilities),
        trailing: SvgPicture.asset(ViewsConstants.icForward),
      );
}
