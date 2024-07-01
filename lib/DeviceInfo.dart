import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class MyDeviceInfo extends StatefulWidget {
  const MyDeviceInfo({super.key});

  @override
  State<MyDeviceInfo> createState() => _MyDeviceInfoState();
}

class _MyDeviceInfoState extends State<MyDeviceInfo> {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo? androidInfo;

  void _getDeviceInfo() async {
    try {
      final info = await deviceInfoPlugin.androidInfo;
      setState(() {
        androidInfo = info;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Device Info')),
      body: Center(
        child: androidInfo == null
            ? CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Device Id: ${androidInfo!.id}'),
            Text('Model: ${androidInfo!.model}'),
            Text('Brand: ${androidInfo!.brand}'),
            // Add more information as needed
          ],
        ),
      ),
    );
  }
}
