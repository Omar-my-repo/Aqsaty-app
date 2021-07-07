import 'package:flutter/material.dart';

//const mainColor = Color(0xff6f35a5);                      1
//const secondColor = Color(0xfff1e6ff);                    1

// const mainColor = Color.fromRGBO(44, 125, 250, 1);       2
// const secondColor = Color.fromRGBO(231, 246, 253, 1);    2

const mainColor = Color.fromRGBO(15,157,88, 1);
const secondColor = Color.fromRGBO(15,157,88, .1);
const buttonBackGroundColor=Color.fromRGBO(231, 246, 253, 1);
const appBarTitleColor = Colors.white;

abstract class Style {
  static const TextStyle mainTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle homeButtonsTextStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600);
}
