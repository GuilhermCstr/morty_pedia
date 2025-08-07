import 'package:flutter/material.dart';

import '../../models/character_model.dart';
import '../../services/character_service.dart';
import '../detail/detail_view.dart';
import '../detail/detail_viewmodel.dart';

class HomeViewModel extends ChangeNotifier {
  final CharacterService service;
  List<CharacterModel> characters = [];
  bool isLoading = true;
  int _currentPage = 1;
  int _totalPages = 1;

  HomeViewModel(this.service) {
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    if (_currentPage > _totalPages) return;
    isLoading = true;
    notifyListeners();
    final page = await service.fetchCharacters(page: _currentPage);
    characters.addAll(page.characters);
    _totalPages = page.totalPages;
    _currentPage++;
    isLoading = false;
    notifyListeners();
  }

  void onCharacterSelected(BuildContext context, CharacterModel character) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailView(viewModel: DetailViewModel(character))),
    );
  }

  bool get hasMore => _currentPage <= _totalPages && !isLoading;
}
