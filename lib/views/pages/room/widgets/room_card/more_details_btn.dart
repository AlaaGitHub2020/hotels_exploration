import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/generated/l10n.dart';

///More Details
class MoreDetails extends StatelessWidget {
  ///Constructor
  const MoreDetails({super.key});

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: () => false,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Theme.of(context).color.mainButton.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.current.moreDetailsAboutTheRoom,
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).color.mainButton),
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(ViewsConstants.icMoreDetails),
            ],
          ),
        ),
      );
}
