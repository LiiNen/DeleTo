class User {
  final int id;
  final String name;
  final int point;

  User({required this.id, required this.name, required this.point});
}
var userInfo = User(id: 1, name: 'DeliTo', point: 5000);
var testUserList = [
  User(id: 1, name: 'DeliTo', point: 1000),
  User(id: 2, name: '곽태우', point: 2000),
  User(id: 3, name: '김정훈', point: 3000),
  User(id: 4, name: '민경현', point: 4000),
  User(id: 5, name: '이진기', point: 5000),
  User(id: 6, name: '주하영', point: 6000),
];