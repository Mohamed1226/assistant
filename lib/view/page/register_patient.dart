import 'package:doctor_assistant/view/page/complete_register_patient.dart';
import 'package:doctor_assistant/view/widget/custom_elevated_button.dart';
import 'package:doctor_assistant/view/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class RegisterNewPatient extends StatefulWidget {
  @override
  _RegisterNewPatientState createState() => _RegisterNewPatientState();
}

class _RegisterNewPatientState extends State<RegisterNewPatient> {
  bool sugre = false;
  bool pressure = false;
  int currentAge = 15;
  String firstName="", lastName="";

  //NumberPicker _numberPicker;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text('انشاء حساب مريض جديد'),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: CustomTextFormField(
                        borderRaduis: 5,
                        hint: 'الاسم الثاني',
                        backgroundColor: Colors.orange.withOpacity(.5),
                        width: size.width * .9,
                        onChanged: (val) {
                          setState(() {
                            lastName = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        borderRaduis: 5,
                        backgroundColor: Colors.orange.withOpacity(.5),
                        hint: 'الاسم الاول',
                        width: size.width * .9,
                        onChanged: (val) {
                          setState(() {
                            firstName = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: CheckboxListTile(
                    value: sugre,
                    title: Text('مريض بالسكر ؟'),
                    subtitle: Text(sugre ? 'مريض بالسكر' : 'ليس مريضا بالسكر'),
                    onChanged: (bool val) {
                      setState(() {
                        sugre = val;
                      });
                    },
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: CheckboxListTile(
                    value: pressure,
                    title: Text('مريض بالضغط ؟'),
                    subtitle:
                        Text(pressure ? 'مريض بالضغط' : 'ليس مريضا بالضغط'),
                    onChanged: (bool val) {
                      setState(() {
                        pressure = val;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width * 0.5,
                  height: size.height * .25,
                  child: ListView(
                    children: [
                      Text(
                        "عمر المريض $currentAge سنه ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      NumberPicker(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black26),
                          ),
                          minValue: 0,
                          maxValue: 70,
                          value: currentAge,
                          onChanged: _handleValueChanged),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                CustomElevatedButton(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CompleteRegisterPatient(
                            currentAge: currentAge,
                            pressureValue:
                                pressure ? 'مريض بالضغط' : 'ليس مريضا بالضغط',
                            sugreValue:
                                sugre ? 'مريض بالسكر' : 'ليس مريضا بالسكر',
                            firstName: firstName,
                            lastName: lastName,
                          )));
                }, "التالي", Colors.orange),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _handleValueChanged(num value) {
    if (value != null) {
      setState(() {
        currentAge = value;
      });
    }
  }
}
