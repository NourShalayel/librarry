class Categories{
  String? id ;
  String? name ;

  Categories({this.id , this.name});

  toJson() {
    Map<String, dynamic> data = Map();
    data['id'] = id;
    data['name'] = name;

    return data;
  }

  Categories.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
  }
}