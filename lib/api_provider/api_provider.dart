import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../model/otpVerified_model.dart';
import '../model/profile_submit_model.dart';
import '../model/send_otp_model.dart';
import 'Diologger.dart';
import 'api_constants.dart';

class ApiProvider {

  Dio _dio = Dio();
  DioError? _dioError;

  ApiProvider.base() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = baseUrl;
    _dio = Dio(dioOptions);
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      options.headers = {'Content-Type': 'application/json'};
      DioLogger.onSend(tag, options);
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(tag, response);
      return handler.next(response);
    }, onError: (DioError error, handler) {
      _dioError = error;
      DioLogger.onError(tag, error);
      return handler.next(error);
    }));
  }

  ApiProvider.baseWithToken() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = baseUrl;
    _dio = Dio(dioOptions);
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      String? accessToken =  GetStorage().read("access_token");
      options.headers = {'Content-Type': 'application/json'};
      options.headers = {'token': accessToken};
      DioLogger.onSend(tag, options);
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(tag, response);
      return handler.next(response);
    }, onError: (DioError error, handler) {
      _dioError = error;
      DioLogger.onError(tag, error);
      return handler.next(error);
    }));
  }





/// Api Calling


  Future sendOtp(Map<String,dynamic> data) async {
    try {
      Response response = await _dio.post(strSendOtp,data: data);
      Map<String, dynamic> parsedResponse = json.decode(response.data);
      return SendOtpResponse.fromJson(parsedResponse);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }



  Future otpVerified(Map<String,dynamic> data) async {
    try {
      Response response = await _dio.post(strOtpVerified,data: data);
      Map<String, dynamic> parsedResponse = json.decode(response.data);
      return OtpVerifiedModel.fromJson(parsedResponse);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }

  Future profileSubmit(Map<String,dynamic> data) async {
    try {
      Response response = await _dio.post(strProfileSubmit,data: data);
      Map<String, dynamic> parsedResponse = json.decode(response.data);
      return ProfileSubmitModel.fromJson(parsedResponse);
    } catch (error, stacktrace) {
      handleException(error, stacktrace, _dioError!);
    }
  }


}