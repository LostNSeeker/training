import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AppProgressBar extends StatefulWidget {
  const AppProgressBar({super.key});


  @override
  State<AppProgressBar> createState() => _AppProgressBarState();
}


class _AppProgressBarState extends State<AppProgressBar> {
  double _progress = 0.0;
  List<String> _data = [];
  bool _loading = false;


  Future<void> _fetchData() async {
    setState(() {
      _loading = true;
      _progress = 0.0;
      _data.clear(); // Clear previous data
    });


    const url = 'https://jsonplaceholder.typicode.com/posts'; // Example API endpoint
    final response = await http.get(Uri.parse(url));


    if (response.statusCode == 200) {
      final List<dynamic> parsedData = jsonDecode(response.body);
      final totalItems = parsedData.length;


      for (var i = 0; i < totalItems; i++) {
        _data.add(parsedData[i]['title']);
        setState(() {
          _progress = (i + 1) / totalItems; // Calculate progress percentage
        });
        await Future.delayed(Duration(milliseconds: 500)); // Simulate delay for demonstration
      }
    } else {
      print('Failed to load data');
    }


    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: _loading
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20,),
              Text('Fetching data..'),
              SizedBox(height: 10,),
              LinearProgressIndicator(
                value: _progress,


              )
            ],
          )
              :
          _data.isNotEmpty?
          ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(_data[index]),
                );
              }


          )
              : Text('No data Available')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loading?null:_fetchData,
        child: Icon(Icons.refresh),
      ),


    );
  }
}
