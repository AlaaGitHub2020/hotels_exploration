import 'package:flutter/material.dart';

///Hotel Description
class HotelDescription extends StatelessWidget {
  ///Constructor
  const HotelDescription({super.key});

  @override
  Widget build(BuildContext context) => Text(
        'Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!',
        style: Theme.of(context).textTheme.labelSmall,
      );
}
