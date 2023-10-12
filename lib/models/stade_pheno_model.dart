// Table name: stadepheno
class StadePheno {
  late String id;
  late String name;
  late String summary;
  late String description;
  late String imageUrl;

  Map toJson() => {
    'id_stade': id,
    'nom': name,
    'resume': summary,
    'descriptif': description,
    'url_image': imageUrl,
  };
}
