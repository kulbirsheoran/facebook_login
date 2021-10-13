import 'package:facebook_login/db_helper.dart';
import 'package:facebook_login/signIn.dart';
import 'package:facebook_login/signup.dart';
import 'package:facebook_login/userinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
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
                  hintText: "Name"

                ),
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return "please input name";
                    }
                  }
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "Password"
                ),
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return "please input name";
                    }
                  }
              ),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: (){
                  if(formkey.currentState!.validate()){
                    String name=nameController.text;
                    String password=passwordController.text;
                    UserInfo? userInfo=DbHelper.userInfo;
                    if(userInfo==null){
                      print("Create Account");
                    }else{
                      if(name==userInfo.name&&password==userInfo.password){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context)=>Login()));
                      }
                      else{
                        print("Please create Account");
                      }
                    }
                  }
                  },
                  child:Text("SignIn")),

              SizedBox(height: 20),

              ElevatedButton(
                  onPressed: (){
                 Navigator.push(
                     context, MaterialPageRoute(
                     builder: (context)=>SignUp()));
                  },
                  child: Text("SignUp")),
            ],
          ),
        ),
      ),

    );
  }
}