import 'character_model.dart';

class CharacterPageModel {
  final List<CharacterModel> characters;
  final int currentPage;
  final int totalPages;

  CharacterPageModel({
    required this.characters,
    required this.totalPages,
    required this.currentPage,
  });
}
