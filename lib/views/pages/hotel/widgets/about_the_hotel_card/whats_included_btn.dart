import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/generated/l10n.dart';

///Whats Included Button
class WhatsIncludedBtn extends StatelessWidget {
  ///Constructor
  const WhatsIncludedBtn({super.key});

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(S.current.whatsIncluded),
        subtitle: Text(S.current.essentials),
        leading: SvgPicture.asset(ViewsConstants.icWhatsIncluded),
        trailing: SvgPicture.asset(ViewsConstants.icForward),
      );
}
