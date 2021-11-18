import 'package:flutter/material.dart';
import 'package:parcial4/app/ui/pages/home/painter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();
  
  static final Marker primeraPosicion = Marker(markerId: MarkerId('Encomiendas SV'),
  infoWindow: InfoWindow(title: 'Encomiendas SV',
  snippet: "Sucursal Lourdes, esta dentro de metrocentro"),
  icon: BitmapDescriptor.defaultMarker,
  position: LatLng(13.727522, -89.359213));
  
static final Marker segundaPosicion = Marker(markerId: MarkerId('Encomiendas SV'),
  infoWindow: InfoWindow(title: 'Encomiendas SV',
  snippet: "Sucursal Merliot, esta dentro de Plaza Merliot"),  
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  position: LatLng(13.679025, -89.275082));

  static final Marker TerceraPosicion = Marker(markerId: MarkerId('Encomiendas SV'),
  infoWindow: InfoWindow(title: 'Encomiendas SV',
  snippet: "A un costado del parque Daniel Hernandez"),  
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  position: LatLng(13.674328, -89.288677));

  static final Marker CuartaPosicion = Marker(markerId: MarkerId('Encomiendas SV'),
  infoWindow: InfoWindow(title: 'Encomiendas SV',
  snippet: "Enfrente del parque Antonio Jose Cañas"),  
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
  position: LatLng(13.645403, -88.784587));



  final _initialCameraPosition =
      const CameraPosition(target: LatLng(13.704125, -89.340613), zoom: 10);
  _onTap(LatLng position) async {
    

    //final bytes = await _myPainterToBitmap(_makers.length.toString());
    final icon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(20, 20)), 'assets/img/auto.png');
    final bytes = await _myPainterToBitmap(position.toString());
    
        //BitmapDescriptor.fromBytes(bytes)
        
    
  }

  // ignore: unused_element
  Future<Uint8List> _myPainterToBitmap(String label) async {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    Paiter myPainter = Paiter(label);
    myPainter.paint(canvas, const Size(300, 70));
    final ui.Image image = await recorder.endRecording().toImage(300, 70);
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sucursales de La organización Encomiendas SV'),
      backgroundColor: Colors.brown),
      body: GoogleMap(        
        onMapCreated: _controller.onMapCreated,
        initialCameraPosition: _initialCameraPosition,
        markers: {primeraPosicion,
                  segundaPosicion,
                  TerceraPosicion,
                  CuartaPosicion},
        onTap: _onTap,
      ),      
    );
  }
}