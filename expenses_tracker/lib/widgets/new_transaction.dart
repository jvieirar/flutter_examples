import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  // properties
  final addTransaction;

  // constructors
  NewTransaction({this.addTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // properties
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  // methods
  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }
    widget.addTransaction(
        _titleController.text, double.parse(_amountController.text), _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      } else {
        setState(() => _selectedDate = date);
      }
    });
  }
  // void _presentDatePicker() async {
  //   final selectedDate = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(2019),
  //       lastDate: DateTime.now());
  //   print(selectedDate.toIso8601String());
  // }

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
              // autofocus: true,
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (value) => setState(() => titleInput = value),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),
              // onChanged: (value) => setState(() => amountInput = value),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  if (_selectedDate != null) Text(''),
                  FlatButton(
                    child: Text(
                      'Choose date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text(
                'Add transaction',
              ),
              onPressed: _submitData,
              color: Theme.of(context).accentColor,
            )
          ],
        ),
      ),
    );
  }
}
