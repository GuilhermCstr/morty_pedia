import 'package:flutter/material.dart';

import '../../models/character_model.dart';

class DetailViewModel {
  final CharacterModel item;

  DetailViewModel(this.item);

  Color getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'alive':
        return const Color(0xFF4CAF50);
      case 'dead':
        return const Color(0xFFF44336);
      case 'unknown':
        return const Color(0xFFFF9800);
      default:
        return const Color(0xFF9E9E9E);
    }
  }
}
