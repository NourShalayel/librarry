class Books {
  String? id;

  String? name;

  String? img;

  int? num_page;

  int? pub_year;

  String? category_name;

  String? auth_name;

  String? language;

  double? price;

  Books({
    this.id,
    this.name,
    this.img,
    this.num_page,
    this.pub_year,
    this.category_name,
    this.auth_name,
    this.language,
    this.price,
  });

  toJson() {
    Map<String, dynamic> data = Map();
    data['id'] = id;
    data['name'] = name;
    data['img'] = img;
    data['num_page'] = num_page;
    data['pub_year'] = pub_year;
    data['category_name'] = category_name;
    data['auth_name'] = auth_name;
    data['language'] = language;
    data['price'] = price;
    return data;
  }

  Books.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    img = data['img'];
    num_page = data['num_page'];
    pub_year = data['pub_year'];
    category_name = data['category_name'];
    auth_name = data['auth_name'];
    language = data['language'];
    price = data['price'];
  }
}
