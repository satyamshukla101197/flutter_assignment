import 'package:flutter/material.dart';

commonTextField({required  controller,required keyboardType,required hintText}){
  return Container(
    child: TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      style: TextStyle(fontSize: 14,color: Colors.black),
      decoration: InputDecoration(
        filled: true,
          enabledBorder:  OutlineInputBorder(
            borderRadius:  BorderRadius.circular(20.0),
            borderSide:  BorderSide(color: Colors.indigoAccent,width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(20.0),
            borderSide:  BorderSide(color: Colors.indigoAccent,width: 2.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide:  BorderSide(color: Colors.indigoAccent,width: 2.0),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey, fontSize: 14,)),
    ),
  );
}