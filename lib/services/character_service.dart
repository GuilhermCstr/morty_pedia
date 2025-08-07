import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/character_model.dart';
import '../models/character_page_model.dart';

class CharacterService {
  Future<CharacterPageModel> fetchCharacters({int page = 1}) async {
    final response = await http.get(
      Uri.parse('https://rickandmortyapi.com/api/character/?page=$page'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final List results = data['results'];
      final info = data['info'];
      return CharacterPageModel(
        characters: results
            .map(
              (json) => CharacterModel(
                id: json['id'],
                name: json['name'] ?? '',
                status: json['status'] ?? '',
                species: json['species'] ?? '',
                image: json['image'] ?? '',
                origin: json['origin']['name'] ?? '',
                gender: json['gender'] ?? 'Sem gênero',
              ),
            )
            .toList(),
        totalPages: info['pages'] ?? 1,
        currentPage: page,
      );
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
