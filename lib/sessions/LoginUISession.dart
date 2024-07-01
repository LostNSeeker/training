import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:traning/sessions/WorkWithSessionDebug.dart';
import 'package:http/http.dart' as http;


class LoginUISession extends StatefulWidget {
  const LoginUISession({super.key});


  @override
  State<LoginUISession> createState() => _LoginUISessionState();
}


class _LoginUISessionState extends State<LoginUISession> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  final secureStorage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Panel'),),
      body: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passwordController,


            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),


          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){
                _login(context);
              },
              child: Text('Login'))
        ],
      ),
    );
  }


  void _login(BuildContext context) async{
    final response =   await http.post(
        Uri.parse('http://192.168.227.56:3000/login'),
        headers: {'Content-type':'application/json'},
        body: jsonEncode({
          'email':_emailController.text,
          'password':_passwordController.text
        })
    );
    if(response.statusCode== 200){
      final responseData = jsonDecode(response.body);
      await secureStorage.write(key: 'access_token', value: responseData['accessToken']);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>WorkWithSessionData())
      );
    }
  }
}
