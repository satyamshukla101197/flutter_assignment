import 'dart:io';

import 'package:assignment/app_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:dio/dio.dart' as dio;
import '../../api_provider/api_provider.dart';
import '../../common_function.dart';
import '../../model/profile_submit_model.dart';
import '../../utills/progress_dialog.dart';

class WelcomeController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');



  submitDetails()async{
    if(nameController.text.isEmpty){
      showToast("Please enter name ");
    }else if(emailController.text.isEmpty){
      showToast("Please enter email ");
    }else if(!emailRegex.hasMatch(emailController.text)){
      showToast("Please enter valid email ");
    }else{
      await submitDetailsApi();
    }
  }


/// Submit details api
  submitDetailsApi() async{
    try{
      ProgressDialog progressDialog=ProgressDialog();
      progressDialog.show();
      final params = {
        'name': nameController.text,
        'email': emailController.text,
      };
      ProfileSubmitModel otpVerifiedModel=await ApiProvider.baseWithToken().profileSubmit(params);
      progressDialog.dismiss();
      if(otpVerifiedModel.status ==true){
        Get.toNamed(AppRoutes.homepage, );

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