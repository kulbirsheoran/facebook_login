import 'package:facebook_login/db_helper.dart';
import 'package:facebook_login/expense_info.dart';
import 'package:facebook_login/userinfo.dart';
import 'package:flutter/material.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  late List<Expense> expenseList;
  void initState(){
    expenseList=DbHelper.expenseList ?? [];
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Expanded(
          child: ListView.builder(
              itemCount: expenseList.length,
              shrinkWrap: true,
              itemBuilder: (context,index){
                Expense expense=expenseList[index];
                return InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width:2,color: Colors.black),
                      color: Colors.green[200]
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("name: ${expense.name}"),
                        SizedBox(height: 8,),
                        Text("amount: ${expense.amount}"),
                        SizedBox(height: 8,),
                        Text("amount: ${expense.date}"),
                      ],
                    ),
                  ),
                  onTap: (){
                    setState(() {Icon(Icons.delete);
                      expenseList.indexOf(expenseList[index]);
                      expenseList.removeAt(index);
                    });
                  },
                );
              }
          )

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.refresh),
      ),


    );
  }
}
