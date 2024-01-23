import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/generated/l10n.dart';

mixin DecorationMixin {
  BoxDecoration buildExpandedBtnDecoration(BuildContext context) =>
      BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Theme.of(context).color.mainButton.withOpacity(0.1));

  ///Card Decoration
  BoxDecoration buildCardDecoration(BuildContext context) => BoxDecoration(
      color: Theme.of(context).color.mainBackground,
      borderRadius: buildBorder());

  ///BorderRadius
  BorderRadius buildBorder() => const BorderRadius.all(Radius.circular(15));

  ///convert To English Ordering <= 10
  /// Handling numbers outside the range 1-10
  String convertToEnglishOrdering(int number) {
    if (number < 1 || number > 10) {
      return number.toString();
    }

    List<String> orderings = [
      S.current.first,
      S.current.second,
      S.current.third,
      S.current.fourth,
      S.current.fifth,
      S.current.sixth,
      S.current.seventh,
      S.current.eighth,
      S.current.ninth,
      S.current.tenth,
    ];

    return orderings[number - 1];
  }

  void showErrorMessage(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: Theme.of(context).color.mainBackground),
      ),
      backgroundColor: Theme.of(context).color.snackBarColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  ///Number String formatter
  String formatNumberString(String input) {
    if (input.isEmpty) {
      return '';
    }

    List<String> chunks = [];
    int length = input.length;

    for (int i = 0; i < length; i += 3) {
      int end = i + 3;
      if (end > length) {
        end = length;
      }
      chunks.add(input.substring(length - end, length - i));
    }

    String formattedString = chunks.reversed.join(' ');
    return '$formattedString ${ViewsConstants.cCurrency}';
  }
}
