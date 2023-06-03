import 'dart:io';

import 'package:assignment/api_provider/api_provider.dart';
import 'package:assignment/utills/progress_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../app_route.dart';
import '../../common_function.dart';
import '../../model/send_otp_model.dart';

class LoginController extends GetxController{

  TextEditingController loginController = TextEditingController();


  void onInit(){
    if(Get.arguments!=null){
      loginController.text=Get.arguments;
    }
  }


  sendOtp()async{
    if(loginController.text.isEmpty){
      showToast("Please enter mobile number");
    }else if(loginController.text.length<10){
      showToast("Please enter 10 digit number");
    }else{
     await sendOtpApi();
    }
  }


  sendOtpApi()async{
    try{
      ProgressDialog progressDialog=ProgressDialog();
      progressDialog.show();
     final params = {
        'mobile': loginController.text,
      };
      SendOtpResponse sendOtpModel=await ApiProvider.base().sendOtp(params);
      progressDialog.dismiss();
      if(sendOtpModel.status ==true){
        Get.toNamed(AppRoutes.otp,arguments:[{'requestId':sendOtpModel.requestId},{'mobileNumber':loginController.text}] );
      }else{
        showToast("Error");
      }
    }on HttpException catch (exception) {
      debugPrint(exception.message);
       showToast(exception.message);
    } catch (exception) {
      debugPrint(exception.toString());
      showToast(exception.toString());
    }
  }
}