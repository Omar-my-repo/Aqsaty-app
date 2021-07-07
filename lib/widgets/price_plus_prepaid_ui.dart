import 'package:flutter/material.dart';

import 'my_filled_container.dart';
import 'my_text_field.dart';
class PricePlusPrePaidUi extends StatelessWidget {
  final  firstField;
  final  secondField;

  const PricePlusPrePaidUi({Key key,@required this.firstField,@required this.secondField}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .20,
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyFilledContainer(
                  title: 'السعر',
                ),
                MyTextField(
                  controller: firstField,
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyFilledContainer(
                  title: 'المقدم',
                ),
                MyTextField(
                 controller: secondField,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
