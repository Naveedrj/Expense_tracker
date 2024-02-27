import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:expence_app/MODELS/Expense.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpense> {

  void onTap()async{

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            TextField(
              maxLength: 50,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 10), // Added SizedBox for spacing
            Row(
              children: [
                Expanded(
                  child: TextField(
                    maxLength: 50,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                  ),
                ),
                SizedBox(width: 80,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Date'),
                ),
                ),
                IconButton(
                  onPressed: () {
                    // Add your logic for handling date selection
                  },
                  icon: Icon(Icons.date_range),
                ),
              ],
            ),
            DropdownButton(
                items: Catagory.values.map((e) => DropdownMenuItem(child: Text(e.name.toString()))).toList(),
                onChanged: (value){},
            ),
            
            
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                        ),
                          onPressed: (){},
                          child: Text('Cancel')
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                          ),
                          onPressed: (){},
                          child: Text('Add Expense')
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
