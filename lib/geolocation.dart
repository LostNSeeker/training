import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




class MyGeolocationDemo extends StatefulWidget {
  const MyGeolocationDemo({super.key});


  @override
  State<MyGeolocationDemo> createState() => _MyGeolocationDemoState();
}


class _MyGeolocationDemoState extends State<MyGeolocationDemo> {
  Position? userPosition;
  getCurrentPosition() async{
    Position _position =    await determinePosition();
    setState(() {
      userPosition = _position;
    });
  }
  determinePosition()async{
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('Location Permission is denied');
      }
    }
    if(permission ==LocationPermission.deniedForever){
      return Future.error(
          "Location Permission are premantley denied"
      );
    }
    return await Geolocator.getCurrentPosition();


  }
  void initState(){
    super.initState();
    getCurrentPosition();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userPosition==null?Center(child: CircularProgressIndicator(),)
          :
      GoogleMap(
        initialCameraPosition: CameraPosition(
            target:LatLng(userPosition!.latitude, userPosition!.longitude),
            zoom: 14
        ),
        mapType: MapType.hybrid,



      )
      ,


    );
  }
}
