import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qist/shared/style.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;

  const MyTextField({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .40,
      height: size.height * .06,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: Style.mainTextStyle,

        inputFormatters: [ FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
      ),
    );
  }
}
