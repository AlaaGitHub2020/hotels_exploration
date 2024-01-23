import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/buyer_information_block/buyer_form.dart';
import 'package:hotels_exploration/views/widgets/custom_card.dart';

///Buyer Information Block
class BuyerInformationBlock extends StatelessWidget {
  ///Constructor
  const BuyerInformationBlock({super.key});

  @override
  Widget build(BuildContext context) => CustomCard(
        children: [
          SizedBox(height: 16),
          buildBuyerInfoText(context),
          BuyerForm(),
          buildThisDataText(context),
          SizedBox(height: 16),
        ],
      );

  ///build This Data Text
  Text buildThisDataText(BuildContext context) => Text(S.current.thisData,
      style: Theme.of(context)
          .textTheme
          .displaySmall!
          .copyWith(color: Theme.of(context).color.priceForItTextColor));

  ///build Buyer Info Text
  Text buildBuyerInfoText(BuildContext context) =>
      Text(S.current.buyerInformation,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).color.mainText));
}
