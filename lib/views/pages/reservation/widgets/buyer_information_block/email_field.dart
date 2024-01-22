import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/widgets/custom_input_field.dart';

///Email Field
class EmailField extends StatelessWidget {
  ///Constructor
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) => CustomInputField(
        onChange: (_) {},
        hint: S.current.email,
        initialValue: ViewsConstants.cEmail,
        keyboardType: TextInputType.emailAddress,
      );
}
