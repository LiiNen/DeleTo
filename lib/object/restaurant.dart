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

var testRestList = [
  Restaurant(
    id: 1, shopName: '쌀국수먹자-본점', deliveryPrice: 2000, leastPrice: 10000, menuList: testMenuList,
    phone: '050352901572', address: '경기도 수원시 팔달구 지동 138-6 진우빌라트 1층 105호',
    imgUrl: 'https://rev-static.yogiyo.co.kr/restaurant_logos/업체자체_20201102_468209_쌀국수먹자-본점_대표사진_300x300.jpg',
    openTime: "00:00", closeTime: "23:59", reviewAverage: 4.8,
  ),
  Restaurant(id: 2, shopName: '피자헛-수원지동점', openTime: '17:00', closeTime: '02:00', imgUrl: 'https://rev-static.yogiyo.co.kr/franchise_logos/피자헛_20170612_Franchise이미지약정서_crop_200x200.jpg'),
  Restaurant(id: 3, shopName: '신전떡볶이 아주대점',),
  Restaurant(id: 4, shopName: '맘스터치 광교점',),
  Restaurant(id: 5, shopName: '맥도날드 아주대점',),
];
