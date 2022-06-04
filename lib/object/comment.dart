class Comment {
  final int userId;
  final String userName;
  final String imgUrl;
  final String content;
  final String time;
  final int boardId;

  Comment({required this.userId, required this.userName, required this.imgUrl, required this.content, required this.time, this.boardId = 0});
}