import 'package:facebook_login/add_expense.dart';
import 'package:facebook_login/view.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
      child: Scaffold(

        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Text("View"),
              Text("Add Expense")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            View(),
            AddExpense(),

          ],
        ),
      ),
    );

  }
}
