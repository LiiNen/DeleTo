class Comment {
  final int userId;
  final String userName;
  final String imgSrc;
  final String content;
  final String time;

  Comment({required this.userId, required this.userName, required this.imgSrc, required this.content, required String this.time});
}

var testCommentList = [
  Comment(userId: 0, userName: '곽태우', imgSrc: '', content: '저 먹을래요', time: '4/3 23:03'),
  Comment(userId: 0, userName: '김정훈', imgSrc: '', content: '저도 먹을래요', time: '4/3 23:04'),
  Comment(userId: 0, userName: '민경현', imgSrc: '', content: '저도저도 먹을래요', time: '4/3 23:05'),
  Comment(userId: 0, userName: '이진기', imgSrc: '', content: '자리다찼나요', time: '4/3 23:07'),
  Comment(userId: 0, userName: '주하영', imgSrc: '', content: '자리다찼나요22222222222222', time: '4/3 23:08'),
  Comment(userId: 0, userName: '딜리투', imgSrc: '', content: 'Column 오버플로우 테스트', time: '4/3 23:09'),
  Comment(userId: 0, userName: '딜리투', imgSrc: '', content: '긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 긴글 테스트 ', time: '4/3 23:10'),
];