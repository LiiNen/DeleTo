class Point {
  final int userId;
  final int amount;
  final int left;
  final bool isCharge;
  final String time;
  final String title;

  Point({required this.userId, required this.left, required this.amount, this.isCharge=true, required this.time, required this.title});
}