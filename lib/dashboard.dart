import 'package:facebook_login/add_expense.dart';
import 'package:facebook_login/view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String userName = 'User';

  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userName = sp.getString('name') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hello $userName sir'),
          actions: [
            IconButton(
                onPressed: () async {
                  //Open Login page
                },
                icon: Icon(Icons.logout))
          ],
          bottom: TabBar(
            tabs: [Text("View"), Text("Add Expense")],
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
