import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/colors.dart';
import 'package:fruits_app/models/category.dart';
import 'package:fruits_app/models/product.dart';
import 'package:fruits_app/screens/Basket.dart';
import 'package:fruits_app/widgets/productCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> banners = [
    "assets/banners/Slider_1.png",
    "assets/banners/Slider_2.png",
    "assets/banners/Slider_3.png",
  ];
  List<CategoryModel> categories = [
    CategoryModel(name: "bavergas", image: "assets/category/bavergas.png"),
    CategoryModel(name: "Milk & egg", image: "assets/category/egg.png"),
    CategoryModel(name: "fruits", image: "assets/category/fruits.png"),
    CategoryModel(name: "luandry", image: "assets/category/luandry.png"),
    CategoryModel(name: "vegatbels", image: "assets/category/vegatbels.png"),
  ];
  List<ProductModel> products = [
    ProductModel(
        name: "banana",
        image: "assets/fruits/banana.png",
        price: "\$2.5",
        rate: "4.5",
        countRate: "(100)"),
    ProductModel(
        name: "orange",
        image: "assets/fruits/orange.png",
        price: "\$1.2",
        rate: "4.0",
        countRate: "(80)"),
    ProductModel(
        name: "papper",
        image: "assets/fruits/papper.png",
        price: "\$3.0",
        rate: "4.8",
        countRate: "(150)"),
    ProductModel(
        name: "Eggs",
        image: "assets/category/egg.png",
        price: "\$2.5",
        rate: "4.5",
        countRate: "(100)"),
  ];

  List<ProductModel> basketList = [];
  void toggleBasket(ProductModel product) {
    setState(() {
      if (basketList.contains(product)) {
        basketList.remove(product);
      } else {
        basketList.add(product);
      }
    });
  }

  bool isInBasket(ProductModel product) {
    return basketList.contains(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        leadingWidth: 0,
        title: Row(
          children: [
            SvgPicture.asset("assets/icons/motor.svg"),
            SizedBox(
              width: 12,
            ),
            Text("61 Hopper street..",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(
              width: 3,
            ),
            Icon(
              Icons.keyboard_arrow_down_sharp,
              size: 30,
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Basket(basketList: basketList,))),
              child: SvgPicture.asset("assets/icons/basket.svg")),
          ],
        ),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
              options: CarouselOptions(
                height: 180,
                aspectRatio: 1,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
              ),
              itemCount: banners.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Image.asset(banners[itemIndex])),
          SizedBox(
            height: 5,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
              categories.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade100,
                        ),
                        height: 70,
                        width: 70,
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Image.asset(
                            categories[index].image,
                            width: 60,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(categories[index].name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                );
              },
            )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fruits",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: App_Colors.primary),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: List.generate(
                  products.length,
                  (index) {
                    final product = products[index];
                    return Productcard(
                      onTap: () {
                        toggleBasket(product);
                      },
                      name: product.name,
                      image: product.image,
                      price: product.price,
                      rate: product.rate,
                      countRate: product.countRate,
                      icon: isInBasket(product)
                          ? Icon(Icons.clear)
                          : Icon(Icons.add),
                    );
                  },
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: App_Colors.primary,
              ),
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: 218,
                    child: ListView.builder(
                      itemCount: basketList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade200,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.asset(basketList[index].image),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Spacer(),
                  VerticalDivider(
                    width: 2,
                    color: Colors.white,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Basket(basketList: basketList,))),
                    child: Text(
                      "View Basket",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Badge(
                      backgroundColor: Colors.red,
                      label: Text(
                        basketList.length.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      child: SvgPicture.asset("assets/icons/basket.svg",
                          colorFilter:
                              ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 35,
          )
        ],
      ),
    );
  }
}
