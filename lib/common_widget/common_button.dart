import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

commonButton({required String buttonName,required Function function}){
  return GestureDetector(
    onTap: (){
      function();
    },
    child: Container(
      alignment: Alignment.center,
      height: Get.height*0.05,
      width: Get.width*0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black38,
          border: Border.all(color: Colors.indigoAccent,width: 2.0)
      ),
      child: Text(buttonName,style: const TextStyle(fontSize: 14,color: Colors.white),),
    ),
  );
}