import 'dart:async';
import 'dart:convert';


import 'package:traning/EncryptionHelper.dart';
import 'package:http/http.dart' as http;
class EncryptionApiService{
  final String apiurl = 'https://jsonplaceholder.typicode.com/posts';
  final encryptionHelper = EncryptionHelper();


  Future<void> sendEncryptedRequest(String data) async{
    final encryptedData = encryptionHelper.encryptText(data);


    // Timer(new Duration(seconds: 5),()async {
    final response =   await http.post(
        Uri.parse(apiurl),
        headers: {
          'Content-type':'application/json'
        },
        body: jsonEncode({'data':encryptedData})


    );


    if(response.statusCode ==201){
      final responseData = jsonDecode(response.body);
      print('Response Data:  $responseData');


      // decrypt
      final decryptData = encryptionHelper.decryptText(encryptedData);
      print('DecryptesResponse :  $decryptData');
    }
    else{
      throw Exception('Failed to load data');
    }
    // });




  }


}
