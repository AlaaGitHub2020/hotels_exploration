import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotels_exploration/app_logic/hotels_ui_logic/hotels_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/generated/l10n.dart';

///Failure Widget
class FailureWidget extends StatelessWidget {
  ///Constructor
  const FailureWidget({this.failure, super.key});

  final String? failure;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(ViewsConstants.icError),
            SizedBox(height: 10),
            buildErrorText(context),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context
                    .read<HotelsUiLogicBloc>()
                    .add(HotelsUiLogicEvent.getHotelData());
              },
              child: buildRetryAgainText(context),
            ),
          ],
        ),
      );

  ///Error Text
  Text buildErrorText(BuildContext context) => Text(
        '${S.current.errorFetchingDataFromAPI} ${failure != null ? '\n $failure' : ''}',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).color.errorColor),
      );

  ///Retry Again Text
  Text buildRetryAgainText(BuildContext context) => Text(
        S.current.retryAgain,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).color.mainBackground),
      );
}
