import 'package:flutter/material.dart';

///Page Title
class PageTitle extends StatelessWidget {
  ///Constructor
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) => Text(
        'Бронирование',
        maxLines: 1,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleMedium,
      );
}
