import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';

///Room Name Text
class RoomNameText extends StatelessWidget {
  const RoomNameText(this.roomName, {super.key});

  ///Room Name
  final String roomName;

  @override
  Widget build(BuildContext context) => Text(
        roomName,
        softWrap: true,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).color.mainText),
      );
}
