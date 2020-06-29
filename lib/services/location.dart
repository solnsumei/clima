import 'package:geolocator/geolocator.dart';


class Location {

  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    Position position;
    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);

      if (position == null) {
        position = await Geolocator()
            .getLastKnownPosition(desiredAccuracy: LocationAccuracy.medium);
      }

      longitude = position.longitude;
      latitude = position.latitude;

    } catch (e) {
      print(e);
    }
  }
}