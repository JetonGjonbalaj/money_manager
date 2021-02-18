class Category {
  String id;
  String name;
  String imageTitle;
  String imageName;

  Category({this.id, this.name, this.imageTitle, this.imageName});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageTitle = json['imageTitle'];
    imageName = json['imageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageTitle'] = this.imageTitle;
    data['imageName'] = this.imageName;
    return data;
  }
}
