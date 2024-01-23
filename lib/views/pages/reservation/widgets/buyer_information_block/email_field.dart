import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/domain/models/reservation/buyer_model.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/widgets/custom_input_field.dart';

///Email Field
class EmailField extends StatefulWidget {
  ///Constructor
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  bool hasValidationError = false;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState>(
        builder: (_, ReservationUiLogicState reservationUiLogicState) {
          return reservationUiLogicState.maybeWhen(
              orElse: Container.new,
              actionSuccess:
                  (_, __, ___, ____, _____, ______, BuyerModel? buyerModel) {
                return CustomInputField(
                  onChange: (String value) {
                    final BuyerModel newBuyerModel =
                        buyerModel?.copyWith(emailAddress: value) ??
                            BuyerModel.empty.copyWith(emailAddress: value);
                    context.read<ReservationUiLogicBloc>().add(
                        ReservationUiLogicEvent.buyerInformationFormChanged(
                            newBuyerModel));
                  },
                  hint: S.current.email,
                  initialValue: ViewsConstants.cEmail,
                  keyboardType: TextInputType.emailAddress,
                  hasValidationError: hasValidationError,
                  maxLength: 50,
                  validator: (String? value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.isValidEmail()) {
                      setState(() {
                        hasValidationError = true;
                      });
                      return S.current.invalidEmail;
                    } else {
                      setState(() {
                        hasValidationError = false;
                      });
                    }
                    return null;
                  },
                );
              });
        },
      );
}
