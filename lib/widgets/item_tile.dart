import 'package:flutter/material.dart';

import '../models/character_model.dart';

class ItemTile extends StatelessWidget {
  final CharacterModel item;
  final VoidCallback onTap;

  const ItemTile({super.key, required this.item, required this.onTap});

  Color _getStatusColor(String? status) {
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

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Hero(
                tag: 'character_image_${item.name}_${item.id}',
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(85),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      item.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: const Color(0xFF424242),
                          child: const Icon(Icons.person, color: Color(0xFF8A8A8A)),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'character_name_${item.name}_${item.id}',
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          item.name,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: _getStatusColor(item.status),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        (item.status).toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.species,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: const Color(0xFFB3B3B3)),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Color(0xFF8A8A8A), size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
