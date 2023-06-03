import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res.dart';

logoWidget(){
  return Container(
      margin: const EdgeInsets.only(top: 200),
      alignment: Alignment.topLeft,
      child:ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child:  Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.indigoAccent,width: 2.0)
          ),
          child: Image.asset(Res.logoImage,height: 90,width: 90,),
        ),
      )
  );
}