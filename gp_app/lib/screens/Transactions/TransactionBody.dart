import 'package:flutter/material.dart';
import 'package:gp_app/screens/Transactions/creditcard.dart';
import 'package:gp_app/screens/Transactions/lightup.dart';

class TransactionBody extends StatelessWidget {
  TransactionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Transactionx(name: 'Send your money'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Transactionx extends StatefulWidget {
  Transactionx({super.key, required this.name});
  final String name;
  @override
  State<Transactionx> createState() => _TransactionxState();
}

class _TransactionxState extends State<Transactionx> {
  final _formKey = GlobalKey<FormState>();
  final amount = TextEditingController();
  int _selectedButtonIndex = -1; // Index of the currently selected button

  String _nfcMessage = "NFC Data: None";
  CreditCardData? _selectedCard;

  final List<CreditCardData> xss = [
    CreditCardData(
      cardNumber: '**** **** **** 1234',
      totalBalance: 5000,
      cardName: 'hhh',
      cardHolderName: 'Hamza',
      cardType: 'Visa',
    ),
    CreditCardData(
      cardNumber: '**** **** **** 1234',
      totalBalance: 5000,
      cardName: 'hhh',
      cardHolderName: 'Hamza',
      cardType: 'Mastercard',
    ),
    CreditCardData(
      cardNumber: '**** **** **** 1234',
      totalBalance: 5000,
      cardName: 'hhh',
      cardHolderName: 'hamza',
      cardType: 'Mastercard',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Expanded(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                  top: 20.0, left: 15.0, right: 15.0, bottom: 0.0),
              child: Row(
                children: [
                  Text('Your Cards ',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            CreditCardd(
                cards: xss,
                onCardSelected: (card) {
                  setState(() {
                    _selectedCard = card;
                  });
                }),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Payment Method",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center the row contents
                    children: [
                      LightUpButton(
                        text: "Send",
                        onPressed: () async {
                          // _updateSelectedButton(0);
                          // _sendTransaction();
                        },
                        isSelected: _selectedButtonIndex == 0,
                      ),
                      const SizedBox(width: 20),
                      LightUpButton(
                        text: "Receive",
                        onPressed: () async {
                          // _updateSelectedButton(1);
                          // await _receiveTransaction();
                        },
                        isSelected: _selectedButtonIndex == 1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: amount,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: InputDecoration(
                            label: const Text('Amount'),
                            hintText: 'Enter Amount',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black12, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an amount.';
                            }
                            final double? parsedValue = double.tryParse(value);
                            if (parsedValue == null) {
                              return 'Please enter a valid number.';
                            }
                            // Check against selected card balance
                            if (_selectedCard != null &&
                                parsedValue > _selectedCard!.totalBalance) {
                              return 'Insufficient balance.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Form is valid, process payment
                              if (_selectedButtonIndex == 0) {
                                // Send transaction
                                // _sendTransaction();
                              } else if (_selectedButtonIndex == 1) {
                                // Receive transaction
                                // _receiveTransaction();
                              }
                            }
                          },
                          child: const Text(
                            "Pay",
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(_nfcMessage,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _updateSelectedButton(int newIndex) {
  //   setState(() {
  //     if (_selectedButtonIndex == newIndex) {
  //       _selectedButtonIndex = -1; // Deselect if same button is pressed again
  //     } else {
  //       _selectedButtonIndex = newIndex; // Select the new button
  //     }
  //   });
  // }

  // void _sendTransaction() {
  //   NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
  //     try {
  //       if (tag.data.containsKey('mifareclassic')) {
  //         var mifareClassic = MifareClassic.from(tag);
  //         if (mifareClassic != null) {
  //           // Authenticate the sector first before writing
  //           bool authenticated = await mifareClassic.authenticateSectorWithKeyA(1, MifareClassic.keyDefault, sectorIndex: 1);
  //           if (authenticated) {
  //             Uint8List data = Uint8List.fromList([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
  //                                                  0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10]); // 16 bytes data
  //             await mifareClassic.writeBlock(, data, blockIndex: 1);
  //             setState(() {
  //               _nfcMessage = 'Data written successfully';
  //             });
  //           } else {
  //             setState(() {
  //               _nfcMessage = 'Authentication failed';
  //             });
  //           }
  //         } else {
  //           setState(() {
  //             _nfcMessage = 'Tag is not MIFARE Classic';
  //           });
  //         }
  //       } else {
  //         setState(() {
  //           _nfcMessage = 'Tag is not MIFARE Classic';
  //         });
  //       }
  //     } catch (e) {
  //       setState(() {
  //         _nfcMessage = 'Error writing NFC tag: $e';
  //       });
  //     } finally {
  //       NfcManager.instance.stopSession();
  //     }
  //   });
  // }

  // Future<void> _receiveTransaction() async {
  //   // if (_selectedCard == null) {
  //   //   setState(() {
  //   //     _nfcMessage = 'Please select a card first.';
  //   //   });
  //   //   return;
  //   // }

  //   try {
  //     // var availability = await FlutterNfcKit.nfcAvailability;
  //     // if (availability != NFCAvailability.available) {
  //     //   setState(() {
  //     //     _nfcMessage = 'NFC is not available';
  //     //   });
  //     //   return;
  //     // }
  //     bool isAvailable = await NfcManager.instance.isAvailable();

  //     if (isAvailable) {
  //       //If NFC is available, start an NFC session and listen for NFC tags to be discovered.
  //       NfcManager.instance.startSession(
  //         onDiscovered: (NfcTag tag) async {
  //           // Process NFC tag, When an NFC tag is discovered, print its data to the console.
  //           _nfcMessage = 'NFC Tag Detected: ${tag.data}';
  //         },
  //       );
  //     }
  //     // var message = await FlutterNfcKit.readNDEFRecords();
  //     // final record =
  //     //     message.records.firstWhere((record) => record.type == 'txet/plain');
  //     // final data = utf8.decode(record.payload);
  //     // if (data.startsWith('SEND:')) {
  //     //   final amountToReceive = double.parse(data.split(':')[1]);
  //     //   setState(() {
  //     //     _nfcMessage = 'Transaction received: \$${amountToReceive.toString()}';
  //     //     _selectedCard!.totalBalance += amountToReceive;
  //     //   });
  //     // }
  //     else {
  //       setState(() {
  //         _nfcMessage = 'No valid transaction found.';
  //       });
  //     }
  //   } catch (e) {
  //     setState(() {
  //       _nfcMessage = 'Error receiving transaction: $e';
  //     });
  //   }
  // }
}
// class TransactionBody extends StatelessWidget {
//   TransactionBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         children: [
//           Expanded(
//             child: Stack(
//               children: [
//                 Container(
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Transactionx(name: 'Send your money'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Transactionx extends StatefulWidget {
//   Transactionx({super.key, required this.name});
//   final String name;
//   @override
//   State<Transactionx> createState() => _TransactionxState();
// }

// class _TransactionxState extends State<Transactionx> {
//   final _formKey = GlobalKey<FormState>();
//   final amount = TextEditingController();
//   int _selectedButtonIndex = -1; // Index of the currently selected button

//   String _nfcMessage = "NFC Data: None";
//   CreditCardData? _selectedCard;

//   final List<CreditCardData> xss = [
//     CreditCardData(
//       cardName: 'hhh',
//       totalBalance: 5000,
//       cardNumber: '**** **** **** 1234',
//       cardHolderName: 'Hamza',
//       cardType: 'Visa',
//     ),
//     CreditCardData(
//       cardName: 'visa',
//       totalBalance: 5000,
//       cardNumber: '**** **** **** 5678',
//       cardHolderName: 'Hamza',
//       cardType: 'Mastercard',
//     ),
//     CreditCardData(
//       cardName: 'visa',
//       totalBalance: 5000,
//       cardNumber: '**** **** **** 5678',
//       cardHolderName: 'hamza',
//       cardType: 'Mastercard',
//     ),
//     CreditCardData(
//       cardName: 'visa',
//       totalBalance: 5000,
//       cardNumber: '**** **** **** 5678',
//       cardHolderName: 'Hamza',
//       cardType: 'Mastercard',
//     ),
//     CreditCardData(
//       cardName: 'visa',
//       totalBalance: 5000,
//       cardNumber: '**** **** **** 5678',
//       cardHolderName: 'Hamza',
//       cardType: 'Mastercard',
//     ),
//   ];

//   // Future<void> _startNfcReadSession() async {
//   //   try {
//   //     NFCTag? nfcData = await FlutterNfcKit.poll();
//   //     if (nfcData != null) {
//   //       // Process NFC data (replace with actual logic)
//   //       setState(() {
//   //         _nfcMessage = "NFC Data: ${nfcData.id}";
//   //       });
//   //     } else {
//   //       setState(() {
//   //         _nfcMessage = "No NFC data found";
//   //       });
//   //     }
//   //     await FlutterNfcKit.finish(iosAlertMessage: "Read complete");
//   //   } catch (e) {
//   //     setState(() {
//   //       _nfcMessage = "Error: ${e.toString()}";
//   //     });
//   //   }
//   // }

//   // Future<void> _startNfcWriteSession(double amount) async {
//   //   if (_selectedCard != null) {
//   //     if (_selectedCard!.totalBalance >= amount) {
//   //       try {
//   //         NFCTag? nfcTag = await FlutterNfcKit.poll();
//   //         if (nfcTag != null) {
//   //           // Create the message to write
//   //           String message = "Send $amount";
//   //           // Write the message to the NFC tag
//   //           await FlutterNfcKit.transceive(message);
//   //           setState(() {
//   //             _selectedCard!.totalBalance -= amount;
//   //             _nfcMessage = "Sent $message to tag ${nfcTag.id}";
//   //           });
//   //         } else {
//   //           setState(() {
//   //             _nfcMessage = "No NFC tag found";
//   //           });
//   //         }
//   //         await FlutterNfcKit.finish(iosAlertMessage: "Write complete");
//   //       } catch (e) {
//   //         setState(() {
//   //           _nfcMessage = "Error: ${e.toString()}";
//   //         });
//   //       }
//   //     } else {
//   //       setState(() {
//   //         _nfcMessage = "Insufficient balance";
//   //       });
//   //     }
//   //   } else {
//   //     setState(() {
//   //       _nfcMessage = "No card selected";
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(
//                   top: 32.0, left: 15.0, right: 15.0, bottom: 16.0),
//               child: Row(
//                 children: [
//                   Text('Your Cards ',
//                       style: TextStyle(
//                           fontSize: 16.0, fontWeight: FontWeight.bold)),
//                   Icon(Icons.keyboard_arrow_right),
//                 ],
//               ),
//             ),
//             CreditCard(
//                 cards: xss,
//                 onCardSelected: (card) {
//                   setState(() {
//                     _selectedCard = card;
//                   });
//                 }),
//             Container(
//               margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//               height: 400,
//               width: 400,
//               decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 215, 226, 238),
//                   borderRadius: BorderRadius.circular(25)),
//               child: Stack(
//                 children: [
//                   Positioned(
//                     top: 15,
//                     left: 150,
//                     child: Container(
//                       child: const Text(
//                         "Payment Method",
//                         style: TextStyle(
//                           fontSize: 15.0,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 60,
//                     left: 40,
//                     child: Row(
//                       mainAxisAlignment:
//                           MainAxisAlignment.center, // Center the row contents
//                       children: [
//                         LightUpButton(
//                           text: "Send",
//                           onPressed: () async {
//                             _updateSelectedButton(0);

//                             // if (_formKey.currentState!.validate()) {
//                             //   await _startNfcWriteSession(
//                             //       double.parse(amount.text));
//                             // }
//                           },
//                           isSelected: _selectedButtonIndex == 0,
//                         ),
//                         const SizedBox(width: 20),
//                         LightUpButton(
//                           text: "Receive",
//                           onPressed: () async {
//                             _updateSelectedButton(1);

//                             // if (_formKey.currentState!.validate()) {
//                             //   await _startNfcReadSession();
//                             // }
//                           },
//                           isSelected: _selectedButtonIndex == 1,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     top: 150.0,
//                     left: 20.0,
//                     right: 20.0,
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             controller: amount,
//                             keyboardType: const TextInputType.numberWithOptions(
//                                 decimal: true),
//                             decoration: const InputDecoration(
//                               labelText: 'Amount',
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter an amount.';
//                               }
//                               final double? parsedValue =
//                                   double.tryParse(value);
//                               if (parsedValue == null) {
//                                 return 'Please enter a valid number.';
//                               }
//                               //talk to database
//                               if (parsedValue >= 700) {
//                                 return 'Please enter an amount less than coins you have.';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 10.0),
//                           ElevatedButton(
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 // Form is valid, process payment (replace with actual payment logic)
//                               }
//                             },
//                             child: const Text(
//                               "Pay",
//                               style: TextStyle(fontSize: 25.0),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 20,
//                     left: 20,
//                     child: Text(_nfcMessage,
//                         style: TextStyle(fontSize: 16, color: Colors.black)),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _updateSelectedButton(int newIndex) {
//     setState(() {
//       if (_selectedButtonIndex == newIndex) {
//         _selectedButtonIndex = -1; // Deselect if same button is pressed again
//       } else {
//         _selectedButtonIndex = newIndex; // Select the new button
//       }
//     });
//   }
// }

// class TransactionBody extends StatelessWidget {
//   TransactionBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         children: [
//           Expanded(
//             child: Stack(
//               children: [
//                 Container(
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Transactionx(name: 'Send your money'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Transactionx extends StatefulWidget {
//   const Transactionx({super.key, required this.name});
//   final String name;
//   @override
//   State<Transactionx> createState() => _TransactionxState();
// }

// class _TransactionxState extends State<Transactionx> {
//   final _formKey = GlobalKey<FormState>();
//   final amount = TextEditingController();
//   final date = TextEditingController();
//   final List<CreditCardData> xss = [
//     CreditCardData(
//       cardNumber: '**** **** **** 1234',
//       cardHolderName: 'Hamza',
//       cardType: 'Visa',
//     ),
//     CreditCardData(
//       cardNumber: '**** **** **** 5678',
//       cardHolderName: 'Hamza',
//       cardType: 'Mastercard',
//     ),
//     CreditCardData(
//       cardNumber: '**** **** **** 5678',
//       cardHolderName: 'hamza',
//       cardType: 'Mastercard',
//     ),
//     CreditCardData(
//       cardNumber: '**** **** **** 5678',
//       cardHolderName: 'Hamza',
//       cardType: 'Mastercard',
//     ),
//     CreditCardData(
//       cardNumber: '**** **** **** 5678',
//       cardHolderName: 'Hamza',
//       cardType: 'Mastercard',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(
//                   top: 32.0, left: 15.0, right: 15.0, bottom: 16.0),
//               child: Row(
//                 children: [
//                   Text('Your Cards ',
//                       style: TextStyle(
//                           fontSize: 16.0, fontWeight: FontWeight.bold)),
//                   SizedBox(width: 180.0),
//                   Text('See All ',
//                       style: TextStyle(
//                           fontSize: 16.0, fontWeight: FontWeight.bold)),
//                   Icon(Icons.keyboard_arrow_right),
//                 ],
//               ),
//             ),
//             CreditCard(cards: xss),
//             Container(
//               margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//               height: 400,
//               width: 400,
//               decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 215, 226, 238),
//                   borderRadius: BorderRadius.circular(25)),
//               child: Stack(
//                 children: [
//                   Positioned(
//                     top: 15,
//                     left: 150,
//                     child: Container(
//                       child: const Text(
//                         "Pyment Method",
//                         style: TextStyle(
//                           fontSize: 15.0,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 60,
//                     left: 40,
//                     child: Row(
//                       mainAxisAlignment:
//                           MainAxisAlignment.center, // Center the row contents
//                       children: [
//                         LightUpButton(
//                           text: "Send",
//                           onPressed: () {},
//                         ),
//                         const SizedBox(width: 20),
//                         LightUpButton(
//                           text: "Receive",
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     top: 150.0,
//                     left: 20.0,
//                     right: 20.0,
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             controller: amount,
//                             keyboardType: const TextInputType.numberWithOptions(
//                                 decimal: true),
//                             decoration: const InputDecoration(
//                               labelText: 'Amount',
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter an amount.';
//                               }
//                               final double? parsedValue =
//                                   double.tryParse(value);
//                               if (parsedValue == null) {
//                                 return 'Please enter a valid number.';
//                               }
//                               //talk to database
//                               if (parsedValue >= 700) {
//                                 return 'Please enter an amount less than coins you have.';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 10.0),
//                           // TextField(
//                           //   controller: date,
//                           //   readOnly: true, // Disable manual date entry
//                           //   onTap: () async {
//                           //     DateTime? pickedDate = await showDatePicker(
//                           //       context: context,
//                           //       initialDate: DateTime.now(),
//                           //       firstDate: DateTime(2023, 1, 1),
//                           //       lastDate: DateTime(2100),
//                           //     );
//                           //     if (pickedDate != null) {
//                           //       TimeOfDay? pickedTime = await showTimePicker(
//                           //         // ignore: use_build_context_synchronously
//                           //         context: context,
//                           //         initialTime: TimeOfDay.now(),
//                           //       );
//                           //       if (pickedTime != null) {
//                           //         setState(() {
//                           //           DateFormat formatter =
//                           //               DateFormat('yyyy-MM-dd HH:mm');
//                           //           String formattedDateTime =
//                           //               formatter.format(DateTime(
//                           //             pickedDate.year,
//                           //             pickedDate.month,
//                           //             pickedDate.day,
//                           //             pickedTime.hour,
//                           //             pickedTime.minute,
//                           //           ));
//                           //           date.text = formattedDateTime;
//                           //         });
//                           //       }
//                           //     }
//                           //   },
//                           //   decoration: const InputDecoration(
//                           //     labelText: 'Date',
//                           //     border: OutlineInputBorder(),
//                           //   ),
//                           // ),
//                           ElevatedButton(
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 // Form is valid, process payment (replace with actual payment logic)
//                               }
//                             },
//                             child: const Text(
//                               "Pay",
//                               style: TextStyle(fontSize: 25.0),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
