import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/generated/l10n.dart';

///Whats Not Included Button
class WhatsNotIncludedBtn extends StatelessWidget {
  ///Constructor
  const WhatsNotIncludedBtn({super.key});

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () => false,
        title: Text(S.current.whatsNotIncluded),
        subtitle: Text(S.current.essentials),
        leading: SvgPicture.asset(ViewsConstants.icWhatsNotIncluded),
        trailing: SvgPicture.asset(ViewsConstants.icForward),
      );
}
