import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/domain/models/reservation/buyer_model.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/widgets/custom_input_field.dart';
import 'package:ru_phone_formatter/ru_phone_formatter.dart';

/// Phone Field
class PhoneField extends StatefulWidget {
  ///Constructor
  const PhoneField({super.key});

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  bool hasValidationError = false;
  final maskFormatter = RuPhoneInputFormatter();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState>(
        builder: (_, ReservationUiLogicState reservationUiLogicState) {
          return reservationUiLogicState.maybeWhen(
              orElse: Container.new,
              actionSuccess: (_, __, ___, ____, BuyerModel? buyerModel) {
                return CustomInputField(
                  onChange: (String value) {
                    final BuyerModel newBuyerModel =
                        buyerModel?.copyWith(phoneNumber: value) ??
                            BuyerModel.empty.copyWith(phoneNumber: value);
                    context.read<ReservationUiLogicBloc>().add(
                        ReservationUiLogicEvent.buyerInformationFormChanged(
                            newBuyerModel));
                  },
                  hint: S.current.phoneNumber,
                  initialValue: ViewsConstants.cPhoneNumber,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [maskFormatter],
                  hasValidationError: hasValidationError,
                  maxLength: 18,
                  validator: (String? value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.isValidPhone()) {
                      setState(() {
                        hasValidationError = true;
                      });
                      return S.current.invalidPhone;
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
