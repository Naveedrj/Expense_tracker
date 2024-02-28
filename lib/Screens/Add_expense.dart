import 'package:flutter/material.dart';
import 'package:expense_app/MODELS/Expense.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({
    required this.addExpense,
    Key? key,
  }) : super(key: key);

  final void Function(Expense expense) addExpense;

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  late DateTime _selectedDate = DateTime.now();
  late Catagory _selectedCategory = Catagory.vacations;
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void addExpenseOnPress() {
    final amount = double.tryParse(amountController.text);

    print(titleController.text);
    print(amount);

    if (amountController.text.isNotEmpty && amount != null) {
      widget.addExpense(
        Expense(
          dateTime: _selectedDate,
          catagory: _selectedCategory,
          amount: amount,
          title: titleController.text,
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Invalid Input'),
            content: Text('Please enter valid title and amount.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              maxLength: 50,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: amountController,
                    maxLength: 50,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: DropdownButton<Catagory>(
                    value: _selectedCategory,
                    items: Catagory.values.map((category) {
                      return DropdownMenuItem<Catagory>(
                        value: category,
                        child: Text(category.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 100,
                  child: Text(
                    '${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}',
                  ),
                ),
                IconButton(
                  onPressed: () => _selectDate(context),
                  icon: const Icon(Icons.date_range),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: addExpenseOnPress,
                    child: const Text('Add Expense'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }
}
