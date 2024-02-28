import 'package:flutter/material.dart';
import 'package:expence_app/MODELS/Expense.dart';
import 'package:intl/intl.dart';

class ViewExpense extends StatelessWidget {
  const ViewExpense({Key? key, required this.expense}) : super(key: key);

  final Expense expense;

  String formatter(DateTime dateTime) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    String formattedDate = dateFormat.format(dateTime);
    return formattedDate;
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'Arial'
            ),
            ),
            SizedBox(height: 7,),
            Row(
              children: [
                Text("\$ ${expense.amount.toStringAsFixed(2)}"),
                Spacer(),
                Icon(CatagoryIcons[expense.catagory]),
                SizedBox(width: 5,),
                Text(formatter(expense.dateTime))
              ],
            )
          ],
        ),
      ),
    );
  }
}
