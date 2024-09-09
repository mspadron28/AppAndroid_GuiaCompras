import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomInfoWindowScreen extends StatefulWidget {
  @override
  State<CustomInfoWindowScreen> createState() => _CustomInfoWindowScreenState();
}

class _CustomInfoWindowScreenState extends State<CustomInfoWindowScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(-0.30581104140161824, -78.4553152310098),
    zoom: 14,
  );

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _markers.add(
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(-0.30581104140161824, -78.4553152310098),
        infoWindow: InfoWindow(
          title: 'Lugar Ejemplo',
          snippet: 'Descripción breve del lugar.',
          onTap: _onInfoWindowTapped,
        ),
        onTap: () {
          _onMarkerTapped('Lugar Ejemplo', 'Descripción breve del lugar.', 'https://via.placeholder.com/150');
        },
      ),
    );
  }

  void _onInfoWindowTapped() {
    // Esta función se ejecutará cuando se haga clic en la ventana de información
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Lugar Ejemplo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network('https://via.placeholder.com/150'),
              SizedBox(height: 8),
              Text('Descripción detallada del lugar.'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void _onMarkerTapped(String title, String description, String imageUrl) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Image.network(imageUrl),
              SizedBox(height: 8),
              Text(description),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _initialPosition,
          markers: _markers,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
