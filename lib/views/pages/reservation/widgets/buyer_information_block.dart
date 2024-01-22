import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/views/widgets/custom_input_field.dart';

///Buyer Information Block
class BuyerInformationBlock extends StatelessWidget {
  ///Constructor
  const BuyerInformationBlock({super.key});

  @override
  Widget build(BuildContext context) => Material(
        elevation: 10,
        borderRadius: buildBorder(),
        child: Container(
          padding: EdgeInsets.only(right: 16, left: 16),
          width: MediaQuery.sizeOf(context).width,
          decoration: buildCardDecoration(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text('Информация о покупателе',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).color.mainText)),
              SizedBox(height: 20),
              CustomInputField(
                onChange: (_) {},
                hint: 'Номер телефона',
                initialValue: '+7 (951) 555-99-00',
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),
              CustomInputField(
                onChange: (_) {},
                hint: 'Почта',
                initialValue: 'examplemail.000@mail.ru',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              Text(
                  'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Theme.of(context).color.priceForItTextColor)),
              SizedBox(height: 16),
            ],
          ),
        ),
      );

  ///Card Decoration
  BoxDecoration buildCardDecoration(BuildContext context) => BoxDecoration(
      color: Theme.of(context).color.mainBackground,
      borderRadius: buildBorder());

  ///BorderRadius
  BorderRadius buildBorder() => const BorderRadius.all(Radius.circular(15));
}
