class Store {
  final int id;
  final String imgSrc;
  final String shopName;
  final double lat;
  final double lng;

  Store({required this.id, required this.imgSrc, required this.shopName, this.lat=0.0, this.lng=0.0});
}