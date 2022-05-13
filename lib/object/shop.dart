import 'package:delito/object/menu.dart';
import 'package:delito/object/store.dart';

class Shop extends Store{
  final int deliveryPrice;
  final int leastPrice;
  final String openTime;
  final String closeTime;
  final List<Menu> menuList;

  Shop({
    required id, imgSrc='', required shopName,
    this.deliveryPrice=0, this.leastPrice=0,
    this.openTime='09:00', this.closeTime='23:00',
    this.menuList=const [],
  }) : super(id: id, imgSrc: imgSrc, shopName: shopName);
}

var testShopList = [
  Shop(
    id: 1, shopName: '쌀국수먹자-본점', deliveryPrice: 2000, leastPrice: 10000, menuList: testMenuList
  ),
  Shop(id: 2, shopName: '피자브라더스 인계본점', openTime: '17:00', closeTime: '02:00'),
  Shop(id: 3, shopName: '신전떡볶이 아주대점',),
  Shop(id: 4, shopName: '맘스터치 광교점',),
  Shop(id: 5, shopName: '맥도날드 아주대점',),
];
