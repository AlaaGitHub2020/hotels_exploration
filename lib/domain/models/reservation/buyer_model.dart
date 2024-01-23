import 'package:freezed_annotation/freezed_annotation.dart';

part 'buyer_model.freezed.dart';

part 'buyer_model.g.dart';

@freezed
class BuyerModel with _$BuyerModel {
  factory BuyerModel({
    required String emailAddress,
    required String phoneNumber,
  }) = _BuyerModel;

  BuyerModel._();

  factory BuyerModel.fromJson(Map<String, dynamic> json) =>
      _$BuyerModelFromJson(json);

  static BuyerModel get empty => BuyerModel(
        emailAddress: '',
        phoneNumber: '',
      );
}

/// Email validator
extension EmailValidator on String {
  /// Check if email is valid
  bool isValidEmail() =>
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
          .hasMatch(this);
}

/// Phone validator
extension PhoneValidator on String {
  /// Check if phone is valid
  bool isValidPhone() => RegExp(
          r'^(\+7 \(\d{3}\) \d{3}-\d{2}-\d{2}|8 \(\d{3}\) \d{3}-\d{2}-\d{2})$')
      .hasMatch(this);
}
