import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/views/widgets/custom_input_field.dart';

///Tourists Information Block
class TouristsInformationBlock extends StatefulWidget {
  ///Constructor
  const TouristsInformationBlock({super.key});

  @override
  State<TouristsInformationBlock> createState() =>
      _TouristsInformationBlockState();
}

class _TouristsInformationBlockState extends State<TouristsInformationBlock> {
  bool isExpanded = false;
  static GlobalKey<ExpansionTileCustomState> itemKey1 = GlobalKey();
  static GlobalKey<ExpansionTileCustomState> itemKey2 = GlobalKey();
  static GlobalKey<ExpansionTileCustomState> itemKey3 = GlobalKey();

  @override
  Widget build(BuildContext context) =>
      ExpansionTileGroup(spaceBetweenItem: 10, children: [
        ExpansionTileBorderItem(
          decoration: buildCardDecoration(context),
          childrenPadding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
          trailing: IconButton(
              icon: isExpanded
                  ? Container(
                      height: 32,
                      width: 32,
                      padding: EdgeInsets.all(10),
                      decoration: buildExpandedBtnDecoration(context),
                      child: SvgPicture.asset(ViewsConstants.icArrowUp),
                    )
                  : Container(
                      height: 32,
                      width: 32,
                      padding: EdgeInsets.all(10),
                      decoration: buildExpandedBtnDecoration(context),
                      child: SvgPicture.asset(ViewsConstants.icArrowDown)),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
                itemKey1.currentState?.toggle();
              }),
          title: const Text('Первый турист'),
          expansionKey: itemKey1,
          children: [
            CustomInputField(
              onChange: (_) {},
              hint: 'Имя',
              initialValue: 'Иван',
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 8),
            CustomInputField(
              onChange: (_) {},
              hint: 'Фамилия',
              initialValue: 'Иванов',
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 8),
            CustomInputField(
              onChange: (_) {},
              hint: 'Дата рождения',
              initialValue: '',
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 8),
            CustomInputField(
              onChange: (_) {},
              hint: 'Гражданство',
              initialValue: '',
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 8),
            CustomInputField(
              onChange: (_) {},
              hint: 'Номер загранпаспорта',
              initialValue: '',
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            CustomInputField(
              onChange: (_) {},
              hint: 'Срок действия загранпаспорта',
              initialValue: '',
              keyboardType: TextInputType.datetime,
            ),
          ],
        ),
        ExpansionTileBorderItem(
          decoration: buildCardDecoration(context),
          trailing: IconButton(
              icon: Container(
                  height: 32,
                  width: 32,
                  padding: EdgeInsets.all(10),
                  decoration: buildExpandedBtnDecoration(context),
                  child: SvgPicture.asset(ViewsConstants.icArrowDown)),
              onPressed: () {}),
          title: const Text('Второй турист'),
          expansionKey: itemKey2,
          children: [const Text('body content of expansion')],
        ),
        ExpansionTileBorderItem(
          decoration: buildCardDecoration(context),
          trailing: IconButton(
              icon: SvgPicture.asset(ViewsConstants.icAdd), onPressed: () {}),
          title: const Text('Добавить туриста'),
          expansionKey: itemKey3,
          children: [const Text('body content of expansion')],
        ),
      ]);

  BoxDecoration buildExpandedBtnDecoration(BuildContext context) {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Theme.of(context).color.mainButton.withOpacity(0.1));
  }

  ///Card Decoration
  BoxDecoration buildCardDecoration(BuildContext context) => BoxDecoration(
      color: Theme.of(context).color.mainBackground,
      borderRadius: buildBorder());

  ///BorderRadius
  BorderRadius buildBorder() => const BorderRadius.all(Radius.circular(15));
}
