import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/domain/models/reservation/tourist_model.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/widgets/custom_input_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

///Validity Period Passport Field
class ValidityPeriodOfThePassportField extends StatefulWidget {
  ///Constructor
  const ValidityPeriodOfThePassportField({required this.index, super.key});

  ///tourist index
  final int index;

  @override
  State<ValidityPeriodOfThePassportField> createState() =>
      _ValidityPeriodOfThePassportFieldState();
}

class _ValidityPeriodOfThePassportFieldState
    extends State<ValidityPeriodOfThePassportField> {
  bool hasValidationError = false;
  var dateMaskFormatter =
      MaskTextInputFormatter(mask: ViewsConstants.cDateMask);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState>(
        builder: (_, ReservationUiLogicState reservationUiLogicState) {
          return reservationUiLogicState.maybeWhen(
              orElse: Container.new,
              actionSuccess:
                  (_, List<TouristModel?> touristList, __, ___, ____) {
                return CustomInputField(
                  onChange: (String value) {
                    TouristModel touristModel =
                        touristList[widget.index]!.copyWith(
                      expiredDatePassport: value,
                    );

                    context.read<ReservationUiLogicBloc>().add(
                          ReservationUiLogicEvent.touristFormChanged(
                              touristModel, widget.index),
                        );
                  },
                  hint: S.current.validityPeriodOfThePassport,
                  initialValue: '',
                  keyboardType: TextInputType.datetime,
                  maxLength: 10,
                  hasValidationError: hasValidationError,
                  inputFormatters: [dateMaskFormatter],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        hasValidationError = true;
                      });

                      return S.current.required;
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
