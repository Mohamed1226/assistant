
import 'package:flutter/material.dart';
class BottomBarVisitor extends StatefulWidget {
  @override
  _BottomBarVisitorState createState() => _BottomBarVisitorState();
}

class _BottomBarVisitorState extends State<BottomBarVisitor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount: 20,itemBuilder: (context,index){
        return Card(
          child: ListTile(
            title:Text("Patient Name") ,
            subtitle: Text("patient type"),
            leading: Icon(Icons.visibility),
            // trailing: Row(
            //   children: [
            //     Text("170 cm"),
            //     Text("70 kg"),
            //     Text("36 years"),
            //   ],
            // ),

          ),
        );
      }),
    );
  }
}
