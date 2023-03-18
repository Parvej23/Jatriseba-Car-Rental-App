import 'package:flutter/material.dart';

class SpecificsCard extends StatelessWidget {
  final double? price;
  final String name;
  final String name2;

  SpecificsCard({required this.price, required this.name, required this.name2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: price == null ? 80 : 100,
      width: 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: price == null
          ? Column(
              children: [
                Text(
                  name,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  name2,
                ),
              ],
            )
          : Column(
              children: [
                Text(
                  name,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  price.toString(),

                ),
                SizedBox(
                  height: 5,
                ),
                Text(name2)
              ],
            ),
    );
  }
}
