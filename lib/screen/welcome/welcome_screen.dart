import 'package:assignment/screen/welcome/welcome_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../common_widget/commonTextField.dart';
import '../../common_widget/common_button.dart';

class WelcomeScreen extends  GetView<WelcomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            _TextWidget(),
            SizedBox(height: 30,),
            _textFieldWidget(),
            SizedBox(height: 30,),
            _buttonWidget()
          ],
        ),
      ),
    );
  }

  /// Text widget
  _TextWidget() {
    return  Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Welcome",style: TextStyle(fontSize: 18,color: Colors.black,),),
          SizedBox(height: 10,),
          Text("Looks like you are new here. Tell us a bit about yourself.",style: TextStyle(fontSize: 16,color: Colors.black),),
        ],
      ),
    );
  }


  /// Text Field widget
  _textFieldWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          commonTextField(
              controller: controller.nameController,
              keyboardType: TextInputType.text,
              hintText: "Name"
          ),
          const SizedBox(height: 30,),
          commonTextField(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: "Email"
          ),

        ],
      ),
    );
  }

  /// Button widget
  _buttonWidget() {
    return commonButton(buttonName: 'Submit', function: (){
      controller.submitDetails();
    });
  }

}