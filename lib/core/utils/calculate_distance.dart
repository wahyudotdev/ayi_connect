import 'dart:math';

double calculateDistance(startLat, startLng, endLat, endLng) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((endLat - startLat) * p) / 2 +
      c(startLat * p) * c(endLat * p) * (1 - c((endLng - startLng) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
