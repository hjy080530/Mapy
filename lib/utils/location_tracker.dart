import 'dart:html' as html;
import 'dart:async';

class LocationTracker {
  Future<Map<String, double>> getCurrentLocation() async {
    final completer = Completer<Map<String, double>>();

    html.window.navigator.geolocation?.getCurrentPosition().then((position) {
      final coords = position.coords!;
      completer.complete({
        'latitude': (coords.latitude ?? 0) as double,
        'longitude': (coords.longitude ?? 0) as double,
      });
    }).catchError((error) {
      print('🚨 위치 가져오기 실패: $error');
      completer.complete({
        'latitude': 0.0,
        'longitude': 0.0,
      });
    });

    return completer.future;
  }
}