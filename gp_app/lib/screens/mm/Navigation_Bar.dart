import 'package:flutter/material.dart';
import 'package:gp_app/screens/Category/Category.dart';
import 'package:gp_app/screens/Home/home.dart';
import 'package:gp_app/screens/Profile/screens/profile_screen.dart';
import 'package:gp_app/screens/Transactions/transaction.dart';

class Navbar extends StatefulWidget {
  Navbar({super.key});

  @override
  State<Navbar> createState() => _Nav_BarState();
}

class _Nav_BarState extends State<Navbar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Home(),
      const Transaction(),
      const MyWallet(),
      const Profile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // int index = 0;
  // final pages = [
  //   const Home(),
  //   const Transaction(),
  //   const MyWallet(),
  //   Profile(),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: pages[index],
        // bottomNavigationBar: NavigationBar(
        //   indicatorColor: const Color.fromARGB(255, 140, 176, 238),
        //   elevation: 0.0,
        //   indicatorShape: const CircleBorder(eccentricity: 0.8),
        //   height: 65,
        //   selectedIndex: index,
        //   onDestinationSelected: (index) => setState(() => this.index = index),
        //   destinations: const [
        //     NavigationDestination(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     NavigationDestination(
        //       icon: Icon(Icons.wallet_travel),
        //       label: 'Transactions',
        //     ),
        //     NavigationDestination(
        //       icon: Icon(Icons.receipt_long),
        //       label: 'My Wallet',
        //     ),
        //     NavigationDestination(
        //       icon: Icon(Icons.person),
        //       label: 'Profile',
        //     )
        //   ],
        // ),
      body: _screens[_selectedIndex], // Use the _screens list here
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_travel),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
      icon: Icon(Icons.receipt_long),
      label: 'My Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
