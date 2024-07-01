import 'dart:io';
import 'package:path/path.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class CameraDemo extends StatefulWidget {
  final CameraDescription camera;
  CameraDemo({super.key, required this.camera});


  @override
  State<CameraDemo> createState() => _CameraDemoState();
}


class _CameraDemoState extends State<CameraDemo> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;


  void initState(){
    super.initState();
    _controller = CameraController(
        widget.camera,
        ResolutionPreset.high);


    _initializeControllerFuture = _controller.initialize();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take a picture'),),
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot){
          if(snapshot.connectionState ==ConnectionState.done){
            return CameraPreview(_controller);
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          try{
            await _initializeControllerFuture;


            final path = join(
              ( await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',


            );
            await _controller.takePicture().then(
                    (XFile file)async {
                  await file.saveTo(path);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>DisplayPictureScreen(imagePath:path))
                  );
                });
          }
          catch(e){


          }
        },
      ),
    );
  }
}


class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;


  const DisplayPictureScreen({super.key, required this.imagePath});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the picture'),),
      body: Image.file(File(imagePath)),
    );
  }
}


// Main.dart
// WidgetsFlutterBinding.ensureInitialized();
// final cameras = await availableCameras();
// final firstCamera = cameras.first;
//
//
// runApp(MaterialApp(
// debugShowCheckedModeBanner: false,
//
//
// home: CameraDemo(camera: firstCamera,),
// ));
