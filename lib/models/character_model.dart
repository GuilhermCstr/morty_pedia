class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String image;
  final String origin;
  final String gender;

  const CharacterModel({
    required this.id,
    this.name = '',
    this.status = '',
    this.species = '',
    this.image = '',
    this.origin = '',
    this.gender = '',
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      image: json['image'],
      origin: json['origin']?['name'],
      gender: json['gender'],
    );
  }
}
