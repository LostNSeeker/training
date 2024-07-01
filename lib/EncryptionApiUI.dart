import 'package:flutter/material.dart';
import 'package:traning/encryptionApiService.dart';


class ApiEncryptionUI extends StatelessWidget {
  ApiEncryptionUI({super.key});
  final apiService = EncryptionApiService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Api Encryption Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            try{
              await apiService.sendEncryptedRequest('Hello World');


            }
            catch(e){


            }
          },
          child: Text('Send Encrypted Data'),
        ),
      ),
    );
  }
}


