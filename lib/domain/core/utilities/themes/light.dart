part of 'theme_data_extension.dart';

/// Application light theme
ThemeData hotelsExplorationLight = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFD9D9D9),
  fontFamily: 'SF-Pro-Display',
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      minimumSize: MaterialStateProperty.all(Size(343, 48)),
      backgroundColor:
          MaterialStateProperty.all(Color.fromRGBO(13, 114, 255, 1)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    ),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 22,
      fontFamily: 'SF-Pro-Display',
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      fontFamily: 'SF-Pro-Display',
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 30,
      fontFamily: 'SF-Pro-Display',
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      fontFamily: 'SF-Pro-Display',
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontFamily: 'SF-Pro-Display',
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 17,
      fontFamily: 'SF-Pro-Display',
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      fontFamily: 'SF-Pro-Display',
    ),
  ),
  extensions: const <ThemeExtension<dynamic>>[
    ThemeColors(
      mainText: Color.fromRGBO(0, 0, 0, 1),
      secondText: Color.fromRGBO(255, 168, 0, 1),
      ratingNameTextColor: Color.fromRGBO(255, 199, 0, 0.2),
      addressTextColor: Color.fromRGBO(13, 114, 255, 1),
      priceForItTextColor: Color.fromRGBO(130, 135, 150, 1),
      mainButton: Color.fromRGBO(13, 114, 255, 1),
      mainBackground: Color.fromRGBO(255, 255, 255, 1),
      cardBGColor: Color.fromRGBO(251, 251, 252, 1),
      errorColor: Colors.red,
      avatarBGColor: Color.fromRGBO(246, 246, 249, 1),
      inputLabelColor: Color.fromRGBO(169, 171, 183, 1),
      inputTextColor: Color.fromRGBO(20, 20, 43, 1),
    ),
  ],
);
