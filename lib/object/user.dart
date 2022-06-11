class User {
  final int id;
  final String name;
  final int point;
  final String email;
  final int manner;

  User({required this.id, required this.name, required this.point, required this.email, this.manner=0});
}
var userInfo = User(id: 0, name: 'DeliTo', point: 5000, email: 'test@test.ac.kr');