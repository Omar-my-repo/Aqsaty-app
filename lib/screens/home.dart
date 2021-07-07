import 'package:flutter/material.dart';
import 'package:qist/screens/qist_calculate.dart';
import 'package:qist/shared/style.dart';
import 'package:qist/widgets/my_button.dart';

import 'month_calculate.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/top_left.png',
              width: size.width * .3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/bottom_left.png',
              width: size.width * .3,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bottom_right.png',
              width: size.width * .6,
              fit: BoxFit.cover,
              height: size.height*.2,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                title: 'حساب قيمة القسط',
                width: 0.75,
                height: 0.15,
                textStyle: Style.homeButtonsTextStyle,
                textColor: mainColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QistCalculate()),
                  );
                },
              ),
              SizedBox(
                height: size.height * .05,
              ),
              MyButton(
                title: 'حساب الشهور',
                width: 0.75,
                height: 0.15,
                textStyle: Style.homeButtonsTextStyle,
                textColor: mainColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MonthCalculate()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
