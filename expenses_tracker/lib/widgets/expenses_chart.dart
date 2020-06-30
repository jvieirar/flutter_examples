import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './expenses_chart_bar.dart';
import '../model/transaction.dart';

class ExpensesChart extends StatelessWidget {
  // properties
  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      final double totalAmountToday = recentTransactions.fold(
        0,
        (acc, transaction) {
          if (transaction.date.day == weekDay.day &&
              transaction.date.month == weekDay.month &&
              transaction.date.year == weekDay.year) {
            return acc + transaction.amount;
          } else {
            return acc;
          }
        },
      );
      // var totalAmountToday = 0.0;
      // for (var transaction in recentTransactions) {
      //   if (transaction.date.day == weekDay.day &&
      //       transaction.date.month == weekDay.month &&
      //       transaction.date.year == weekDay.year) {
      //     totalAmountToday += transaction.amount;
      //   }
      // }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalAmountToday
      };
    }).reversed.toList();
  }

  double get totalSpenings {
    return groupedTransactions.fold(
        0.0, (acc, transcation) => acc + transcation['amount']);
  }

  // constructors
  ExpensesChart(this.recentTransactions);

  // methods

  // render
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Card(
        elevation: 6,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactions
                .map(
                  (data) => Flexible(
                    fit: FlexFit.tight,
                    child: ExpensesChartBar(
                      label: data['day'],
                      spendingAmount: data['amount'],
                      spendingPercentageTotal: totalSpenings == 0.0
                          ? 0.0
                          : (data['amount'] as double) / totalSpenings,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
