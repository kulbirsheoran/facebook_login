import 'package:facebook_login/db_helper.dart';
import 'package:facebook_login/userinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  TextEditingController nameController=TextEditingController();
  TextEditingController mobileNoController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                      labelText: "Name",
                      hintText: "Please Input Name"

                  ),
                validator: (value){
                    if(value==null||value.isEmpty){
                      return "please input name";
                    }
                }

              ),
              SizedBox(height: 8,),
              TextFormField(
                  controller: mobileNoController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Mobile NO",
                    hintText: "Please Input Mobile No "
                ),
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return "please input mobile no";
                    }
                  }
              ),
              SizedBox(height: 8,),
              TextFormField(
                  controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: "Please Input Password"
                ),
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return "please input password";
                    }
                  }
              ),
              SizedBox(height: 8,),
              TextFormField(
                  controller: confirmPasswordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirm Password",
                    hintText: "Please Confirm Password"
                ),
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return "please Confirm Password";
                    }if(value!=passwordController.text){
                      return "please input same Password";
                    }
                  }
              ),
              SizedBox(height: 8,),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: ()async{
                     createAccount(context);
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createAccount(BuildContext context) async {
    if(formkey.currentState!.validate()){
      String name=nameController.text;
      String mobile=mobileNoController.text;
      String password=passwordController.text;
      String confirmPassword=confirmPasswordController.text;

      SharedPreferences sp =await SharedPreferences.getInstance();
      sp.setString("name", name);
      sp.setString("password", password);
      sp.setString("mobile", mobile);

      Navigator.push(
          context, MaterialPageRoute(
          builder: (context)=>HomePage()));
    }
  }
}
