import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PDFScreen(),
    );
  }
}

class PDFScreen extends StatefulWidget {
  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  String? localFilePath;

  @override
  void initState() {
    super.initState();
    downloadPDF().then((filePath) {
      setState(() {
        localFilePath = filePath;
      });
    });
  }

  Future<String> downloadPDF() async {
    final url = "https://www.example.com/sample.pdf";
    final response = await http.get(Uri.parse(url));
    final directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/sample.pdf";
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Viewer"),
      ),
      body: localFilePath != null
          ? PDFView(
        filePath: localFilePath,
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
