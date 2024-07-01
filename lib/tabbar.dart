import 'package:flutter/material.dart';
// import 'package:flutterproject2024blr/Screens/MyTabBarViewDemo.dart';


class MyTabBarDemo extends StatefulWidget {
  const MyTabBarDemo({super.key});


  @override
  State<MyTabBarDemo> createState() => _MyTabBarDemoState();
}


class _MyTabBarDemoState extends State<MyTabBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('WhatsApp'),backgroundColor: Colors.lightGreen,),
        body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(text: 'Chats',),
                    Tab(text: 'Status',),
                    Tab(text: 'Calls',),
                  ],
                ),
                // Expanded(
                //   child: TabBarView(
                //     children: [
                //       Center(child: Chat()),
                //       Center(child: Text('Status'),),
                //       Center(child: Text('Calls'),),
                //     ],
                //   ),
                // )
              ],
            )


        )
    );
  }
}
