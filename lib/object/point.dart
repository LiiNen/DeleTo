class Point {
  final int userId;
  final int amount;
  final int left;
  final bool isCharge;
  final String time;
  final String title;

  Point({required this.userId, required this.left, required this.amount, this.isCharge=true, required this.time, required this.title});
}

var testPointList = [
  Point(userId: 1, amount: 2500, left: 5000, time: '2022.03.17', title: '알촌 약매 양많이', isCharge: false),
  Point(userId: 1, amount: 1500, left: 7500, time: '2022.03.12', title: 'BBQ 황금올리브 먹을 사람 구해요', isCharge: false),
  Point(userId: 1, amount: 6000, left: 9000, time: '2022.03.10', title: '무통장 입금'),
  Point(userId: 1, amount: 3000, left: 3000, time: '2022.03.08', title: '무통장 입금'),
  Point(userId: 1, amount: 2500, left: 5000, time: '2022.03.17', title: '알촌 약매 양많이', isCharge: false),
  Point(userId: 1, amount: 1500, left: 7500, time: '2022.03.12', title: 'BBQ 황금올리브 먹을 사람 구해요', isCharge: false),
  Point(userId: 1, amount: 6000, left: 9000, time: '2022.03.10', title: '무통장 입금'),
  Point(userId: 1, amount: 3000, left: 3000, time: '2022.03.08', title: '무통장 입금'),
  Point(userId: 1, amount: 2500, left: 5000, time: '2022.03.17', title: '알촌 약매 양많이', isCharge: false),
  Point(userId: 1, amount: 1500, left: 7500, time: '2022.03.12', title: 'BBQ 황금올리브 먹을 사람 구해요', isCharge: false),
  Point(userId: 1, amount: 6000, left: 9000, time: '2022.03.10', title: '무통장 입금'),
  Point(userId: 1, amount: 3000, left: 3000, time: '2022.03.08', title: '무통장 입금'),
  Point(userId: 1, amount: 2500, left: 5000, time: '2022.03.17', title: '알촌 약매 양많이', isCharge: false),
  Point(userId: 1, amount: 1500, left: 7500, time: '2022.03.12', title: 'BBQ 황금올리브 먹을 사람 구해요', isCharge: false),
  Point(userId: 1, amount: 6000, left: 9000, time: '2022.03.10', title: '무통장 입금'),
  Point(userId: 1, amount: 3000, left: 3000, time: '2022.03.08', title: '무통장 입금'),
];