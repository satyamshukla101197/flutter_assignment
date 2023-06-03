
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

String tag = 'api_provider';

/// Base url
final baseUrl = 'https://test-otp-api.7474224.xyz/';


/// Static keys
const access_token = 'accessToken';

/// Api end point
final String strSendOtp = 'sendotp.php';
final String strOtpVerified = 'verifyotp.php';
final String strProfileSubmit = 'profilesubmit.php';










handleException(error,stacktrace,DioError dioError){
  debugPrint("Exception occurred: $error stackTrace: $stacktrace");
  if (dioError.response!.statusCode == 401) {
    throwIfNoSuccess("unauthorized");
  } else if (dioError.response!.statusCode == 500) {
    if (dioError.response!.data == null) {
      throwIfNoSuccess("Server Error");
    } else {
      throwIfNoSuccess(dioError.response!.data['message']);
    }
  } else {
    if (dioError.response!.data == null) {
      throwIfNoSuccess("Something Went Wrong");
    } else {
      throwIfNoSuccess(dioError.response!.data['message']);
    }
  }
}

void throwIfNoSuccess(String response) {
  throw HttpException(response);
}