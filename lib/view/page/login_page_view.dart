import 'package:doctor_assistant/view/page/smart_clinic_view.dart';
import 'package:doctor_assistant/view/widget/clip_path.dart';
import 'package:doctor_assistant/view/widget/custom_elevated_button.dart';
import 'package:doctor_assistant/view/widget/custom_text_field.dart';
import 'package:doctor_assistant/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class LogInView extends StatefulWidget {
  @override
  _LogInViewState createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String _email = "", _password = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _isLoading
        ? Container(
      color: Colors.white,
          child: Center(child: CircularProgressIndicator(
      strokeWidth: 20,

    )),
        )
        : Scaffold(
            backgroundColor: Colors.white,
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(top: 10, left: 15),
                        color: Colors.deepPurple,
                        height: size.height * 0.1,
                        width: size.width,
                        // child: IconButton(
                        //   icon: Icon(Icons.arrow_back,color: Colors.white,),
                        // ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.15,
                    ),
                    Image.asset(
                      "assets/images/smart.jfif",
                      height: 200,
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    CustomTextFormField(
                        validator: (val) {
                          if (val.isEmpty || !val.contains("@")) {
                            return "please input an correct email";
                          } else {
                            return null;
                          }
                        },
                      onChanged: (val) {
                        setState(() {
                          _email = val;
                        });
                      },
                      hint: "كود الدكتور",
                      prefixIcon: Icon(
                        Icons.code_outlined,
                        color: Colors.deepPurple,
                      ),
                      backgroundColor: Colors.amberAccent,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    CustomTextFormField(
                      validator: (val) {
                        if (val.isEmpty || val.length < 6) {
                          return "please input an strong password";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        setState(() {
                          _password = val;
                        });
                      },
                      hint: "كلمه المرور",
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.deepPurple,
                      ),
                      backgroundColor: Colors.amberAccent,
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    CustomElevatedButton((){
                      submit(context);
                    }, "دخول"),
                  ],
                ),
              ),
            ));
  }

  void submit(BuildContext cxt) async {
    final isValidate = _formKey.currentState.validate();
    FocusScope.of(cxt).unfocus();

    if (isValidate) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState.save();
      try {
        print("try view ");

        await Provider.of<AuthModelView>(cxt, listen: false)
            .auth(_email, _password)
            .then((v) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SmartClinicView()));
        });
        setState(() {
          _isLoading = false;
        });
      } catch (e) {
        Toast.show(e.toString(), context);
        setState(() {
          _isLoading = false;
        });
      }
      setState(() {
        _isLoading = false;
      });
    }
  }
}
