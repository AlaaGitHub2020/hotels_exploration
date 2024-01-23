import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/domain/models/reservation/tourist_model.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/widgets/custom_input_field.dart';

///Family Name Field
class FamilyNameField extends StatefulWidget {
  ///Constructor
  const FamilyNameField({required this.index, super.key});

  ///tourist index
  final int index;

  @override
  State<FamilyNameField> createState() => _FamilyNameFieldState();
}

class _FamilyNameFieldState extends State<FamilyNameField> {
  bool hasValidationError = false;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState>(
        builder: (_, ReservationUiLogicState reservationUiLogicState) {
          return reservationUiLogicState.maybeWhen(
              orElse: Container.new,
              actionSuccess: (_, List<TouristModel?> touristList, __, ___, ____,
                  _____, ______) {
                return CustomInputField(
                  onChange: (String value) {
                    TouristModel touristModel =
                        touristList[widget.index]!.copyWith(secondName: value);

                    context.read<ReservationUiLogicBloc>().add(
                          ReservationUiLogicEvent.touristFormChanged(
                              touristModel, widget.index),
                        );
                  },
                  hint: S.current.familyName,
                  initialValue: ViewsConstants.cFamilyNameInitValue,
                  keyboardType: TextInputType.text,
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
