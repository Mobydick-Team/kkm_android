import 'package:geolocator/geolocator.dart';

class MyLocation {
  double latitude2 = 0;
  double longitude2 = 0;

  Future<void> getMyCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print("latitude 2 : $latitude2");
      print("longitude 2 : $longitude2");
    } catch (e) {
      print(e.toString());
    }
  }
}
