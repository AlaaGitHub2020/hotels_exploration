import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/buyer_information_block/email_field.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/buyer_information_block/phone_field.dart';

///Buyer Form
class BuyerForm extends StatelessWidget {
  ///Constructor
  const BuyerForm({super.key});

  @override
  Widget build(BuildContext context) => Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(height: 20),
            PhoneField(),
            SizedBox(height: 16),
            EmailField(),
            SizedBox(height: 16),
          ],
        ),
      );
}
