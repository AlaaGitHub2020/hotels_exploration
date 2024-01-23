import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/pay_block/pay_aAmount_text.dart';
import 'package:hotels_exploration/views/widgets/decoration_mixin.dart';

///Pay Block
class PayBlock extends StatelessWidget with DecorationMixin {
  ///Constructor
  const PayBlock({super.key});

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).color.mainBackground,
        padding: EdgeInsets.only(right: 16, left: 16),
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildVerticalGap(),
            buildPayBtn(),
            buildVerticalGap(),
          ],
        ),
      );

  SizedBox buildVerticalGap() => const SizedBox(height: 16);

  ///build Pay Button
  BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState> buildPayBtn() =>
      BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState>(
        builder: (BuildContext context, _) {
          return ElevatedButton(
            onPressed: () => context.read<ReservationUiLogicBloc>().add(
                    ReservationUiLogicEvent.payBtnPressed(context, onError: () {
                  showErrorMessage(context, S.current.errorMessage);
                })),
            child: const PayAmountText(),
          );
        },
      );
}
