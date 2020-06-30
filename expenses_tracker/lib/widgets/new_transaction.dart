import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // properties
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final addTransaction;

  // constructors
  NewTransaction({this.addTransaction});

  // methods

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
              // onChanged: (value) => setState(() => titleInput = value),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (value) => setState(() => amountInput = value),
            ),
            FlatButton(
              child: Text(
                'Add transaction',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () => addTransaction(
                  titleController.text, double.parse(amountController.text)),
            )
          ],
        ),
      ),
    );
  }
}
