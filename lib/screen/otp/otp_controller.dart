import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get_storage/get_storage.dart';
import '../../api_provider/api_constants.dart';
import '../../api_provider/api_provider.dart';
import '../../app_route.dart';
import '../../common_function.dart';
import '../../model/otpVerified_model.dart';
import '../../utills/progress_dialog.dart';

class OtpController extends GetxController{
  TextEditingController otpController = TextEditingController();
  RxString otpCode = ''.obs;
  RxString requistId = ''.obs;
  RxString mobileNumber = ''.obs;

  @override
  void onInit() {
   requistId.value=Get.arguments[0]['requestId'];
   mobileNumber.value=Get.arguments[1]['mobileNumber'];
    super.onInit();
  }


  void onOtpCodeChanged(String code) {
    otpCode.value = code;
  }



  otpVerify()async{
    if(otpCode.value==null ||otpCode.value.isEmpty){
      showToast("Please enter valid otp");
    }else if(otpCode.value.length<6){
      showToast("Please enter valid otp");
    }else{
     await otpVerifiedApi();
    }
  }

  /// Otp verified api
  otpVerifiedApi() async{
    try{
      ProgressDialog progressDialog=ProgressDialog();
      progressDialog.show();
     final params = {
        'request_id': requistId.value,
        'code': otpCode.value,
      };
      OtpVerifiedModel otpVerifiedModel=await ApiProvider.base().otpVerified(params);
      progressDialog.dismiss();
      if(otpVerifiedModel.status ==true){
        GetStorage().write("access_token", otpVerifiedModel.jwt.toString());
        if(otpVerifiedModel.profileExists==true){
          Get.toNamed(AppRoutes.homepage, );
        }else{
          Get.toNamed(AppRoutes.welcome, );
        }

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


  /// retry

  navigateToLoginScreen(){
    Get.toNamed(AppRoutes.login,arguments: mobileNumber.value);
  }
}