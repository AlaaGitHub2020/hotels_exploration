import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/domain/models/reservation/buyer_model.dart';
import 'package:hotels_exploration/domain/models/reservation/tourist_model.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/pay_block/pay_aAmount_text.dart';
import 'package:hotels_exploration/views/routes/router.gr.dart';
import 'package:hotels_exploration/views/widgets/decoration_mixin.dart';

///Pay Block
class PayBlock extends StatelessWidget with DecorationMixin {
  ///Constructor
  const PayBlock({super.key});

  @override
  Widget build(BuildContext context) => Material(
        elevation: 10,
        borderRadius: buildBorder(),
        child: Container(
          padding: EdgeInsets.only(right: 16, left: 16),
          width: MediaQuery.sizeOf(context).width,
          decoration: buildCardDecoration(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildVerticalGap(),
              buildPayBtn(),
              buildVerticalGap(),
            ],
          ),
        ),
      );

  SizedBox buildVerticalGap() => SizedBox(height: 16);

  ///build Pay Button
  BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState> buildPayBtn() =>
      BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState>(
        builder: (BuildContext context,
            ReservationUiLogicState reservationUiLogicState) {
          return reservationUiLogicState.maybeWhen(
              orElse: Container.new,
              actionSuccess: (_, List<TouristModel?>? touristModelList, __, ___,
                  BuyerModel? buyerModel) {
                bool allTouristsValid = touristModelList?.every(
                        (tourist) => tourist?.isValidTouristModel() ?? false) ??
                    false;
                print(allTouristsValid);
                return ElevatedButton(
                  onPressed: (touristModelList == null ||
                          touristModelList.isEmpty ||
                          buyerModel == null)
                      ? () {
                          showErrorMessage(context, S.current.errorMessage);
                        }
                      : () {
                          context.router.push(PaidRoute());
                        },
                  child: PayAmountText(),
                );
              });
        },
      );

  ///Card Decoration
  @override
  BoxDecoration buildCardDecoration(BuildContext context) => BoxDecoration(
      color: Theme.of(context).color.mainBackground,
      borderRadius: buildBorder());

  ///BorderRadius
  @override
  BorderRadius buildBorder() => const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      );
}
