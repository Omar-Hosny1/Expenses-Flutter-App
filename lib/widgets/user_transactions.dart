import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transactions_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Car',
      amount: 75.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'I Phone',
      amount: 95.99,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionsList(
          transactions: _userTransactions,
        )
      ],
    );
  }
}
