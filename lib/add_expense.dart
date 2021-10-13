import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController nameController=TextEditingController();
  TextEditingController amountController=TextEditingController();
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [Container(
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "Name Expense"
                ),
                validator: (value){
                  if(value==null||value.isEmpty){
                    return"please input expense";
                  }
                },
              ),
            ),
              TextFormField(
                  controller: amountController,
                  decoration: InputDecoration(
                      hintText: "Amount"
                  ),
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return"please input amount";
                    }
                  }
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                if(formkey.currentState!.validate()){}
              }, child: Text("Submit"))
            ],
          ),
        ),
      ),
    );

  }
}
