import 'package:assignment/screen/otp/otp_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../common_widget/common_button.dart';
import '../../common_widget/logo.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children:  <Widget>[
                _imageWidget(),
                const SizedBox(height: 20,),
                _textWidget(),
                const SizedBox(height: 20,),
                _textFieldWidget(),
                const SizedBox(height: 30,),
                _buttonWidget(),
                const SizedBox(height: 20,),
                _retryTextButton()
              ],
            ),
          ),
        )
    );
  }

  /// Image Widget
  _imageWidget() {
    return logoWidget();
  }

  /// TextWidget
  _textWidget() {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Enter OTP",style: TextStyle(fontSize: 20,color: Colors.black,),),
          SizedBox(height: 10,),
          Text("OTP has been sent to +91-${controller.mobileNumber.value}",style: TextStyle(fontSize: 16,color: Colors.black),),
        ],
      ),
    );
  }

  /// Otp Fiels
  _textFieldWidget() {
    return OtpTextField(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      numberOfFields: 6,
      clearText: true,
      keyboardType: TextInputType.number,
      borderColor: Colors.indigoAccent,
      disabledBorderColor:Colors.indigoAccent ,
      enabledBorderColor: Colors.indigoAccent,
      showFieldAsBox: true,
      onCodeChanged: controller.onOtpCodeChanged,
      onSubmit: controller.onOtpCodeChanged,
    );
  }

  /// Button widget
  _buttonWidget() {
    return commonButton(buttonName: 'Verify', function: (){
      controller.otpVerify();
    });
  }


  /// Retry text button
  _retryTextButton() {
    return GestureDetector(
      onTap: (){
        controller.navigateToLoginScreen();
      },
      child: Container(
        child: Text('Retry',style: TextStyle(fontSize: 16,color: Colors.black,decoration: TextDecoration.underline,),),
      ),
    );
  }
}
