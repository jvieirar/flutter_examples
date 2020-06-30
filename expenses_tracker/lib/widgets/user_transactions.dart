import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../model/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  // properties
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 15.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Snack',
      amount: 5.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Curtains',
      amount: 85.30,
      date: DateTime.now(),
    ),
  ];

  // constructors

  // methods
  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  // render
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(
          addTransaction: _addNewTransaction,
        ),
        TransactionList(_userTransactions),
      ],
    );
  }
}
