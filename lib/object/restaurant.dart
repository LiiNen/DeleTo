import 'package:delito/object/menu.dart';
import 'package:delito/object/store.dart';

class Restaurant extends Store{
  final int deliveryPrice;
  final int leastPrice;
  final String openTime;
  final String closeTime;
  final String phone;
  final String address;
  final double reviewAverage;
  final String deliveryTime;
  final List<Menu> menuList;
  final String categories;

  Restaurant({
    required id, imgUrl='', required shopName,
    this.deliveryPrice=0, this.leastPrice=0,
    this.openTime='09:00', this.closeTime='23:00',
    this.phone='', this.address='',
    this.reviewAverage=5.0,
    this.deliveryTime='35~45분',
    this.menuList=const [],
    this.categories='아시안, 테이크아웃, 피자양식, 한식, 야식',
    lat=0.0, lng=0.0
  }) : super(id: id, imgUrl: imgUrl, shopName: shopName, lat: lat, lng: lng);
}