import 'package:flutter/material.dart';


class MyNavigationDrawer extends StatefulWidget {
  const MyNavigationDrawer({super.key});


  @override
  State<MyNavigationDrawer> createState() => _MyNavigationDrawerState();
}


class _MyNavigationDrawerState extends State<MyNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          createDrawerHeader(),
          createDrawerBodyItem(icon:Icons.home, text:'Home', onTap:()=>{print('Home Tapped')}),
          createDrawerBodyItem(icon:Icons.notifications_active, text:'Notification',onTap:()=>{print('Notification Tapped')})
        ],
      ),
    );
  }


  createDrawerBodyItem({required IconData icon, required String text, required Set<void> Function() onTap}) {


    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          Padding(padding: EdgeInsets.only(left: 8), child: Text(text),)
        ],
      ),
      onTap: onTap,
    );
  }


  createDrawerHeader() {
    return DrawerHeader(
        child: Image( image: NetworkImage('https://img.freepik.com/free-photo/abstract-colorful-splash-3d-background-generative-ai-background_60438-2509.jpg?size=626&ext=jpg&ga=GA1.1.1141335507.1718841600&semt=sph'),)


    );
  }




}

