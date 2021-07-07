import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qist/shared/style.dart';

class MyButton extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final Function onPressed;
  final TextStyle textStyle;
  final Color textColor;

  const MyButton({
    Key key,
    @required this.title,
    @required this.onPressed,
    @required this.textStyle,
    @required this.width,
    @required this.height,
    @required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * width,
      height: size.height * height,
      child: ElevatedButton(

        onPressed: onPressed,
        child: Text(
          title,
          style: textStyle,
        ),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(textColor),
          backgroundColor: MaterialStateProperty.all<Color>(buttonBackGroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color:mainColor,width: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}
