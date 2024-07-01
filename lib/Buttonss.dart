import 'package:flutter/material.dart';
import 'package:traning/items.dart';

class Buttonss extends StatefulWidget {
  const Buttonss({super.key, required this.message});

  final String message;

  @override
  State<Buttonss> createState() => _ButtonssState();
}

class _ButtonssState extends State<Buttonss> {
  var country = ['INDIA', 'USA', 'UK', 'AFRICA'];
  var defaultCountry = 'INDIA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Dashboard'),
          backgroundColor: Colors.deepOrangeAccent,
          actions: [
            PopupMenuButton(
                onSelected: AddActionOnItem,
                itemBuilder: ((BuildContext context) => (Item.choices
                    .map((choice) => (PopupMenuItem(
                          value: choice,
                          child: Text(choice),
                        )))
                    .toList())))
          ]),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text('Login')),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.save)),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete))
            ],
          ),
          TextButton(onPressed: () {}, child: Text('Register')),
          OutlinedButton(onPressed: () {}, child: Text('Settings')),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: () {}, child: Text('Flight')),
              OutlinedButton(onPressed: () {}, child: Text('Train')),
              OutlinedButton(onPressed: () {}, child: Text('Bus')),
            ],
          ),
          DropdownButton(
            onChanged: (String? selectedValue) {
              setState(() {
                defaultCountry = selectedValue!;
              });
            },
            items: country
                .map((String c) => (DropdownMenuItem(
                      child: Text(c),
                      value: c,
                    )))
                .toList(),
            value: defaultCountry,
          ),
          OutlinedButton(onPressed: () {}, child: Text(widget.message)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FAB Clicked');
        },
        child: Icon(Icons.call),
      ),
    );
  }

  void AddActionOnItem(selectedItem) {
    switch (selectedItem) {
      case Item.Inbox:
        print('Inbox');
        break;
      case Item.SentItems:
        print('SentItems');
        break;
      case Item.JunkEmails:
        print('JunkEmails');
        break;
      case Item.SignOut:
        print('SignOut');
        break;
    }
  }
}
