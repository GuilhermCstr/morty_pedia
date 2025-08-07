import 'package:flutter/material.dart';

import '../../widgets/item_tile.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  final HomeViewModel viewModel;
  const HomeView({super.key, required this.viewModel});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      widget.viewModel.fetchCharacters();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Personagens')),
      body: AnimatedBuilder(
        animation: widget.viewModel,
        builder: (context, _) {
          if (widget.viewModel.isLoading && widget.viewModel.characters.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            controller: _scrollController,
            itemCount: widget.viewModel.characters.length + (widget.viewModel.hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == widget.viewModel.characters.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              final character = widget.viewModel.characters[index];
              return ItemTile(
                item: character,
                onTap: () => widget.viewModel.onCharacterSelected(context, character),
              );
            },
          );
        },
      ),
    );
  }
}
