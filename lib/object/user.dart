class User {
  final int id;
  final String name;
  final int point;
  final String email;

  User({required this.id, required this.name, required this.point, required this.email});
}
var userInfo = User(id: 0, name: 'DeliTo', point: 5000, email: 'test@test.ac.kr');