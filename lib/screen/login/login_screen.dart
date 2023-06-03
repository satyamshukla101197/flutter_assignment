import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../common_function.dart';
import '../../common_widget/common_button.dart';
import '../../common_widget/logo.dart';
import '../../res.dart';
import 'login_controller.dart';

class LoginScreen extends  GetView<LoginController>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
       resizeToAvoidBottomInset : false,
       backgroundColor: Colors.white,
       body: Container(
         margin: EdgeInsets.all(20),
         child: Column(
           children:  <Widget>[
             _imageWidget(),
             const SizedBox(height: 20,),
             _textFieldWidget(),
             const SizedBox(height: 30,),
             _buttonWidget()
           ],
         ),
       )
   );
  }

  /// Image Widget
  _imageWidget() {
    return logoWidget();
  }

  /// TextField widget
  _textFieldWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.indigoAccent,width: 2.0)
      ),
      child: Row(
        children: <Widget>[
           SizedBox(
             width: Get.width*0.2,
            child:  const CountryCodePicker(
              initialSelection: 'IN',
              favorite: ['+91'],
              showCountryOnly: true,
              showFlag: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
            ),
          ),
          Expanded(
            child: TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(10)
              ],
              controller: controller.loginController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Mobile Number",
              ),
              onChanged: (value) {
                // this.phoneNo=value;

              },
            ),
          ),
        ],
      ),
    );
  }

  /// Button widget
  _buttonWidget() {
    return commonButton(buttonName: 'Continue', function: (){
      controller.sendOtp();
    });
  }

}