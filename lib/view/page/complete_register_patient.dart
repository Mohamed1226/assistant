import 'package:doctor_assistant/view/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class CompleteRegisterPatient extends StatefulWidget {
  final String firstName, lastName, sugreValue, pressureValue;
  final int currentAge;

  CompleteRegisterPatient(
      {@required this.firstName,
      @required this.lastName,
      @required this.sugreValue,
      @required this.pressureValue,
      @required this.currentAge});

  @override
  _CompleteRegisterPatientState createState() =>
      _CompleteRegisterPatientState();
}

class _CompleteRegisterPatientState extends State<CompleteRegisterPatient> {
  int height = 170;
  int weight = 60;
  bool gender = false;

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: 20,),
            Card(
              color: Colors.blueGrey.shade200,
              borderOnForeground: false,

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "$height Cm",
                      style: TextStyle(fontSize: 20),
                    ),

                    Text(
                      "$weight Kg",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      gender ? " ذكر" : "انثي",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50,),
            Divider(),
            Directionality(
              textDirection: TextDirection.rtl,
              child: CheckboxListTile(
                value: gender,
                title: Text('النوع'),
                subtitle: Text(gender ? "ذكر" : 'انثى'),
                onChanged: (bool val) {
                  setState(() {
                    gender = val;
                  });
                },
              ),
            ),
            Divider(),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("الطول",style: TextStyle(color: Colors.blue,fontSize: 20.0),),
                    NumberPicker(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black26),
                        ),
                        minValue: 50,
                        maxValue: 200,
                        value: height,
                        onChanged: (v) {
                          setState(() {
                            height = v;
                          });
                        }),
                  ],
                ),

                SizedBox(height: 20,),
                Column(
                  children: [
                    Text("الوزن",style: TextStyle(color: Colors.blue,fontSize: 20.0),),
                    NumberPicker(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black26),
                        ),
                        minValue: 2,
                        maxValue: 150,

                        value: weight,
                        onChanged: (v) {
                          setState(() {
                            weight = v;
                          });
                        }),
                  ],
                ),

              ],
            ),
            SizedBox(height: size.height*0.03,),
            CustomElevatedButton((){},"تسجيل المريض"
            ),
          ],

        ),
      ),
    );
  }
}
