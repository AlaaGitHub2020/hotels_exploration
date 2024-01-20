import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/about_the_hotel_card/peculiarities_card.dart';

///Peculiarities List
class PeculiaritiesList extends StatelessWidget {
  ///Constructor
  const PeculiaritiesList({super.key});

  @override
  Widget build(BuildContext context) => const Wrap(
        children: [
          PeculiaritiesCard(text: '3-я линия'),
          PeculiaritiesCard(text: 'Платный Wi-Fi в фойе'),
          PeculiaritiesCard(text: '30 км до аэропорта'),
          PeculiaritiesCard(text: '1 км до пляжа'),
        ],
      );
}
