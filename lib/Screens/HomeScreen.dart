import 'package:expense_app/VIEWS/ViewExpanse.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/MODELS/Expense.dart';
import 'package:expense_app/Screens/Add_expense.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Expense> expenses = [

  ];
  int iteration = 0;


  void _showAddScreen(){
    showModalBottomSheet(
        context: context,
        builder: (context) => AddExpense(addExpense: addExpense),
    );
  }
  void addExpense(Expense expense){
    setState(() {
      expenses.add(expense);
    });
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
                  return Dismissible(
                    onDismissed: (direction){
                      setState(() {
                        expenses.removeAt(index);
                      });
                    } ,
                      key: ValueKey(expenses[index]),
                      child: ViewExpense(expense: expenses[index]));
                },
              ),
            )
          ],
        ),
      ),

    );
  }
}
