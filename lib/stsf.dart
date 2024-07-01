import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home:example()));
}
int x=1;
class example extends StatefulWidget {

  const example({super.key});

  @override
  State<example> createState() => _exampleState();
}

class _exampleState extends State<example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('StSf classes'),
      ),
      body:
      Column(
        children: [
          Image.asset( 'assets/images/cute$x.png'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              x = 2;
            });
          },
          child: Text('you like dogs'),
        )


        ],
      )
    );
  }
}
