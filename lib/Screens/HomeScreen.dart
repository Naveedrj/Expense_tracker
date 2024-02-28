import 'package:expence_app/Screens/Add_expense.dart';
import 'package:expence_app/VIEWS/ViewExpanse.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:expence_app/MODELS/Expense.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Expense> expenses = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expenses',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
      body:  Column(
        children: [
          _buildChart(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddScreen,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildChart() {
    Map<String, double> categoryAmounts = {};

    // Calculate the total amount and amounts for each category
    double totalAmount = 0;
    for (var expense in expenses) {
      totalAmount += expense.amount;
      categoryAmounts.update(
        expense.catagory.name,
            (value) => value + expense.amount,
        ifAbsent: () => expense.amount,
      );
    }

    // Convert the data to a series
    var series = [
      charts.Series(
        id: 'Expenses',
        data: categoryAmounts.entries
            .map((entry) => _ChartData(entry.key, entry.value))
            .toList(),
        domainFn: (data, _) => data.category,
        measureFn: (data, _) => data.amount,
      ),
    ];

    // Create the chart
    var chart = charts.BarChart(
      series,
      animate: true,
    );

    // Wrap the chart in a SizedBox with a specific height
    return SizedBox(
      height: 300,
      child: chart,
    );
  }

  void _showAddScreen() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => AddExpense(addExpense: addExpense),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
      Navigator.pop(context);
    });
  }
}

class _ChartData {
  final String category;
  final double amount;

  _ChartData(this.category, this.amount);
}
