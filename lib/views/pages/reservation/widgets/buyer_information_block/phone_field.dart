import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/widgets/custom_input_field.dart';

/// Phone Field
class PhoneField extends StatelessWidget {
  ///Constructor
  const PhoneField({super.key});

  @override
  Widget build(BuildContext context) => CustomInputField(
        onChange: (_) {},
        hint: S.current.phoneNumber,
        initialValue: ViewsConstants.cPhoneNumber,
        keyboardType: TextInputType.phone,
      );
}
