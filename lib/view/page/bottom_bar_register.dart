import 'package:doctor_assistant/view/widget/custom_elevated_button.dart';
import 'package:doctor_assistant/view/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'register_patient.dart';

class BottomBarRegister extends StatefulWidget {
  @override
  _BottomBarRegisterState createState() => _BottomBarRegisterState();
}

class _BottomBarRegisterState extends State<BottomBarRegister> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              width: size.width * 0.9,
              margin: EdgeInsets.only(top: size.height * 0.05),
              decoration: BoxDecoration(color: Colors.amberAccent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "محمد",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text("اسم الدكتور", style: TextStyle(fontSize: 30)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Text(
            "ادخل رقم تليفون المريض لارساله الي الدكتور",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          CustomTextFormField(
            hint: "رقم تليفون المريض",
            prefixIcon: Icon(Icons.code),
            backgroundColor: Colors.amberAccent,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          CustomElevatedButton(() {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => RegisterNewPatient()));
          }, "ادخال"),
          SizedBox(
            height: size.height * 0.1,
          ),
        ],
      ),
    );
  }
}
