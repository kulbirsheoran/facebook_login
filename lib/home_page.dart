import 'package:facebook_login/db_helper.dart';
import 'package:facebook_login/dashboard.dart';
import 'package:facebook_login/signup.dart';
import 'package:facebook_login/userinfo.dart';
import 'package:facebook_login/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPassword = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name",
                      hintText: "Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please input name";
                    }
                  }),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                  obscureText: isPassword,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: "Password",
                    suffixIcon: InkWell(
                      child: Icon(
                        Icons.remove_red_eye,
                        color: Colors.green,
                      ),
                      onTap: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please input name";
                    }
                  }),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    login(context);
                  },
                  child: Text("SignIn")),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text("SignUp")),
            ],
          ),
        ),
      ),
    );
  }

  Future login(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      String name = nameController.text;
      String password = passwordController.text;

      SharedPreferences sp = await SharedPreferences.getInstance();

      String? savedName = sp.getString("name");
      String? savedPassword = sp.getString("password");

      if (savedName == null || savedPassword == null) {
        //show toast of create acc
      } else {
        if (name == savedName && password == savedPassword) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        } else {
          print('wrong name or password');
        }
      }
    }
  }
}
