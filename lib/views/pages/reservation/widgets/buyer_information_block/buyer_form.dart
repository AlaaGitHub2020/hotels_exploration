import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/buyer_information_block/email_field.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/buyer_information_block/phone_field.dart';

///Buyer Form
class BuyerForm extends StatelessWidget {
  ///Constructor
  const BuyerForm({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState>(
        builder: (_, ReservationUiLogicState reservationUiLogicState) {
          return reservationUiLogicState.maybeWhen(
              orElse: Container.new,
              actionSuccess:
                  (_, __, buyerInfoFormKey, ___, ____, _____, ______) {
                return Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: buyerInfoFormKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      PhoneField(),
                      SizedBox(height: 16),
                      EmailField(),
                      SizedBox(height: 16),
                    ],
                  ),
                );
              });
        },
      );
}
