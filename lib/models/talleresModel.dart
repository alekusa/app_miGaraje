import 'package:google_maps_flutter/google_maps_flutter.dart';

class Coffee {
  String shopName;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  Coffee(
      {this.shopName,
      this.address,
      this.description,
      this.thumbNail,
      this.locationCoords});
}

final List<Coffee> coffeeShops = [
  Coffee(
      shopName: 'Taller Armand',
      address: 'Calle 2222',
      description:
          'El taller de Peluca - te reparan todo el Auto',
      locationCoords: LatLng(-31.394283, -64.156392),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipNNzoa4RVMeOisc0vQ5m3Z7aKet5353lu0Aah0a=w90-h90-n-k-no'
      ),
  Coffee(
      shopName: 'Taller gangy',
      address: 'Rioja 28',
      description:
          'Venden de todo',
      locationCoords: LatLng(-31.411069, -64.183598),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'
      ),
  Coffee(
      shopName: 'Repuestos repuestin',
      address: 'Calle 0000',
      description:
          'Todos los repuestos que necesitas para tu auto ',
      locationCoords: LatLng(-31.408787, -64.186175),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no'
      ),
  Coffee(
      shopName: 'Repuestinis Alberto',
      address: 'Calle 1 0000',
      description:
          'Repuestos para tu autito',
      locationCoords: LatLng(-31.402982, -64.175111),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no'
      ),
  Coffee(
      shopName: 'Taller tren delantero',
      address: '25315 Calle por ahi',
      description:
          'Reparacion de tren delantero frenos amortiguadores etc',
      locationCoords: LatLng(-31.404339, -64.163282),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipOMNvnrTlesBJwUcVVFBqVF-KnMVlJMi7_uU6lZ=w90-h90-n-k-no'
      )
];