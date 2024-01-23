import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/hotels_ui_logic/hotels_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/domain/models/hotel/hotel_model.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/widgets/decoration_mixin.dart';

///Minimal Price
class MinimalPrice extends StatelessWidget with DecorationMixin {
  ///Constructor
  const MinimalPrice({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HotelsUiLogicBloc, HotelsUiLogicState>(
        builder: (_, HotelsUiLogicState hotelsUiLogicState) =>
            hotelsUiLogicState.maybeWhen(
          orElse: Container.new,
          actionSuccess: (HotelModel hotelModel, _, __) => Text(
              '${S.current.from} ${formatNumberString('${hotelModel.minimalPrice ?? ''}')}',
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Theme.of(context).color.mainText)),
        ),
      );
}
