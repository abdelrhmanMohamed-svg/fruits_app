import 'package:flutter/material.dart';

class Productcard extends StatelessWidget {
  const Productcard(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.rate,
      required this.countRate,
      this.onTap,
      required this.icon});
  final String name;
  final String image;
  final String price;
  final String rate;
  final String countRate;
  final Function()? onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 140,
                height: 110,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 7,
                  right: 5,
                  child: GestureDetector(
                    onTap: onTap,
                    child: CircleAvatar(
                        radius: 18, backgroundColor: Colors.white, child: icon),
                  ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/icons/star.png",
                      width: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      rate,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ), SizedBox(
                      width: 5,
                    ),
                    Text(
                      countRate,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  price,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
