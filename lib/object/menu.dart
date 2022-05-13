class Menu {
  final String name;
  final int price;
  final String imgUrl;
  
  Menu({required this.name, required this.price, this.imgUrl=''});
}

var testMenuList = [
  Menu(name: '쌀국수', price: 8500, imgUrl: "https://images.yogiyo.co.kr/image/yogiyo/STOCK_IMG/%EA%B8%B0%ED%83%80%EC%99%B8%EA%B5%AD%EC%9D%8C%EC%8B%9D/%EB%A9%B4%EB%A5%98/%EC%8A%A4%ED%83%81_20190718_DHK%EC%B4%AC%EC%98%81_%EC%8C%80%EA%B5%AD%EC%88%98_Side_01_1080x640.jpg?width=384&height=273&quality=100"),
  Menu(name: '나시고랭 볶음밥', price: 8500, imgUrl: "https://images.yogiyo.co.kr/image/yogiyo/STOCK_IMG/%EA%B8%B0%ED%83%80%EC%99%B8%EA%B5%AD%EC%9D%8C%EC%8B%9D/%EB%B0%A5%EB%A5%98/%EC%8A%A4%ED%83%81_20190904_DHK%EC%B4%AC%EC%98%81_%EB%82%98%EC%8B%9C%EA%B3%A0%EB%9E%AD_Side01_1080x640.jpg?width=384&height=273&quality=100"),
  Menu(name: '짬뽕 칼국수', price: 8500, imgUrl: "https://images.yogiyo.co.kr/image/yogiyo/STOCK_IMG/%EA%B8%B0%ED%83%80%EC%99%B8%EA%B5%AD%EC%9D%8C%EC%8B%9D/%EB%A9%B4%EB%A5%98/%EC%8A%A4%ED%83%81_20190904_DHK%EC%B4%AC%EC%98%81_%EB%A7%A4%EC%9A%B4%ED%95%B4%EB%AC%BC%EC%8C%80%EA%B5%AD%EC%88%98_Side01_1080x640.jpg?width=384&height=273&quality=100"),
  Menu(name: '퐁커리덮밥', price: 12000, imgUrl: "https://images.yogiyo.co.kr/image/yogiyo/STOCK_IMG/%EA%B8%B0%ED%83%80%EC%99%B8%EA%B5%AD%EC%9D%8C%EC%8B%9D/%EC%9A%94%EB%A6%AC/%EC%8A%A4%ED%83%81_20191002_DHK%EC%B4%AC%EC%98%81_%ED%91%B8%ED%8C%9F%ED%90%81%EC%BB%A4%EB%A6%AC_Side02_1080x640.jpg?width=384&height=273&quality=100"),
  Menu(name: '사태수육', price: 25000, imgUrl: "https://images.yogiyo.co.kr/image/yogiyo/STOCK_IMG/%EC%A1%B1%EB%B0%9C%EB%B3%B4%EC%8C%88/%EB%B3%B4%EC%8C%88/%EC%8A%A4%ED%83%81_20210727_DHK%EC%99%B8%EB%B6%80_%EB%B3%B4%EC%8C%88_Side01_1080x640_ROUK16.jpg?width=384&height=273&quality=100"),
  Menu(name: '치킨봉', price: 4000, imgUrl: "https://images.yogiyo.co.kr/image/yogiyo/STOCK_IMG/%EC%B9%98%ED%82%A8/%EB%B0%94%EB%B2%A0%ED%81%90/%EC%8A%A4%ED%83%81_20210914_DHK%EB%82%B4%EB%B6%80_%EB%B2%84%ED%8C%94%EB%A1%9C%EB%B4%89_Side01_1080x640_JJOS64.jpg?width=384&height=273&quality=100"),
];