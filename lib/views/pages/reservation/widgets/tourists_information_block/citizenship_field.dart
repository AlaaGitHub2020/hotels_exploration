import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/models/reservation/tourist_model.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/widgets/custom_input_field.dart';

///Citizenship Field
class CitizenshipField extends StatefulWidget {
  ///Constructor
  const CitizenshipField({required this.index, super.key});

  ///tourist index
  final int index;

  @override
  State<CitizenshipField> createState() => _CitizenshipFieldState();
}

class _CitizenshipFieldState extends State<CitizenshipField> {
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
                        touristList[widget.index]!.copyWith(nationality: value);

                    context.read<ReservationUiLogicBloc>().add(
                          ReservationUiLogicEvent.touristFormChanged(
                              touristModel, widget.index),
                        );
                  },
                  hint: S.current.citizenship,
                  initialValue: '',
                  keyboardType: TextInputType.text,
                  maxLength: 30,
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
