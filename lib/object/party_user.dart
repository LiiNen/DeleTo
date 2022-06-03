import 'package:delito/object/user.dart';

class PartyUser extends User {
  final int partyId;
  final String content;
  final bool isChecked;

  PartyUser({
    required int id, imgUrl='', required String name, required this.content, required this.isChecked, required int point, required this.partyId,
  }) : super(id: id, name: name, email: '', imgUrl: imgUrl, point: point);
}