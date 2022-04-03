class User {
  final int id;
  final String name;
  final int point;
  final String imgSrc;

  User({required this.id, required this.name, required this.point, required this.imgSrc});
}
var userInfo = User(id: 1, name: 'DeliTo', point: 5000, imgSrc: '');
var testUserList = [
  User(id: 1, name: 'DeliTo', point: 1000, imgSrc: ''),
  User(id: 2, name: '곽태우', point: 2000, imgSrc: ''),
  User(id: 3, name: '김정훈', point: 3000, imgSrc: ''),
  User(id: 4, name: '민경현', point: 4000, imgSrc: ''),
  User(id: 5, name: '이진기', point: 5000, imgSrc: ''),
  User(id: 6, name: '주하영', point: 6000, imgSrc: ''),
];