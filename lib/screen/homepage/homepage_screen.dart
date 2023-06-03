import 'package:assignment/screen/homepage/homepage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomePageScreen extends GetView<HomePageController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.separated(
            separatorBuilder: (BuildContext context,int index){
              return SizedBox(height: 10,);
            },
            itemCount: controller.imageData.length,
          itemBuilder:(BuildContext context,int index){
              return Container(
                child: Image.asset(controller.imageData[index]),
              );
          },
        ),
      ),
    );
  }

}