import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/domain/models/reservation/reservation_model.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/widgets/decoration_mixin.dart';

///Pay Amount Text
class PayAmountText extends StatelessWidget with DecorationMixin {
  ///Constructor
  const PayAmountText({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState>(
        builder: (BuildContext context,
                ReservationUiLogicState reservationUiLogicState) =>
            reservationUiLogicState.maybeWhen(
                orElse: Container.new,
                actionSuccess: (ReservationModel reservationModel, _, __, ___,
                    ____, _____, ______) {
                  final int totalAmount = (reservationModel.tourPrice ?? 0) +
                      (reservationModel.fuelCharge ?? 0) +
                      (reservationModel.serviceCharge ?? 0);
                  return Text(
                      '${S.current.pay} ${formatNumberString('$totalAmount')}',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).color.mainBackground));
                }),
      );
}
