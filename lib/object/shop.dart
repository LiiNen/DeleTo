import 'package:delito/object/menu.dart';
import 'package:delito/object/store.dart';

class Shop extends Store{
  final int deliveryPrice;
  final int leastPrice;
  final String openTime;
  final String closeTime;
  final String phone;
  final String address;
  final double reviewAverage;
  final String deliveryTime;
  final List<Menu> menuList;

  Shop({
    required id, imgSrc='', required shopName,
    this.deliveryPrice=0, this.leastPrice=0,
    this.openTime='09:00', this.closeTime='23:00',
    this.phone='', this.address='',
    this.reviewAverage=5.0,
    this.deliveryTime='35~45분',
    this.menuList=const [],
  }) : super(id: id, imgSrc: imgSrc, shopName: shopName);
}

var testShopList = [
  Shop(
    id: 1, shopName: '쌀국수먹자-본점', deliveryPrice: 2000, leastPrice: 10000, menuList: testMenuList,
    phone: '050352901572', address: '경기도 수원시 팔달구 지동 138-6 진우빌라트 1층 105호',
    imgSrc: 'https://rev-static.yogiyo.co.kr/restaurant_logos/업체자체_20201102_468209_쌀국수먹자-본점_대표사진_300x300.jpg',
    openTime: "00:00", closeTime: "23:59", reviewAverage: 4.8,
  ),
  Shop(id: 2, shopName: '피자브라더스 인계본점', openTime: '17:00', closeTime: '02:00'),
  Shop(id: 3, shopName: '신전떡볶이 아주대점',),
  Shop(id: 4, shopName: '맘스터치 광교점',),
  Shop(id: 5, shopName: '맥도날드 아주대점',),
];
