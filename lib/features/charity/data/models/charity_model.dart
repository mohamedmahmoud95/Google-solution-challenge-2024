class CharityModel {
  String name;
  String imageUrl;
  String description;
  String organizationName;
  List<String> listImagesUrl;
  double fund;
  double funCollected;
  int dayLeft;

  CharityModel({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.listImagesUrl,
    required this.fund,
    required this.organizationName,
    required this.funCollected,
    required this.dayLeft,
  });

  factory CharityModel.fromJson(Map<String, dynamic> json) {
    return CharityModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      listImagesUrl: List<String>.from(json['listImagesUrl']),
      fund: json['fund'],
      organizationName: json['organizationName'],
      funCollected: json['funCollected'],
      dayLeft: json['dayLeft'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['description'] = description;
    data['listImagesUrl'] = listImagesUrl;
    data['fund'] = fund;
    data['funCollected'] = funCollected;
    data['organizationName'] = organizationName;
    data['dayLeft'] = dayLeft;
    return data;
  }
}
