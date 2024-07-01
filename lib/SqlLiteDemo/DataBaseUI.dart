import 'package:flutter/material.dart';
import 'package:traning/SqlLiteDemo/DatabaseHelper.dart';

class SqliteDBDemoUI extends StatefulWidget {
  const SqliteDBDemoUI({super.key});

  @override
  State<SqliteDBDemoUI> createState() => _SqliteDBDemoUIState();
}

class _SqliteDBDemoUIState extends State<SqliteDBDemoUI> {
  @override
  late Future<List<Map<String, dynamic>>> _items;
  TextEditingController _controller = TextEditingController();

  void initState() {
    super.initState();
    _fetchItem();
  }

  void _fetchItem() {
    setState(() {
      _items = Databasehelper().getItem();
    });
  }

  void _insertItem(String name) async {
    await Databasehelper().insertItem({'name': name});
    _fetchItem();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqlite Demo'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'itemname'),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      _insertItem(_controller.text);
                    },
                    child: Text('Add'))
              ],
            ),
          ),
          Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
            future: _items,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text('No items Found'));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index]['name']),
                      );
                    });
              }
            },
          ))
        ],
      ),
    );
  }
}
