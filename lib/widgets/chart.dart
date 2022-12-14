import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        var isTheSameDay = recentTransactions[i].date.day == weekDay.day;
        var isTheSameMonth = recentTransactions[i].date.month == weekDay.month;
        var isTheSameYear = recentTransactions[i].date.year == weekDay.year;

        if (isTheSameDay && isTheSameMonth && isTheSameYear) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay)[0], 'amount': totalSum};
    }).toList();
  }

  double get totalSpending {
    return groupTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransactionValues.map(
            (e) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    e['day'],
                    e['amount'],
                    totalSpending == 0.0
                        ? 0.0
                        : (e['amount'] as double) / totalSpending),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
