import 'package:doctor_assistant/view/page/bottom_bar_register.dart';
import 'package:doctor_assistant/view/page/bottom_bar_visitor.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'login_page_view.dart';

class SmartClinicView extends StatefulWidget {
  @override
  _SmartClinicViewState createState() => _SmartClinicViewState();
}

class _SmartClinicViewState extends State<SmartClinicView> {
  int currentIndex=0;
final List<Widget> tabs=[
  BottomBarRegister(),
BottomBarVisitor()
];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()async {
        await FirebaseAuth.instance.signOut().then((v) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LogInView()));
                  });
        }, icon: Icon(Icons.logout)),
        backgroundColor: Colors.deepPurple,
        title: Text(
          "العياده الذكيه",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        iconSize: 20,
        unselectedFontSize: 15.0,
        selectedFontSize: 20.0,
        selectedIconTheme: IconThemeData(size: 25.0,),
        unselectedIconTheme: IconThemeData(size: 20.0),
        fixedColor: Colors.deepPurple,

        currentIndex: currentIndex,

        onTap: (index){
         setState(() {
           currentIndex=index ;
         });
        },
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.app_registration), label: "تسجيل مريض" ),
          BottomNavigationBarItem(icon:Icon(Icons.home),label: "المسجلين", ),


        ],
      ),
    );
  }
}

