// ignore: file_names
import 'package:flutter/material.dart';
import 'package:gp_app/screens/Transactions/TransactionBody.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: TransactionAppBar(),
      body: TransactionBody(),
    );
  }
}

// ignore: non_constant_identifier_names
AppBar TransactionAppBar() {
  return AppBar(
    scrolledUnderElevation: 100,
    backgroundColor: Colors.blue,
    title: const Center(
      child: Text(
        'Transaction',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
