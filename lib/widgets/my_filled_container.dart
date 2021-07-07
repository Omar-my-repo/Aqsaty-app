import 'package:flutter/material.dart';
import 'package:qist/shared/style.dart';



class MyFilledContainer extends StatelessWidget {
  final String title;

  MyFilledContainer({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: size.width*.05),
      width: size.width * .4,
      height: size.height * .06,
      color: secondColor,
      alignment: Alignment.center,
      child: Text(
        title,
        style: Style.mainTextStyle,
      ),
    );
  }
}
