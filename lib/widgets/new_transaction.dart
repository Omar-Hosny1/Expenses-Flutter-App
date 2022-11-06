import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function onAddTransaction;
  NewTransaction(this.onAddTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (val) => this.titleInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (val) => this.amountInput = val,
            ),
            TextButton(
                onPressed: () {
                  onAddTransaction(titleController.text,
                      double.parse(amountController.text));
                  this.amountController.clear();
                  this.titleController.clear();
                },
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
