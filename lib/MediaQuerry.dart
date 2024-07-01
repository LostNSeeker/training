import 'package:flutter/material.dart';


class MyMediQueryDemo extends StatelessWidget {
  const MyMediQueryDemo({super.key});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;


    //Determine if the screen is narrow or wide
    bool isWideScreen = screenWidth > 600;


    return Scaffold(
      body: Center(
        child: isWideScreen?_buildWideLayout():_buildNarrowLayout(),
      ),
    );
  }


  Widget _buildNarrowLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBox(Colors.red,'Box 1'),
        SizedBox(height: 20,),
        _buildBox(Colors.green,'Box 2'),
        SizedBox(height: 20,),
        _buildBox(Colors.blue,'Box 3'),
        SizedBox(height: 20,),
      ],
    );


  }
  Widget _buildWideLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildBox(Colors.red,'Box 1'),


        _buildBox(Colors.green,'Box 2'),


        _buildBox(Colors.blue,'Box 3'),
        _buildBox(Colors.purple,'Box 4'),
      ],
    );


  }
  Widget _buildBox(Color color, String s) {
    return  Container(
      width: 100,
      height: 100,
      color:color ,
      child: Center(
        child: Text(s, style: TextStyle(color: Colors.white, fontSize: 18),),
      ),
    );
  }
}
