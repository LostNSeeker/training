import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApiList extends StatefulWidget {
  const MyApiList({super.key});

  @override
  State<MyApiList> createState() => _MyApiListState();
}

class _MyApiListState extends State<MyApiList> {
  late Future<List<Map<String, dynamic>>> futureData;

  Future<List<Map<String, dynamic>>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=10'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['results'];
      List<Map<String, dynamic>> data = body.cast<Map<String, dynamic>>();
      return data;
    } else {
      throw Exception('Failed');
    }
  }

  void initState() {
    super.initState();
    futureData = fetchData();
    print(futureData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),
      body: Center(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: futureData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              List<Map<String, dynamic>> data = snapshot.data!;

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage('${data[index]['picture']['large']}'),
                      ),
                      title: Text('${data[index]['name']['title']} .'),
                      subtitle: Text('${data[index]['name']['first']}'),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
