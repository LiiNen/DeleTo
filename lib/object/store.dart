class Store {
  final int id;
  final int userId;
  final String imgSrc;
  final String title;
  final String content;
  final String name;
  final int curNum;
  final int maxNum;
  final int price;
  final bool open;

  Store({required this.id, this.userId=0, this.imgSrc='', required this.title, this.content='', required this.name, required this.curNum, required this.maxNum, this.price=0, this.open=true});
}

var testStoreList = [
  Store(id: 1, title: '치킨먹을 사람?', name: '아주대학교 KFC', curNum: 3, maxNum: 6, content: '5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ5천원씩 상납 ㄱㄱ', price: 5000),
  Store(id: 2, title: '배달비 아낄사람', name: '피자브라더스 인계본점', curNum: 4, maxNum: 5, open: false),
  Store(id: 3, title: '광교관 여학생 있음?', name: '신전떡볶이 아주대점', curNum: 4, maxNum: 4),
  Store(id: 4, title: '본인 팔달관 망령', name: '맘스터치 광교점', curNum: 3, maxNum: 4),
  Store(id: 5, title: '남제 1명 구함', name: '맥도날드 아주대점', curNum: 1, maxNum: 2),
];