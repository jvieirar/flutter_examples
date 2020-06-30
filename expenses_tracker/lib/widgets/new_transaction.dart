import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // properties
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final addTransaction;

  // constructors
  NewTransaction({this.addTransaction});

  // methods
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }

    addTransaction(titleController.text, double.parse(amountController.text));
  }

  // render
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (value) => setState(() => titleInput = value),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
              // onChanged: (value) => setState(() => amountInput = value),
            ),
            FlatButton(
              child: Text(
                'Add transaction',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
