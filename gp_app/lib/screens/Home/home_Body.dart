import 'package:flutter/material.dart';
import 'transaction_list_screen.dart';

class HomeBody extends StatefulWidget {
  final Map<String, String> cardDetails;
  HomeBody(this.cardDetails, {super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int _selectedIndex = -1;

  void _onCardSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3, // Only show one card
                  itemBuilder: (context, index) {
                    return CreditCard(
                      cardDetails: widget.cardDetails,
                      isSelected: _selectedIndex == index,
                      onSelect: () => _onCardSelected(index),
                    );
                  },
                ),
              ),
              const defult_bottom(),
              const Balance(),
              Show_TRANS(),
            ],
          ),
        ),
      ),
    );
  }
}

class defult_bottom extends StatelessWidget {
  const defult_bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('NFC Access '),
        ),
      ),
    );
  }
}

class CreditCard extends StatelessWidget {
  final Map<String, String> cardDetails;
  final bool isSelected;
  final VoidCallback onSelect;

  const CreditCard({
    Key? key,
    required this.cardDetails,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 12),
        width: 300,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 121, 224, 231),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            if (isSelected) // Add shadow only to the selected card
              BoxShadow(
                color: Colors.black12.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(4, 8),
              ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Card Number: ${cardDetails['Card Number']}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Cardholder Name: ${cardDetails['Cardholder Name']}',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Card Type: ${cardDetails['Card Type']}',
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Show_TRANS extends StatefulWidget {
  @override
  State<Show_TRANS> createState() => _mm_CardState();
}

class _mm_CardState extends State<Show_TRANS> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 204, 225, 233),
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Transactions",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 156, 198, 233),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(Icons.arrow_upward),
                  ),
                ),
                const SizedBox(width: 5),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Income"),
                    Text(
                      "2000000 EGP",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Container(
                  height: 45,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 41, 100, 226),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(Icons.arrow_outward),
                  ),
                ),
                const SizedBox(width: 5),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Outcome"),
                    Text(
                      "2000000 EGP",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionListScreen(),
                  ),
                );
              },
              child: const Text('View Transactions'),
            ),
          ],
        ),
      ),
    );
  }
}

class Balance extends StatefulWidget {
  const Balance({super.key});

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(255, 204, 225, 233),
      ),
      child: const Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              "TOTAL BALANCE",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
            Center(
              child: Text(
                "11025525444 EGP",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:gp_app/screens/Home/transaction_list_screen.dart';
// import 'package:flutter/material.dart';

// class HomeBody extends StatefulWidget {
//   final Map<String, String> cardDetails;
//   HomeBody(this.cardDetails, {super.key});

//   @override
//   State<HomeBody> createState() => _HomeBodyState();
// }

// class _HomeBodyState extends State<HomeBody> {
//    int _selectedIndex = -1;

//   void _onCardSelected(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: SafeArea(
//         child: Expanded(
//           child: Container(
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//             ),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   SizedBox(
//                     height: 200,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 2, // Only show one card
//                       itemBuilder: (context, index) {
//                         return CreditCard(
//                             cardDetails: widget.cardDetails,
//                             isSelected: _selectedIndex == index,
//                             onSelect: () => _onCardSelected(index));
//                       },
//                     ),
//                   ),
//                   const defult_bottom(),
//                   const Balance(),
//                   Show_TRANS(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class defult_bottom extends StatelessWidget {
//   const defult_bottom({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10, bottom: 5),
//       child: SizedBox(
//           height: 45,
//           width: 150,
//           child: ElevatedButton(
//               onPressed: () {}, child: const Text('NFC Access '))),
//     );
//   }
// }

// class CreditCard extends StatelessWidget {
//   final Map<String, String> cardDetails;
//   final bool isSelected;
//   final VoidCallback onSelect;

//   const CreditCard({
//     Key? key,
//     required this.cardDetails,
//     required this.isSelected,
//     required this.onSelect,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onSelect,
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 12),
//         width: 300,
//         decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 121, 224, 231),
//           borderRadius: BorderRadius.circular(16.0),
//           boxShadow: [
//             if (isSelected) // Add shadow only to the selected card
//               BoxShadow(
//                 color: Colors.black12.withOpacity(0.5),
//                 spreadRadius: 1,
//                 blurRadius: 5,
//                 offset: const Offset(4, 8),
//               ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 45),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Card Number: ${cardDetails['Card Number']}',
//                 style: const TextStyle(fontSize: 16.0),
//               ),
//               const SizedBox(height: 8.0),
//               Text(
//                 'Cardholder Name: ${cardDetails['Cardholder Name']}',
//                 style: const TextStyle(fontSize: 16.0),
//               ),
//               const SizedBox(height: 8.0),
//               Text(
//                 'Card Type: ${cardDetails['Card Type']}',
//                 style: const TextStyle(fontSize: 16.0),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Show_TRANS extends StatefulWidget {
//   @override
//   State<Show_TRANS> createState() => _mm_CardState();
// }

// class _mm_CardState extends State<Show_TRANS> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 400,
//       // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: const Color.fromARGB(255, 204, 225, 233),
//       ),
//       child: Center(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 5,
//             ),
//             const Text(
//               "Transactions",
//               style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Row(
//               children: [
//                 Container(
//                   // margin:
//                   //     const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
//                   height: 45,
//                   width: 60,
//                   decoration: const BoxDecoration(
//                       color: Color.fromARGB(255, 156, 198, 233),
//                       shape: BoxShape.circle),
//                   child: const Center(
//                     child: Icon(Icons.arrow_upward),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 const Column(children: [
//                   Text("income"),
//                   Text("2000000 EGP",
//                       style:
//                           TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
//                 ]),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Container(
//                   // margin:
//                   //     const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
//                   height: 45,
//                   width: 60,
//                   decoration: const BoxDecoration(
//                       color: Color.fromARGB(255, 41, 100, 226),
//                       shape: BoxShape.circle),
//                   child: const Center(
//                     child: Icon(Icons.arrow_outward),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 const Column(
//                   children: [
//                     Text("outcome"),
//                     Text("2000000 EGP",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500, fontSize: 17)),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => TransactionListScreen()),
//                 );
//               },
//               child: const Text('View Transactions'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Balance extends StatefulWidget {
//   const Balance({super.key});

//   @override
//   State<Balance> createState() => _BalanceState();
// }

// class _BalanceState extends State<Balance> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 75,
//       margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: const Color.fromARGB(255, 204, 225, 233),
//       ),
//       child: const Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               "TOTAL BALANCE",
//               style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
//             ),
//             Center(
//               child: Text(
//                 "11025525444 EGP",
//                 style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// // class HomeBody extends StatefulWidget {
// //   final Map<String, String> initialCardDetails;
// //   final Function(String) updateCardDetails;

// //   const HomeBody(
// //       {Key? key,
// //       required this.initialCardDetails,
// //       required this.updateCardDetails,
// //       required ApiService apiService})
// //       : super(key: key);

// //   @override
// //   _HomeBodyState createState() => _HomeBodyState();
// // }

// // class _HomeBodyState extends State<HomeBody> {
// //   late Map<String, String> cardDetails;

// //   @override
// //   void initState() {
// //     super.initState();
// //     cardDetails = widget.initialCardDetails;
// //   }

// //   @override
// //   void didUpdateWidget(HomeBody oldWidget) {
// //     super.didUpdateWidget(oldWidget);
// //     if (oldWidget.initialCardDetails != widget.initialCardDetails) {
// //       setState(() {
// //         cardDetails = widget.initialCardDetails;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Container(
// //         decoration: const BoxDecoration(
// //           color: Color.fromARGB(255, 232, 234, 243),
// //           borderRadius: BorderRadius.only(
// //               topLeft: Radius.circular(20), topRight: Radius.circular(20)),
// //         ),
// //         child: Column(
// //           children: [
// //             SizedBox(
// //               height: 200,
// //               child: Stack(
// //                 children: [
// //                   Positioned.fill(
// //                     child: ListView.builder(
// //                       scrollDirection: Axis.horizontal,
// //                       itemCount: 1, // Number of credit cards
// //                       itemBuilder: (context, index) {
// //                         return CreditCard(
// //                           isSelected: true,
// //                           cardDetails: cardDetails,
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             const defult_bottom(),
// //             const Balance(),
// //             mm_Card(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }





// // class CreditCard extends StatelessWidget {
// //   final bool isSelected;
// //   final Map<String, String> cardDetails;

// //   const CreditCard(
// //       {Key? key, required this.isSelected, required this.cardDetails})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 12),
// //       width: 300,
// //       decoration: BoxDecoration(
// //         color: const Color.fromARGB(255, 121, 224, 231),
// //         borderRadius: BorderRadius.circular(16.0),
// //         boxShadow: [
// //           if (isSelected)
// //             BoxShadow(
// //               color: Colors.black12.withOpacity(0.5),
// //               spreadRadius: 1,
// //               blurRadius: 5,
// //               offset: const Offset(4, 8),
// //             ),
// //         ],
// //       ),
// //       child: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 45),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               'Card Number: ${cardDetails['Card Number'] ?? 'N/A'}',
// //               style: const TextStyle(fontSize: 16.0),
// //             ),
// //             const SizedBox(height: 8.0),
// //             Text(
// //               'Cardholder Name: ${cardDetails['Cardholder Name'] ?? 'N/A'}',
// //               style: const TextStyle(fontSize: 16.0),
// //             ),
// //             const SizedBox(height: 8.0),
// //             Text(
// //               'Card Type: ${cardDetails['Card Type'] ?? 'N/A'}',
// //               style: const TextStyle(fontSize: 16.0),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }




// ////// delete //////
// ///
// //


// // void _updateDateText() {
// //   final now = DateTime.now();
// //   switch (dropdownvalue) {
// //     case 'Last Day':
// //       _dateText =
// //           DateFormat('MM-dd').format(now.subtract(const Duration(days: 1)));
// //       break;
// //     case 'Last Week':
// //       final lastWeekStart = now.subtract(const Duration(days: 7));
// //       _dateText =
// //           '${DateFormat('MM-dd').format(lastWeekStart)} - ${DateFormat('MM-dd').format(now)}';
// //       break;
// //     case 'Last Month':
// //       final lastMonthStart = DateTime(now.year, now.month - 1, now.day);
// //       _dateText =
// //           '${DateFormat('MM-dd').format(lastMonthStart)} - ${DateFormat('MM-dd').format(now)}';
// //       break;
// //   }
// // }
// // // Time dropdown menu for transactions
// //   Container newMethod() {
// //     return Container(
// //       height: 35,
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(20),
// //       ),
// //       child: DropdownButtonHideUnderline(
// //         child: DropdownButton(
// //           padding: const EdgeInsets.only(left: 10),
// //           style: const TextStyle(fontSize: 15, color: Colors.black),
// //           value: dropdownvalue,
// //           isExpanded: false,
// //           iconEnabledColor: Colors.blue,
// //           iconSize: 30,
// //           items: items.map((String items) {
// //             return DropdownMenuItem(
// //               value: items,
// //               child: Text(
// //                 items,
// //                 style: const TextStyle(
// //                     fontWeight: FontWeight.bold, color: Colors.blue),
// //               ),
// //             );
// //           }).toList(),
// //           onChanged: (String? newValue) {
// //             setState(() {
// //               dropdownvalue = newValue!;
// //               _updateDateText();
// //             });
// //           },
// //         ),
// //       ),
// //     );
// //   }