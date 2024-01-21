part of 'theme_data_extension.dart';

/// Colors theme extension
class ThemeColors extends ThemeExtension<ThemeColors> {
  /// Default constructor
  const ThemeColors({
    required this.mainText,
    required this.secondText,
    required this.ratingNameTextColor,
    required this.addressTextColor,
    required this.priceForItTextColor,
    required this.mainButton,
    required this.mainBackground,
    required this.cardBGColor,
    required this.errorColor,
    required this.avatarBGColor,
  });

  final Color mainText;
  final Color secondText;
  final Color ratingNameTextColor;
  final Color addressTextColor;
  final Color priceForItTextColor;
  final Color mainButton;
  final Color mainBackground;
  final Color cardBGColor;
  final Color errorColor;
  final Color avatarBGColor;

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      mainText: Color.lerp(mainText, other.mainText, t)!,
      secondText: Color.lerp(secondText, other.secondText, t)!,
      ratingNameTextColor:
          Color.lerp(ratingNameTextColor, other.ratingNameTextColor, t)!,
      addressTextColor:
          Color.lerp(addressTextColor, other.addressTextColor, t)!,
      priceForItTextColor:
          Color.lerp(priceForItTextColor, other.priceForItTextColor, t)!,
      mainButton: Color.lerp(mainButton, other.mainButton, t)!,
      mainBackground: Color.lerp(mainBackground, other.mainBackground, t)!,
      cardBGColor: Color.lerp(cardBGColor, other.cardBGColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      avatarBGColor: Color.lerp(avatarBGColor, other.avatarBGColor, t)!,
    );
  }

  @override
  ThemeExtension<ThemeColors> copyWith() {
    throw UnimplementedError();
  }
}
