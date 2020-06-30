import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  // properties
  final List<Transaction> transactions;

  // constructors
  TransactionList(this.transactions);

  // methods

  // render
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      child: ListView.builder(
        itemBuilder: (context, index) => Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.all(10),
                width: 90,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                child: Text(
                  '\$${transactions[index].amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                    // style: TextStyle(
                    //   fontSize: 16,
                    //   fontWeight: FontWeight.bold,
                    // ),
                  ),
                  Text(
                    // DateFormat('dd/MM/yyyy').format(transactions[index].date),
                    DateFormat.yMMMd().format(transactions[index].date),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        itemCount: transactions.length,
      ),
    );
  }
}