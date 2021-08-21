import 'package:doctor_assistant/view/page/login_page_view.dart';
import 'package:doctor_assistant/view/widget/clip_path.dart';
import 'package:doctor_assistant/view/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: size.height * 0.21,
                  decoration: BoxDecoration(color: Colors.deepPurple),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                "smart medicine (assistant)",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              Image.asset("assets/images/start_assistant.jpg"),
            CustomElevatedButton(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return LogInView();
                  }));
            }, "بدأ"),
            ],
          ),
        ),
      ),
    );
  }
}
