import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/generated/l10n.dart';

///Select Room Button
class SelectRoomBtn extends StatelessWidget {
  ///Constructor
  const SelectRoomBtn({required this.onPressSelectRoom, super.key});

  ///on Pressed selectRoom
  final Function()? onPressSelectRoom;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressSelectRoom,
        child: Text(
          S.current.selectRoom,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).color.mainBackground),
        ),
      );
}
