// ignore: file_names
import 'package:flutter/material.dart';
import 'package:gp_app/screens/Category/My_cards.dart';
import 'package:gp_app/screens/Category/add_card.dart';
import 'package:gp_app/screens/Category/category_list.dart';

class CategoryBody extends StatefulWidget {
  CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  final List<Category> categories = [
    Category(categoryName: 'Financial', icon: Icons.account_balance),
    Category(categoryName: 'Access', icon: Icons.lock),
    Category(categoryName: 'Transport', icon: Icons.directions_car),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
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
            ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) => CategoryCard(
                category: categories[index],
                itemIndex: index,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyCards(
                        category: categories[index].categoryName,
                      ),
                    ),
                  );
                },
              ),
            ),
            const Positioned(
              right: 30,
              bottom: 5,
              child: AddButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final int itemIndex;
  final Category category;
  final VoidCallback onTap;

  CategoryCard({
    Key? key,
    required this.category,
    required this.itemIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue,
                ),
              ),
            ),
            Positioned(
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(45),
                child: Icon(
                  category.icon,
                  color: const Color.fromARGB(255, 43, 68, 209),
                  size: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.all(55),
              child: Text(
                category.categoryName,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CardDetailsForm()), // Update with correct import path
          );
        },
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: const EdgeInsets.all(15),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.cyan,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}

// ignore: camel_case_types
// class Category_Body extends StatelessWidget {
//   const Category_Body({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         children: [
//           Expanded(
//               child: Stack(
//             children: [
//               Container(
//                 decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30))),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ListView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: categories.length,
//                 itemBuilder: (BuildContext context, int index) => Category_Card(
//                   category: categories[index],
//                   itemIndex: index,
//                 ),
//               ),
//               const Positioned(
//                 right: 30,
//                 bottom: 30,
//                 child: Add_Botton(),
//               )
//             ],
//           )),
//         ],
//       ),
//     );
//   }
// }

// class Category_Card extends StatelessWidget {
//   Category_Card({Key? key, required this.category, required this.itemIndex})
//       : super(key: key);
//   final int itemIndex;
//   final Category category;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => My_cards(category: category)),
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(top: 30),
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 120,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   color: Colors.blue,
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 0,
//               child: Container(
//                 padding: const EdgeInsets.all(45),
//                 child: Icon(
//                   category.iconn,
//                   color: Color.fromARGB(255, 43, 68, 209),
//                   size: 50,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsetsDirectional.all(55),
//               child: Text(
//                 category.categoryy,
//                 style: const TextStyle(color: Colors.white, fontSize: 20),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Add_Botton extends StatelessWidget {
//   const Add_Botton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => CardDetailsForm()),
//             );
//           }
//         },
//         style: ElevatedButton.styleFrom(
//           shape: CircleBorder(),
//           padding: EdgeInsets.all(15),
//           backgroundColor: Colors.blue,
//           foregroundColor: Colors.cyan,
//         ),
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//           size: 40,
//         ),
//       ),
//     );
//   }
// }
