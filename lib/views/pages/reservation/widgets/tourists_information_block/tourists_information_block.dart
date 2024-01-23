import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/tourists_information_block/arrow_down_icon.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/tourists_information_block/arrow_up_icon.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/tourists_information_block/tourist_form.dart';
import 'package:hotels_exploration/views/widgets/decoration_mixin.dart';

class TouristsInformationBlock extends StatelessWidget with DecorationMixin {
  const TouristsInformationBlock({super.key});

  static GlobalKey<ExpansionTileCustomState> defaultKey = GlobalKey();
  static GlobalKey<ExpansionTileCustomState> addItemKey = GlobalKey();

  void addNewTourist(BuildContext context) {
    context
        .read<ReservationUiLogicBloc>()
        .add(ReservationUiLogicEvent.addNewTouristPressed());
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState>(
        builder: (_, ReservationUiLogicState reservationUiLogicState) {
          return reservationUiLogicState.maybeWhen(
              orElse: Container.new,
              actionSuccess: (_,
                  __,
                  ___,
                  ____,
                  List<GlobalKey<ExpansionTileCustomState>>? itemKeys,
                  List<bool>? isExpandedList,
                  _____) {
                return ExpansionTileGroup(
                  spaceBetweenItem: 10,
                  children: [
                    buildTileItem(context, defaultKey,
                        isExpandedList?.elementAt(0) ?? false, 0),
                    if (itemKeys != null && isExpandedList != null)
                      ...itemKeys.asMap().entries.map((entry) => buildTileItem(
                          context,
                          entry.value,
                          isExpandedList[entry.key + 1],
                          entry.key + 1)),
                    buildAddBtn(context),
                  ],
                );
              });
        },
      );

  ExpansionTileBorderItem buildAddBtn(BuildContext context) =>
      ExpansionTileBorderItem(
        decoration: buildCardDecoration(context),
        isEnableExpanded: false,
        trailing: buildTrailing(context),
        title: buildAddATouristText(context),
        expansionKey: addItemKey,
        children: [],
      );

  ///build Add  Button
  IconButton buildTrailing(BuildContext context) {
    return IconButton(
        icon: SvgPicture.asset(ViewsConstants.icAdd),
        onPressed: () => addNewTourist(context));
  }

  /// build Add A Tourist Text
  Text buildAddATouristText(BuildContext context) {
    return Text(
      S.current.addATourist,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  ///build Tourist Tile Item
  ExpansionTileBorderItem buildTileItem(
    BuildContext context,
    GlobalKey<ExpansionTileCustomState> expansionKey,
    bool isExpanded,
    int index,
  ) =>
      ExpansionTileBorderItem(
        decoration: buildCardDecoration(context),
        childrenPadding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
        trailing: IconButton(
          icon: isExpanded ? ArrowUpIcon() : ArrowDownIcon(),
          onPressed: () {
            context
                .read<ReservationUiLogicBloc>()
                .add(ReservationUiLogicEvent.expandedBtnPressed(expansionKey));
          },
        ),
        title: Text(
          '${convertToEnglishOrdering(index + 1)} ${S.current.tourist}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        expansionKey: expansionKey,
        initiallyExpanded: isExpanded,
        onExpansionChanged: (expanded) {
          context.read<ReservationUiLogicBloc>().add(
              ReservationUiLogicEvent.expansionChanged(expansionKey, expanded));
        },
        children: [TouristFrom(index: index)],
      );
}
