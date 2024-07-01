
import 'dart:convert';
import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class PatientInfo extends StatefulWidget {
  const PatientInfo({super.key});


  @override
  State<PatientInfo> createState() => _PatientInfoState();
}


class _PatientInfoState extends State<PatientInfo> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _medicalRecordController = TextEditingController();
  String _encryptedName = '';
  String _encryptedMedicalRecordId = '';
  String _decryptedName = '';
  String _decryptedMedicalRecordId = '';


  final storage = FlutterSecureStorage();
  final iv = encrypt.IV.fromLength(16);


  void _encryptPatientInfo() async{
    try{


      // Generate or fetch the encryption key
      String encryptioKey =   await _getOrGenerateEncryptionKey();
      print('hello');
      final key = encrypt.Key.fromBase64(encryptioKey);


      final encrypter = encrypt.Encrypter(encrypt.AES(key));


      String name = _nameController.text;
      String medicalRecordId = _medicalRecordController.text;


      final encryptedName = encrypter.encrypt(name, iv:iv);
      final encryptedMedicalRecordId = encrypter.encrypt(medicalRecordId, iv:iv);


      setState(() {
        _encryptedName = encryptedName.base64;
        _encryptedMedicalRecordId = encryptedMedicalRecordId.base64;
      });
      print('Hello');
      print('Encrypted name  $_encryptedName');


      print('Encrypted MedicalRecord Id  $_encryptedMedicalRecordId');
    }
    catch(e){
      print(e);
    }
  }
  _getOrGenerateEncryptionKey()async{
    var key = await storage.read(key: 'encryption_key');
    if(key ==null || key.isEmpty){
      key =  _generateRandomKey(32);
      await storage.write(key: 'encryption_key', value: key);
    }
    return key!;


  }
  _generateRandomKey(int length){
    var random =   Random.secure();
    var values = List<int>.generate(length, (i) => random.nextInt(256));
    return base64Url.encode(values);
  }


  void _decryptPatientInfo() async {
    try{
      // Generate or fetch the encryption key
      String encryptioKey =   await _getOrGenerateEncryptionKey();


      final key = encrypt.Key.fromBase64(encryptioKey);


      final encrypter = encrypt.Encrypter(encrypt.AES(key));


      final decryptedName = encrypter.decrypt64(_encryptedName, iv:iv);


      final decryptedMedicalRecordId = encrypter.decrypt64(_encryptedMedicalRecordId, iv:iv);


      setState(() {
        _decryptedName = decryptedName;
        _decryptedMedicalRecordId = decryptedMedicalRecordId;
      });
      print('Hello');
      print('Decrypt name  $_decryptedName');


      print('Decrypt MedicalRecord Id  $_decryptedMedicalRecordId');
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Patient Infomration'),),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: 'Patient Name'
                ),
              ),
              TextField(
                controller: _medicalRecordController,
                decoration: InputDecoration(
                    labelText: 'Medical Record Id'
                ),
              ),
              SizedBox(height: 32,),
              ElevatedButton(
                  onPressed: _encryptPatientInfo,
                  child: Text('Encrypt Patient Info')),
              SizedBox(height: 16,),
              ElevatedButton(
                  onPressed: _decryptPatientInfo,
                  child: Text('Decrypt Patient Info')),


              SizedBox(height: 16,),
              Text(
                'Encrypted Name:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8,),
              Text(_encryptedName),
              SizedBox(height: 16,),
              Text(
                'Encrypted Medical Record Id:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8,),
              Text(_encryptedMedicalRecordId),
              SizedBox(height: 16,),
              Text(
                'Decrypted Name:',
                style: TextStyle(fontWeight: FontWeight.bold),


              ),
              SizedBox(height: 8,),
              Text(_decryptedName),
              SizedBox(height: 16,),
              Text(
                'Decrypted Medical Record Id:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8,),
              Text(_decryptedMedicalRecordId),
            ],
          ),
        )
    );
  }




}
