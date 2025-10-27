import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionListItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(transaction.name[0]),
      ),
      title: Text(transaction.name),
      subtitle: Text(transaction.date),
      trailing: Text(
        '${transaction.isSending ? '-' : '+'}\$${transaction.amount}',
        style: TextStyle(
          color: transaction.isSending ? Colors.red : Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
