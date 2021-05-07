import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:paulonia_widgets/paulonia_button.dart';
import 'package:paulonia_widgets/enums.dart';
import 'package:paulonia_widgets/utils/functions/date_time_utils.dart';
import 'package:paulonia_widgets/components/gradient_outlined_button.dart';
import 'package:paulonia_widgets/utils/loading_overlay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    LoadingOverlay.of(context).during(
                        Future.delayed(Duration(seconds: 2)),
                        CircularProgressIndicator());
                  },
                  child: Text('fgewgew')),
              Text(PauloniaDateTimeUtils.dateTimeToString(
                  currentDateTime: DateTime.now(),
                  pivotDateTime: DateTime(
                    2021,
                    4,
                    20,
                  ))),
              Text(PauloniaDateTimeUtils.getDayMonthString(
                DateTime.now(),
              )),
              SizedBox(
                width: 200,
                height: 200,
                child: PauloniaButton(
                    onPressed: futureFunction,
                    onLongPressed: () async {
                      print('presed');
                    },
                    loadingButtonType: LoadingButtonType.none,
                    pauloniaButtonType: PauloniaButtonType.outlined,
                    loadingWidget: CircularProgressIndicator(),
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.ac_unit_outlined),
                        Text(
                          'hey',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    )),
              ),
              SizedBox(
                width: 200,
                height: 100,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color(0xff005FAC),
                        Color(0xff008E34),
                        Color(0xffFF8F39),
                      ])),
                    ),
                    Container(
                      height: 350.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(0.1),
                              Colors.white,
                            ],
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: GradientOutlinedButton(
                  strokeWidth: 1,
                  gradient:
                      LinearGradient(colors: [Colors.green, Colors.yellow]),
                  onPressed: () {},
                  radius: 5,
                  child: Text('data'),
                ),
              ),
              Container(
                  width: 200,
                  height: 50,
                  child: PauloniaButton.outlinedGradient(
                    child: Text('outlined'),
                    onPressed: () async {
                      await Future.delayed(Duration(seconds: 2));
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                title: Text('data'),
                              ),
                            ),
                          ));
                    },
                    loadingWidget: Text(
                      'cargando',
                      style: TextStyle(fontSize: 50),
                    ),
                    loadingButtonType: LoadingButtonType.local,
                    gradient:
                        LinearGradient(colors: [Colors.green, Colors.yellow]),
                  )),
              Container(
                color: Colors.red,
                child: Text(
                  'Hola',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> futureFunction() async {
    await Future.delayed(Duration(seconds: 4));
  }

  Future<void> futureFunction2() async {
    await Future.delayed(Duration(seconds: 4));
  }
}
