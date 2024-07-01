import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:traning/Buttonss.dart';
import 'package:traning/api.dart';
import 'package:traning/resturantmenu.dart';
import 'package:traning/stsf.dart';
import 'package:traning/webview.dart';
import 'package:traning/bottomNavigationBar.dart';
import 'package:traning/tabbar.dart';
import 'package:traning/drawer.dart';
import 'package:traning/formNpassword.dart';
import 'package:traning/siCalci.dart';
import 'package:traning/geolocation.dart';
import 'package:traning/bloc_counter_ui.dart';
import 'package:traning/bloc_auth_ui.dart';
import 'package:traning/patientEncryptionInfo.dart';
import 'package:traning/SqlLiteDemo/DataBaseUI.dart';
import 'package:traning/Stepper.dart';
import 'package:traning/ProgressBar.dart';
import 'package:traning/chart.dart';
import 'package:traning/CameraDemo.dart';
import 'package:traning/CarousalDemo.dart';
import 'package:traning/Navigation.dart';
import 'package:traning/DeviceInfo.dart';
import 'package:traning/pickNupload.dart';



//just because camera is used , we have to use future
Future<void> main() async{
WidgetsFlutterBinding.ensureInitialized();
final cameras = await availableCameras();
final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
final CameraDescription camera;

MyApp({required this.camera});

@override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/restaurantmenu': (context) => RestaurantMenu(),
        '/stsf':(context)=>example(),
        '/Buttonss':(context)=>Buttonss(message: 'papa bolo',),
        '/webview':(context)=>Webview(),
        '/bottomNavigationBar':(context)=>MyBottomNavigationBarDemo(),
        '/tabbar':(context)=>MyTabBarDemo(),
        '/api':(context)=>MyApiList(),
        '/drawer':(context)=>MyNavigationDrawer(),
        '/formNpassword':(context)=>MyTextFieldDemo(),
        '/siCalci':(context)=>SiCalci(),
        '/geolocation':(context)=>MyGeolocationDemo(),
        '/bloc_counter_ui':(context)=>MyBlocCounter(),
        '/bloc_auth_ui':(context)=>BlocLoginPage(),
        '/patientEncryptionInfo':(context)=>PatientInfo(),
        '/SqlLiteDemo/DataBaseUI':(context)=>SqliteDBDemoUI(),
        '/chart':(context)=>ChartDemo(),
        '/ProgressBar':(context)=>AppProgressBar(),
        '/Stepper':(context)=>StepperDemo(),
        '/CameraDemo':(context)=>CameraDemo(camera: camera),
        '/CarousalDemo':(context)=>CarouselDemo(),
        '/Navigation':(context)=>Navigation(),
        '/DeviceInfo':(context)=>MyDeviceInfo(),



      },
    );
  }
}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Basic Widgets ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.yellow[600],

      ),
      drawer: MyNavigationDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/pexels-pixabay-45201.jpg'),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Text('hello'),
                  SizedBox(width: 10),
                  Icon(Icons.save, size: 20), // Corrected size from 10 to 20
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Colors.yellow[500],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('card'),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/restaurantmenu');
                    },
                    child: Text('Resturant Card'),
                  ),
                  SizedBox(height:10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/stsf');
                    },
                    child: Text('to StSf widgets '),
                  ),
                ],
              ),
              SizedBox(height:10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Buttonss');
                    },
                    child: Text('Buttonss '),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/webview');
                    },
                    child: Text('Webview'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/siCalci');
                    },
                    child: Text('SiCalci'),
                  ),
                ],
              ),

              SizedBox(height:10),

             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 ElevatedButton(
                   onPressed: () {
                     Navigator.pushNamed(context, '/bottomNavigationBar');
                   },
                   child: Text('BottomNavigationButtom'),
                 ),

                 ElevatedButton(
                   onPressed: () {
                     Navigator.pushNamed(context, '/tabbar');
                   },
                   child: Text('Tabbar'),
                 ),
               ],
             ),
              SizedBox(height:10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/api');
                    },
                    child: Text('API'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/drawer');
                    },
                    child: Text('Drawer'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/formNpassword');
                    },
                    child: Text('password'),
                  ),
                ],
              ),
                SizedBox(height: 10,),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   ElevatedButton(
                     onPressed: () {
                       Navigator.pushNamed(context, '/geolocation');
                     },
                     child: Text('Google Map'),
                   ),
                   ElevatedButton(
                     onPressed: () {
                       Navigator.pushNamed(context, '/bloc_counter_ui');
                     },
                     child: Text('Counter State'),
                   ),
                 ],
               ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [


                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/bloc_auth_ui');
                    },
                    child: Text('Bloc Authentication'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/patientEncryptionInfo');
                    },
                    child: Text('Patient Encrypted Data'),
                  ),
                ],
              ),
                SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [


                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/SqlLiteDemo/DataBaseUI');
                    },
                    child: Text('Sql Lite Demo'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/CameraDemo');
                    },
                    child: Text('Camera'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/CarousalDemo');
                    },
                    child: Text('Carousal'),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, '/patientEncryptionInfo');
                  //   },
                  //   child: Text('Patient Encrypted Data'),
                  // ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ProgressBar');
                    },
                    child: Text('Progress Bar'),
                  ),ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Stepper');
                    },
                    child: Text('Stepper'),
                  ),
                ],
              ),

              SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Navigation');
              },
              child: Text('Navigation'),
            ),

              ElevatedButton(onPressed: ()
                  {
                    Navigator.pushNamed(context, '/DeviceInfo');
                  }, child: Text('Device Info')


              ),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Picknupload()));
                }, child: Text('Pick N Upload'))

            ]

          )
            ],

          ),
        ),
      ),
    );
  }
}


//by--> Akshat Srivastava :)