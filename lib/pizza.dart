import 'package:flutter/material.dart';

class PIZZA extends StatefulWidget {
  const PIZZA({super.key});

  @override
  State<PIZZA> createState() => _PIZZAState();
}

class _PIZZAState extends State<PIZZA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WOW Pizza'),
        backgroundColor: Colors.orange,

        actions: [
          Icon(Icons.facebook)
        ],
      ),

      body: Column(
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: (){},
                  child: Text('Vegetable Pizza')),
              OutlinedButton(
                  onPressed: (){},
                  child: Text('Cheese Pizza')),
              OutlinedButton(
                  onPressed: (){},
                  child: Text('Fries')),
            ],
          ),

          Center(
           child: Image.asset('assets/images/cheezepizza'),
          ),
          Center(
            child: Text('Hi, Im the Pizza Assistant what can i help you order?'),
          ),









        ],
      ),
    );
  }
}
