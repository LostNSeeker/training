import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class BiometricImageUpload extends StatefulWidget {
  @override
  _BiometricImageUploadState createState() => _BiometricImageUploadState();
}

class _BiometricImageUploadState extends State<BiometricImageUpload> {
  File? _image;
  final ImagePicker picker = ImagePicker();
  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticated = false;

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final fileExtension = file.path.split('.').last.toLowerCase();
      final fileSize = await file.length();

      if (fileSize > 2 * 1024 * 1024) {
        // Image size exceeds 2MB
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image size should be less than 2MB')),
        );
      } else if (!['jpg', 'jpeg', 'png'].contains(fileExtension)) {
        // Invalid file format
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid image format. Only .jpg, .jpeg, and .png are allowed')),
        );
      } else {
        setState(() {
          _image = file;
        });
      }
    }
  }

  Future<void> _authenticate() async {
    try {
      final bool authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
          biometricOnly: true,
        ),
      );
      setState(() {
        _isAuthenticated = authenticated;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biometric and Image Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _authenticate,
              child: Text('Authenticate'),
            ),

              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => getImage(ImageSource.gallery),
                    child: Text('Pick Image'),
                  ),
                  if (_image != null)
                    Image.file(
                      _image!,
                      width: 200,
                      height: 200,
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
