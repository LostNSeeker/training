import 'package:flutter/material.dart';

class RestaurantMenu extends StatelessWidget {
  const RestaurantMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(//try to make in a class
        title: Text('Resturant menu'),
        backgroundColor: Colors.red[500],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Card(
            color: Colors.red[500],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset('assets/images/VegPizza.png', width: 60, height: 60),
                  SizedBox(width: 10),
                  Text('Vegetable Pizza'),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            color: Colors.red[500],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset('assets/images/cheezepizza.png', width: 60, height: 60),
                  SizedBox(width: 10),
                  Text('Cheese Pizza'),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            color: Colors.red[500],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset('assets/images/fries.png', width: 60, height: 60),
                  SizedBox(width: 10),
                  Text('Fries'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
