import 'package:flutter/material.dart';
import 'package:morty_pedia/theme/rick_and_morty_theme.dart';

import 'services/character_service.dart';
import 'views/home/home_view.dart';
import 'views/home/home_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = HomeViewModel(CharacterService());
    return MaterialApp(
      title: 'Morty Pedia',
      debugShowCheckedModeBanner: false,
      theme: rickAndMortyTheme,
      home: HomeView(viewModel: homeViewModel),
    );
  }
}
