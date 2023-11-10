class StadePhenoModel {
  late String id;
  late String name;
  late String summary;
  late String description;
  late String imageUrl;

  StadePhenoModel({
    required this.id,
    required this.name,
    required this.summary,
    required this.description,
    required this.imageUrl,
  });

  factory StadePhenoModel.fromJson(Map<String, dynamic> json) {
    return StadePhenoModel(
      id: json['id_stade'],
      name: json['nom'],
      summary: json['resume'],
      description: json['descriptif'],
      imageUrl: json['url_image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id_stade': id,
    'nom': name,
    'resume': summary,
    'descriptif': description,
    'url_image': imageUrl,
  };
}
