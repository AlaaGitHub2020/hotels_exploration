import 'package:flutter/material.dart';
import 'package:hotels_exploration/generated/l10n.dart';

///Page Title
class PageTitle extends StatelessWidget {
  ///Constructor
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) => Text(
        S.current.booking,
        maxLines: 1,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleMedium,
      );
}
