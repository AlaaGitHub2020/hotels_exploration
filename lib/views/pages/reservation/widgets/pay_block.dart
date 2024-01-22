import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/routes/router.gr.dart';

///Pay Block
class PayBlock extends StatelessWidget {
  ///Constructor
  const PayBlock({super.key});

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
              ElevatedButton(
                onPressed: () {
                  context.router.push(PaidRoute());
                },
                child: Text('${S.current.pay} 198 036 ₽',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).color.mainBackground)),
              ),
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
  BorderRadius buildBorder() => const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      );
}
