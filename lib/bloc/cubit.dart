import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qist/bloc/states.dart';
import 'package:qist/shared/const.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  int productPrice = 0;
  int prePaid = 0;
  int numberOfMonths = 0;
  int moneyPaidMonthly = 0;

  int theRest = 0;
  int theBenefits;
  int totalPrice = 0;
  double restOfTheRest = 0;

  static AppCubit get(context) => BlocProvider.of(context);

  void setProductPriceValue(input) {
    productPrice = int.parse(input);
    emit(ProductPriceValue());
  }

  void setPrePaidValue(input) {
    prePaid = int.parse(input);
    emit(PrePaidValue());
  }

  void setTheRestValue(input) {
    theRest = input;
    emit(TheRestValue());
  }

  void setTheTotalPriceValue(input) {
    totalPrice = input;
    emit(TotalPriceValue());
  }

  void setNumberOfMonthsValue(input) {
    numberOfMonths = int.parse(input);
    emit(NumberOfMonthsValue());
  }

  void setMoneyPaidMonthlyValue(input) {
    moneyPaidMonthly = int.parse(input);
    emit(MoneyPaidMonthlyValue());
  }

  void findTheRest() {
    theRest = productPrice - prePaid;
    emit(TheRest());
  }

  void findTheBenefits() {
    theBenefits = numberOfMonths * benefit * theRest ~/ 100;
    emit(FindTheBenefits());
  }

  void findTotalPrice() {
    totalPrice = theBenefits + productPrice;
    emit(FindTotalPrice());
  }

  void findTotalPriceForMonthCalculate() {
    totalPrice =
        ((numberOfMonths * moneyPaidMonthly) + (restOfTheRest + prePaid))
            .toInt();
    emit(FindTotalPrice());
  }

  void findNumberOfMonths() {
    numberOfMonths =
        (theRest / (moneyPaidMonthly - benefit * theRest / 100)).floor();
    emit(FindNumberOfMonths());
  }

  void findMoneyPaidMonthly() {
    moneyPaidMonthly = (theRest + theBenefits) ~/ numberOfMonths;
    emit(FindPaidMonthly());
  }

  void findTheRestOfTheRest() {
    restOfTheRest = theRest % (moneyPaidMonthly - theRest * benefit / 100);
    emit(TheRestOfTheRest());
  }

  // ignore: missing_return
  String findNumberOfMonthsAsAText() {
    int NOM = numberOfMonths;
    double ROR = restOfTheRest;
    if (NOM == 0) {
      return '0';
    } else if (NOM > 2 && NOM < 10 && ROR != 0) {
      return '$NOM شهور + ${ROR.toInt()}جـ ';
    } else if (NOM > 2 && NOM < 10 && ROR == 0) {
      return '$NOM شهور ';
    } else if (NOM > 10 && ROR != 0) {
      return '$NOM شهر + ${ROR.toInt()}جـ ';
    } else if (NOM > 10 && ROR == 0) {
      return '$NOM شهر ';
    } else if (NOM == 10 && ROR != 0) {
      return '$NOM أشهر + ${ROR.toInt()}جـ ';
    } else if (NOM == 10 && ROR == 0) {
      return '$NOM أشهر ';
    } else if (NOM == 2 && ROR != 0) {
      return ' شهرين + ${ROR.toInt()}جـ ';
    } else if (NOM == 2 && ROR == 0) {
      return ' شهرين ';
    } else if (NOM == 1 && ROR != 0) {
      return ' شهر + ${ROR.toInt()}جـ ';
    } else if (NOM == 1 && ROR == 0) {
      return ' شهر واحد ';
    }
    emit(FindNumberOfMonthsAsAText());
  }
}
