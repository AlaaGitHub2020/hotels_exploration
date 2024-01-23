import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/models/reservation/tourist_model.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/widgets/custom_input_field.dart';

///Passport Number Field
class PassportNumberField extends StatefulWidget {
  ///Constructor
  const PassportNumberField({required this.index, super.key});

  ///tourist index
  final int index;

  @override
  State<PassportNumberField> createState() => _PassportNumberFieldState();
}

class _PassportNumberFieldState extends State<PassportNumberField> {
  bool hasValidationError = false;

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
                      passportNumber: int.parse(value),
                    );

                    context.read<ReservationUiLogicBloc>().add(
                          ReservationUiLogicEvent.touristFormChanged(
                              touristModel, widget.index),
                        );
                  },
                  hint: S.current.passportNumber,
                  initialValue: '',
                  keyboardType: TextInputType.number,
                  maxLength: 50,
                  hasValidationError: hasValidationError,
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
