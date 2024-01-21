import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/generated/l10n.dart';

///Loading Image Error
class LoadingImageError extends StatelessWidget {
  ///Constructor
  const LoadingImageError({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(Icons.error_outline, color: Theme.of(context).color.errorColor),
          const SizedBox(height: 10),
          Text(
            S.current.loadingImageError,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: Theme.of(context).color.errorColor),
          ),
        ],
      );
}
