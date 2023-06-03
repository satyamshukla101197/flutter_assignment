import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../res.dart';
import '../../common_function.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    hideKeyBoard(context);
    return GetBuilder<SplashController>(
        builder: (controller) {
          return const Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Text("Welcome to app ")
              )
          );
        }
    );
  }
}
