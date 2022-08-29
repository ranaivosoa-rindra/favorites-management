// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_collection_literals

class Product {
  late int id;
  late String title;
  late String image;
  late String manufacturer;
  late String founded;
  late int age;
  late String origin;
  late String countryLogo;
  late int grade;
  late String alcoolPercents;
  late String owner;
  late String ownerImage;
  late String published;
  late bool favorite;
  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.manufacturer,
    required this.founded,
    required this.age,
    required this.origin,
    required this.countryLogo,
    required this.grade,
    required this.alcoolPercents,
    required this.owner,
    required this.ownerImage,
    required this.published,
    required this.favorite,
  });

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
    favorite = json['favorite'];
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
    data['favorite'] = favorite;
    return data;
  }
}
