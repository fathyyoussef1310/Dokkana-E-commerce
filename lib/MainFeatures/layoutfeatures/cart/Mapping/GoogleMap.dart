import 'dart:async';

import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(20, 38),
    zoom: 3,
  );
  Future<void>getLocation()async{
   bool isenabled= await Geolocator.isLocationServiceEnabled();
   if(!isenabled){
     await Geolocator.openLocationSettings();
     return;
   }
   LocationPermission permission= await Geolocator.checkPermission();
   if(permission== LocationPermission.denied){
     await Geolocator.requestPermission();
   }
   if(permission==LocationPermission.denied|| permission == LocationPermission.deniedForever){
     if (mounted) {
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             content: Text(
               "Open Location Permission First",
               style: GoogleFonts.aboreto(color: Colorsmanager.White),
             ),
           )
       );
     }
     return;
   }
   try{
     Position pos=await Geolocator.getCurrentPosition(
       desiredAccuracy: LocationAccuracy.high,
     );
     final GoogleMapController controller = await _controller.future;
     controller.animateCamera(
         CameraUpdate.newCameraPosition(
             CameraPosition(
               target: LatLng(pos.latitude, pos.longitude),
               zoom: 17,
             )
         )
     );
     List<Placemark>places=await placemarkFromCoordinates(pos.latitude, pos.longitude);
     String address="No address found";
     if(places.isNotEmpty){
       Placemark place= places[0];
       address=[
         place.country?? '',
         place.administrativeArea?? '',
         place.subAdministrativeArea?? '',
         place.locality??'',
         place.subLocality??'',
         place.street??'',
       ].where((p)=> p!=p.isNotEmpty).join(',');
       if(mounted){
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Current Location is $address"),backgroundColor: Colorsmanager.green,duration: Duration(seconds: 6),));
       }
     }
   }catch(e){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text( " error $e"),backgroundColor: Colorsmanager.red,duration: Duration(seconds: 6),));
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: getLocation,
        label: const Text(' '),
        icon: const Icon(CupertinoIcons.location_circle,),
        backgroundColor: Colorsmanager.gray,
      ),
    );
  }
}