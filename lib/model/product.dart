// ignore_for_file: prefer_collection_literals

class Product {
  int? id;
  String? title;
  String? image;
  String? manufacturer;
  String? founded;
  int? age;
  String? origin;
  String? countryLogo;
  int? grade;
  String? alcoolPercents;
  String? owner;
  String? ownerImage;
  String? published;

  Product(
      {id,
      title,
      image,
      manufacturer,
      founded,
      age,
      origin,
      countryLogo,
      grade,
      alcoolPercents,
      owner,
      ownerImage,
      published});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    manufacturer = json['manufacturer'];
    founded = json['founded'];
    age = json['age'];
    origin = json['origin'];
    countryLogo = json['countryLogo'];
    grade = json['grade'];
    alcoolPercents = json['alcoolPercents'];
    owner = json['owner'];
    ownerImage = json['ownerImage'];
    published = json['published'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['manufacturer'] = manufacturer;
    data['founded'] = founded;
    data['age'] = age;
    data['origin'] = origin;
    data['countryLogo'] = countryLogo;
    data['grade'] = grade;
    data['alcoolPercents'] = alcoolPercents;
    data['owner'] = owner;
    data['ownerImage'] = ownerImage;
    data['published'] = published;
    return data;
  }
}
