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
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No expenses yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) => Card(
                elevation: 5,
                margin: EdgeInsets.all(4),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}'),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    // DateFormat('dd/MM/yyyy').format(transactions[index].date),
                    DateFormat.yMMMd().format(transactions[index].date),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
