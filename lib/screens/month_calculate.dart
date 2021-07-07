import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qist/bloc/cubit.dart';
import 'package:qist/bloc/states.dart';
import 'package:qist/shared/style.dart';
import 'package:qist/widgets/my_empty_container.dart';
import 'package:qist/widgets/my_text_field.dart';
import 'package:qist/widgets/my_filled_container.dart';
import 'package:qist/widgets/my_button.dart';
import 'package:qist/widgets/my_app_bar.dart';
import 'package:qist/widgets/price_plus_prepaid_ui.dart';

class MonthCalculate extends StatefulWidget {
  const MonthCalculate({Key key}) : super(key: key);

  @override
  _MonthCalculateState createState() => _MonthCalculateState();
}

final firstField = TextEditingController();
final secondField = TextEditingController();
final thirdField = TextEditingController();

@override
void dispose() {
  // Clean up the controller when the widget is disposed.
  firstField.dispose();
  secondField.dispose();
  thirdField.dispose();
  //super.dispose();
}

class _MonthCalculateState extends State<MonthCalculate> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Scaffold(
              appBar: MyAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: size.height * .30,
                      child: Column(
                        children: [
                         PricePlusPrePaidUi(firstField: firstField, secondField: secondField),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyFilledContainer(
                                  title: 'قيمة القسط',
                                ),
                                MyTextField(
                                  controller: thirdField,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * .2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyButton(
                            title: 'حســاب',
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              cubit.setProductPriceValue(firstField.text);
                              cubit.setPrePaidValue(secondField.text);
                              cubit.setMoneyPaidMonthlyValue(thirdField.text);

                              if (cubit.productPrice > cubit.prePaid ){
                                cubit.findTheRest();
                                cubit.findNumberOfMonths();
                                cubit.findTheRestOfTheRest();
                                cubit.findTotalPriceForMonthCalculate();
                              } else {
                                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('قم بوضع القيم اولاَ')));
                                return showDialog(
                                  context: context,
                                  builder: (_) => new AlertDialog(
                                    title: new Text("تحذير"),
                                    content: new Text(
                                        "الرجاء التأكد من القيم المدخلة"),
                                  ),
                                );
                              }
                            },
                            textColor: Color.fromRGBO(5, 166, 5, 1),
                            width: .4,
                            height: .07,
                            textStyle: Style.mainTextStyle,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .08,
                          ),
                          MyButton(
                            title: 'مسح',
                            onPressed: () {
                              firstField.clear();
                              secondField.clear();
                              thirdField.clear();
                              cubit.setTheRestValue(0);
                              cubit.setNumberOfMonthsValue('0');
                              cubit.setTheTotalPriceValue(0);

                            },
                            textColor: Color.fromRGBO(232, 21, 70, 1),
                            width: .4,
                            height: .07,
                            textStyle: Style.mainTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * .30,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyFilledContainer(
                                  title: 'الباقي',
                                ),
                                MyEmptyContainer(
                                  value: cubit.theRest.toString(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyFilledContainer(
                                  title: 'عدد الشهور',
                                ),
                                MyEmptyContainer(
                                  value: cubit.findNumberOfMonthsAsAText(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyFilledContainer(
                                  title: 'السعر النهائي',
                                ),
                                MyEmptyContainer(
                                  value: cubit.totalPrice.toString(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
