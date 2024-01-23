import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/tourists_information_block/citizenship_field.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/tourists_information_block/date_of_birth_field.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/tourists_information_block/family_name_field.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/tourists_information_block/name_field.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/tourists_information_block/passport_number_field.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/tourists_information_block/validity_period_passport_field.dart';

///Tourist From
class TouristFrom extends StatelessWidget {
  ///Constructor
  const TouristFrom({required this.index, super.key});

  ///Tourist From index
  final int index;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState>(
        builder: (_, ReservationUiLogicState reservationUiLogicState) =>
            reservationUiLogicState.maybeWhen(
          orElse: Container.new,
          actionSuccess:
              (_, __, ___, touristsInfoFormKey, ____, _____, ______) => Form(
            key: touristsInfoFormKey[index],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                NameField(index: index),
                SizedBox(height: 8),
                FamilyNameField(index: index),
                SizedBox(height: 8),
                DateOfBirthField(index: index),
                SizedBox(height: 8),
                CitizenshipField(index: index),
                SizedBox(height: 8),
                PassportNumberField(index: index),
                SizedBox(height: 8),
                ValidityPeriodOfThePassportField(index: index),
              ],
            ),
          ),
        ),
      );
}
