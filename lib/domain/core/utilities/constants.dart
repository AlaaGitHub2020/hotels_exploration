///Constants used in the Domain layer
class DomainConstants {
  static const String apiConfigFile = 'assets/config/api_config.yaml';
  // static const String pEmailPattern =
  //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
}

///Constants used in the Infrastructure layer
class InfrastructureConstants {
  static const String apiBaseUrlKey = 'base_api_url';
  static const String screen1UrlFetchHotelData =
      '75000507-da9a-43f8-a618-df698ea7176d';
  static const String screen2UrlFetchRoomsList =
      '85db21b4-32a7-4032-bb80-694bb596a445';
  static const String screen3UrlFetchReservationData =
      '63866c74-d593-432c-af8e-f279d1a8d2ff';
}

///Constants used in the Views layer
class ViewsConstants {
  static const String appTitle = 'Hotels Exploration';
  static const String icFacilities = 'assets/icons/ic_facilities.svg';
  static const String icWhatsIncluded = 'assets/icons/ic_whats_included.svg';
  static const String icWhatsNotIncluded =
      'assets/icons/ic_whats_not_included.svg';
  static const String icForward = 'assets/icons/ic_forward.svg';
  static const String icError = 'assets/icons/ic_error.svg';
  static const String icMoreDetails = 'assets/icons/ic_more_details.svg';
  static const String icArrowBack = 'assets/icons/ic_arrow_back.svg';
  static const String icOrderProcessed = 'assets/icons/ic_order_processed.png';
  static const String icAdd = 'assets/icons/ic_add.svg';
  static const String icArrowDown = 'assets/icons/ic_arrow_down.svg';
  static const String icArrowUp = 'assets/icons/ic_arrow_up.svg';
  static const String cPhoneNumber = '+7 (951) 555-99-00';
  static const String cEmail = 'examplemail.000@mail.ru';
  static const String cCurrency = '₽';
  static const String cFamilyNameInitValue = 'Иванов';
  static const String cNameInitValue = 'Иван';
  static const String cDateMask = '##/##/####';
  static const String cPhoneMask = '+7 (###) ###-##-##';
}
