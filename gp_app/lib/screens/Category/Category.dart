// ignore: file_names
import 'package:flutter/material.dart';
import 'package:gp_app/screens/Category/categ_Card_Body.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: MywalletAppBar(),
      body: CategoryBody(),
    );
  }
}

// ignore: non_constant_identifier_names
AppBar MywalletAppBar() {
  return AppBar(
    backgroundColor: Colors.blue,
    title: const Center(
      child: Text(
        'My Wallet',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
