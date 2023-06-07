import 'package:flutter/material.dart';

class TotalOrderContainer extends StatelessWidget {
  const TotalOrderContainer({super.key, required this.price});
  final num price;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 3,
            color: Colors.grey.withOpacity(0.5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children:  [
              const Text(
                "Total",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "\$$price",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("  Buy  "),
          )
        ],
      ),
    );
  }
}
