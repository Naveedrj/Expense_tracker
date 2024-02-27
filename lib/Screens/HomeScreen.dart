import 'package:expence_app/VIEWS/ViewExpanse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expence_app/MODELS/Expense.dart';
import 'package:expence_app/Screens/Add_expense.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Expense> expenses = [
    Expense(dateTime: DateTime.now(), catagory: Catagory.family , amount: 25.654654654, title: 'Title'),
    Expense(dateTime: DateTime.now(), catagory: Catagory.work, amount: 56, title: 'Title2')

  ];
  int iteration = 0;


  void _showAddScreen(){
    showModalBottomSheet(
        context: context,
        builder: (context) => AddExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black54
        ),
        ),
        actions: [
          IconButton(
              onPressed: _showAddScreen,
              icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text('chart'),
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (BuildContext context, int index) {
                  return ViewExpense(expense: expenses[index]);
                },
              ),
            )
          ],
        ),
      ),

    );
  }
}
