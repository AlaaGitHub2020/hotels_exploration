import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';

///Room Peculiarities List
class RoomPeculiaritiesList extends StatelessWidget {
  ///Constructor
  const RoomPeculiaritiesList(this.roomPeculiarities, {super.key});

  ///Room Peculiarities list
  final List<String?> roomPeculiarities;

  @override
  Widget build(BuildContext context) => Wrap(
        children: [
          ...roomPeculiarities
              .map((String? textString) => textString != null
                  ? buildPeculiarity(context, textString)
                  : Container())
              .toList(),
        ],
      );

  ///Peculiarity
  Container buildPeculiarity(BuildContext context, String textString) =>
      Container(
        margin: const EdgeInsets.only(right: 5, left: 5),
        padding: const EdgeInsets.only(right: 5, left: 5),
        color: Theme.of(context).color.cardBGColor,
        child: Text(
          textString,
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).color.priceForItTextColor),
        ),
      );
}
