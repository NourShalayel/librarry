class Authors {
  String? id;

  String? name;

  Authors({this.id, this.name});

  toJson() {
    Map<String, dynamic> data = Map();
    data['id'] = id;
    data['name'] = name;

    return data;
  }

  Authors.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
  }
}
