import 'package:flutter/material.dart';

class TransactionListScreen extends StatelessWidget {
  final List<String> transactions = [
    'Transaction 1',
    'Transaction 2',
    'Transaction 3',
    'Transaction 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      // body: ListView.builder(
      //   physics: const NeverScrollableScrollPhysics(),
      //   itemCount: categories.length,
      //   itemBuilder: (BuildContext context, int index) => CategoryCard(
      //     category: categories[index],
      //     itemIndex: index,
      //   ),
      // ),
      // body: ListView.builder(
      //   itemCount: transactions.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(transactions[index]),
      //     );
      //   },
      // ),
    );
  }
}
