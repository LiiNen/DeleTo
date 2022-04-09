class Shop {
  final int id;
  final int userId;
  final String imgSrc;
  final String title;
  final String content;
  final String name;
  final int curNum;
  final int maxNum;
  final int deliveryPrice;
  final int leastPrice;
  final bool open;
  final String time;
  final String userName;

  Shop({required this.id, this.userId=0, this.imgSrc='', required this.title, this.content='', required this.name, required this.curNum, required this.maxNum, this.deliveryPrice=0, this.leastPrice=0, this.open=true, this.time='4/3 23:00', this.userName='딜리투계정'});
}

var testShopList = [
  Shop(id: 1, title: '치킨먹을 사람?', name: '아주대학교 KFC', curNum: 3, maxNum: 6, content: '5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ', deliveryPrice: 5000, leastPrice: 12000),
  Shop(id: 2, title: '배달비 아낄사람', name: '피자브라더스 인계본점', curNum: 4, maxNum: 5, open: false),
  Shop(id: 3, title: '광교관 여학생 있음?', name: '신전떡볶이 아주대점', curNum: 4, maxNum: 4),
  Shop(id: 4, title: '본인 팔달관 망령', name: '맘스터치 광교점', curNum: 3, maxNum: 4),
  Shop(id: 5, title: '남제 1명 구함', name: '맥도날드 아주대점', curNum: 1, maxNum: 2),
];
