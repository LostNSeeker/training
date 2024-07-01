import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:traning/sessions/LoginUISession.dart';
import 'package:http/http.dart' as http;


class WorkWithSessionData extends StatefulWidget {
  const WorkWithSessionData({super.key});


  @override
  State<WorkWithSessionData> createState() => _WorkWithSessionDataState();
}


class _WorkWithSessionDataState extends State<WorkWithSessionData> {


  final secureStorage  = new FlutterSecureStorage();
  String? accessToken = '';
  String? secureData = '';
  Timer? _idleTimer;
  bool _isUserActive = false;


  void initState(){
    super.initState();
    _loadToken();
    _startIdleTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Session Screen'),
        actions: [
          IconButton(
              onPressed: (){
                _logout();
              }, icon: Icon(Icons.logout))
        ],
      ),
      body: GestureDetector(
        onTap: _handleUserInteraction,
        child: ListView(
          children: [
            Text('Access_Token:'),
            SizedBox(height: 8,),
            Text(accessToken??''),
            SizedBox(height: 15,),
            ElevatedButton(
                onPressed: (){
                  _getSecureData();
                }, child: Text('Get Secure Data')),
            SizedBox(height: 15,),
            Text('$secureData')
          ],
        ),
      ),
    );
  }


  // void _getSecureData() async {
  //   final response = await http.get(
  //     Uri.parse('http://192.168.227.56:3000/secure-data'),
  //     headers: {
  //       'Content-type': 'application/json',
  //       'Authorization': 'Bearer $accessToken'
  //     },
  //
  //   );
  //   if (response.statusCode == 401) {}
  //   else if (response.statusCode == 200) {
  //     final responseData = jsonDecode(response.body);
  //     setState(() {
  //       secureData = responseData['data'];
  //     });
  //   }
  // }
  void _getSecureData() async {
    final client  = http.Client();
    try{
      final response = await client.get(
        Uri.parse('http://192.168.227.56:3000/secure-data'),
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        },


      ).timeout(Duration(seconds: 10));


      if (response.statusCode == 401) {}
      else if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState(() {
          secureData = responseData['data'];
        });
      }
    }
    on TimeoutException catch(_){
      setState(() {
        secureData = 'Request Time out, please try again';
      });
    }






  }
  void _loadToken() async{
    var token =  await secureStorage.read(key: 'access_token');
    setState(() {
      accessToken = token;
    });
  }


  void _logout() async {
    await secureStorage.delete(key: 'access_token');
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context)=>LoginUISession()), (route) => false);
  }


  void _startIdleTimer() {
    _idleTimer =   Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if(!_isUserActive){
        if(timer.tick >=60){
          _showSessionExpiryDialog();
          timer.cancel();
        }
      }
    });
  }


  void _showSessionExpiryDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Session Expired'),
            content: Text('Your session has expired, please log in again', ),
            actions: [
              TextButton(
                  onPressed: (){
                    _logout();
                    Navigator.of(context).pop();
                  },
                  child: Text('ok')
              )
            ],
          );
        }
    );
  }


  void _handleUserInteraction() {
    print('tapped');
    setState(() {
      _isUserActive = true;
    });
    _resetIdleTimer();
    Future.delayed(Duration(seconds: 1),(){
      setState(() {
        _isUserActive = false;
      });
    });


  }


  void _resetIdleTimer() {
    _idleTimer?.cancel();
    _startIdleTimer();
  }
}






