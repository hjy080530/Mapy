import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class StepMap extends StatelessWidget {
  const StepMap({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(37.5665, 126.9780), // 서울시청 위도 경도 🌏
        zoom: 15.0,
      ),
      children: [
        TileLayer(
          urlTemplate:
          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
          userAgentPackageName: 'com.example.mapy',
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 40,
              height: 40,
              point: LatLng(37.5665, 126.9780),
              child: const Icon(Icons.location_on, color: Colors.red, size: 40),
            ),
          ],
        ),
      ],
    );
  }
}