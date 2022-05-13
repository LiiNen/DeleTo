class Store {
  final int id;
  final String imgUrl;
  final String shopName;
  final double lat;
  final double lng;

  Store({required this.id, required this.imgUrl, required this.shopName, this.lat=0.0, this.lng=0.0});
}