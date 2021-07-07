import 'package:flutter/material.dart';
import 'package:qist/shared/style.dart';

class MyEmptyContainer extends StatelessWidget {
  final String value;

  const MyEmptyContainer({Key key, @required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .46,
      height: size.height * .06,
      decoration:BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey)
        )
      ),
      child: Text(
        value,
        style: Style.mainTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
