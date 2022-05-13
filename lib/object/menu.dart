class Menu {
  final String name;
  final int price;
  final String imgUrl;
  
  Menu({required this.name, required this.price, this.imgUrl=''});
}

var testMenuList = [
  Menu(name: '쌀국수', price: 8500, imgUrl: "https://images.yogiyo.co.kr/image/yogiyo/STOCK_IMG/%EA%B8%B0%ED%83%80%EC%99%B8%EA%B5%AD%EC%9D%8C%EC%8B%9D/%EB%A9%B4%EB%A5%98/%EC%8A%A4%ED%83%81_20190718_DHK%EC%B4%AC%EC%98%81_%EC%8C%80%EA%B5%AD%EC%88%98_Side_01_1080x640.jpg?width=384&height=273&quality=100"),
  Menu(name: '나시고랭 볶음밥', price: 8500, imgUrl: "https://images.yogiyo.co.kr/image/yogiyo/STOCK_IMG/%EA%B8%B0%ED%83%80%EC%99%B8%EA%B5%AD%EC%9D%8C%EC%8B%9D/%EB%B0%A5%EB%A5%98/%EC%8A%A4%ED%83%81_20190904_DHK%EC%B4%AC%EC%98%81_%EB%82%98%EC%8B%9C%EA%B3%A0%EB%9E%AD_Side01_1080x640.jpg?width=384&height=273&quality=100"),
  Menu(name: '쌀국수', price: 8500, imgUrl: "https://images.yogiyo.co.kr/image/yogiyo/STOCK_IMG/%EA%B8%B0%ED%83%80%EC%99%B8%EA%B5%AD%EC%9D%8C%EC%8B%9D/%EB%A9%B4%EB%A5%98/%EC%8A%A4%ED%83%81_20190718_DHK%EC%B4%AC%EC%98%81_%EC%8C%80%EA%B5%AD%EC%88%98_Side_01_1080x640.jpg?width=384&height=273&quality=100"),
  Menu(name: '나시고랭 볶음밥', price: 8500, imgUrl: "https://images.yogiyo.co.kr/image/yogiyo/STOCK_IMG/%EA%B8%B0%ED%83%80%EC%99%B8%EA%B5%AD%EC%9D%8C%EC%8B%9D/%EB%B0%A5%EB%A5%98/%EC%8A%A4%ED%83%81_20190904_DHK%EC%B4%AC%EC%98%81_%EB%82%98%EC%8B%9C%EA%B3%A0%EB%9E%AD_Side01_1080x640.jpg?width=384&height=273&quality=100"),
  Menu(name: '쌀국수', price: 8500, imgUrl: "https://images.yogiyo.co.kr/image/yogiyo/STOCK_IMG/%EA%B8%B0%ED%83%80%EC%99%B8%EA%B5%AD%EC%9D%8C%EC%8B%9D/%EB%A9%B4%EB%A5%98/%EC%8A%A4%ED%83%81_20190718_DHK%EC%B4%AC%EC%98%81_%EC%8C%80%EA%B5%AD%EC%88%98_Side_01_1080x640.jpg?width=384&height=273&quality=100"),
  Menu(name: '나시고랭 볶음밥', price: 8500, imgUrl: "https://images.yogiyo.co.kr/image/yogiyo/STOCK_IMG/%EA%B8%B0%ED%83%80%EC%99%B8%EA%B5%AD%EC%9D%8C%EC%8B%9D/%EB%B0%A5%EB%A5%98/%EC%8A%A4%ED%83%81_20190904_DHK%EC%B4%AC%EC%98%81_%EB%82%98%EC%8B%9C%EA%B3%A0%EB%9E%AD_Side01_1080x640.jpg?width=384&height=273&quality=100"),
];