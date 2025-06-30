import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/colors.dart';
import 'package:fruits_app/models/product.dart';

class Basket extends StatefulWidget {
  const Basket({super.key, required this.basketList});
  final List<ProductModel> basketList;

  @override
  State<Basket> createState() => _CartState();
}

class _CartState extends State<Basket> {
  late Map<ProductModel, int> quantities;

  @override
  void initState() {
    super.initState();
    quantities = {for (var p in widget.basketList) p: 1};
  }

  void minusCount(ProductModel product) {
    setState(() {
      if (quantities[product]! > 1) {
        quantities[product] = quantities[product]! - 1;
      }
    });
  }

  void plusCount(ProductModel product) {
    setState(() {
      quantities[product] = quantities[product]! + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Basket',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: ListView.builder(
              itemCount: widget.basketList.length,
              itemBuilder: (context, index) {
                final product = widget.basketList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: const Color.fromARGB(248, 255, 255, 255),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade100,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(25),
                            child: Image.asset(product.image,
                                width: 70, fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              product.name,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              product.price,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                SizedBox(width: 153),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  width: 72,
                                  height: 30,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 5),
                                      GestureDetector(
                                        onTap: () => minusCount(product),
                                        child: SvgPicture.asset(
                                            "assets/icons/trash.svg"),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        quantities[product].toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 5),
                                      GestureDetector(
                                        onTap: () => plusCount(product),
                                        child: SvgPicture.asset(
                                            "assets/icons/plus.svg"),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 8,
                backgroundColor: App_Colors.primary,
                padding: EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Go to checkout",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
