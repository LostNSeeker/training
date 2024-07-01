

import 'package:flutter/material.dart';




class Chat extends StatelessWidget {
  const Chat({super.key});


  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.person, size: 60,),
              title: Text('Peter Parker'),
              subtitle: Text('peter@gmail.com'),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              leading: Icon(Icons.person, size: 60,),
              title: Text('Peter Parker'),
              subtitle: Text('peter@gmail.com'),
              trailing: Icon(Icons.arrow_forward),
            ),

          ],
        )
    );
  }
}
