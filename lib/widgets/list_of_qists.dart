/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qist/cubit/cubit.dart';
import 'package:qist/cubit/states.dart';
import 'package:qist/widgets/my_filled_container.dart';
import 'package:qist/widgets/my_text_field.dart';

class ListOfQists extends StatefulWidget {
  ListOfQists({Key key}) : super(key: key);

  @override
  _ListOfQistsState createState() => _ListOfQistsState();
}

class _ListOfQistsState extends State<ListOfQists> {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<AppCubit, AppStates>(
      // listener: (context, state) {},
      //bloc:AppCubit ,
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Container(
          height: size.height * .4,
          color: Colors.red,
          child: Column(
            children: [
              Row(
                children: [
                  MyFilledContainer(title: 'عدد الشهور'),
                  MyFilledContainer(title: 'قيمة القسط'),
                  //MyFilledContainer(title: 'السعر النهائي'),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, i) {
                      return Container(
                        width: 20,
                        height: 120,
                        child: Table(
                          children: [
                            TableRow(children: [
                              Column(children: [
                                Text('Website',
                                    style: TextStyle(fontSize: 20.0))
                              ]),
                              Column(children: [
                                Text('Tutorial',
                                    style: TextStyle(fontSize: 20.0))
                              ]),
                              Column(children: [
                                Text('Review', style: TextStyle(fontSize: 20.0))
                              ]),
                            ]),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}

*/