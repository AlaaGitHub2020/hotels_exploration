import 'package:freezed_annotation/freezed_annotation.dart';

part 'tourist_model.freezed.dart';

part 'tourist_model.g.dart';

@freezed
class TouristModel with _$TouristModel {
  factory TouristModel({
    required String firstName,
    required String secondName,
    required String birthday,
    required String nationality,
    required int passportNumber,
    required String expiredDatePassport,
  }) = _TouristModel;

  TouristModel._();

  factory TouristModel.fromJson(Map<String, dynamic> json) =>
      _$TouristModelFromJson(json);

  static TouristModel get empty => TouristModel(
        firstName: '',
        secondName: '',
        birthday: '',
        nationality: '',
        passportNumber: 0,
        expiredDatePassport: '',
      );
}

extension PhoneValidator on TouristModel {
  /// Check if phone is valid
  bool isValidTouristModel() =>
      firstName.isNotEmpty &&
      secondName.isNotEmpty &&
      birthday.isNotEmpty &&
      nationality.isNotEmpty &&
      passportNumber != 0 &&
      expiredDatePassport.isNotEmpty;
}
