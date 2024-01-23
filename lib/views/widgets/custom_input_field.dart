import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';

/// Custom input Field widget
class CustomInputField extends StatefulWidget {
  ///Constructor
  const CustomInputField({
    required this.onChange,
    this.hint,
    this.keyboardType,
    this.autofocus = false,
    this.initialValue,
    this.validator,
    this.hasValidationError = false,
    this.inputFormatters,
    this.maxLength,
    super.key,
  });

  /// Input hint
  final String? hint;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Autofocus
  final bool autofocus;

  /// Initial input value
  final String? initialValue;

  /// Input on input submitted
  final ValueChanged<String>? onChange;

  /// Input validator function
  final FormFieldValidator<String?>? validator;

  ///hasValidationError flag toa make the container with bigger height
  final bool? hasValidationError;

  ///input Formatters
  final List<TextInputFormatter>? inputFormatters;

  ///maxLength
  final int? maxLength;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  void initState() {
    super.initState();
    if ((widget.initialValue ?? '').isNotEmpty) {
      controller.text = widget.initialValue ?? '';
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// Input controller
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Container(
        height: (widget.hasValidationError ?? false) ? 90 : 52,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).color.avatarBGColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )),
        child: TextFormField(
          enableSuggestions: false,
          autocorrect: false,
          validator: widget.validator,
          cursorColor: Theme.of(context).color.mainText,
          cursorWidth: 1.5,
          decoration: buildInputDecoration(context),
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).color.inputTextColor,
              ),
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          autofocus: widget.autofocus,
          controller: controller,
          onChanged: widget.onChange,
          inputFormatters: widget.inputFormatters,
        ),
      );

  ///InputDecoration
  InputDecoration buildInputDecoration(BuildContext context) => InputDecoration(
        filled: true,
        fillColor: Theme.of(context).color.avatarBGColor,
        labelText: widget.hint,
        labelStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: Theme.of(context).color.inputLabelColor,
            ),
        counterText: '',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).color.avatarBGColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).color.errorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).color.errorColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).color.avatarBGColor,
          ),
        ),
      );
}
