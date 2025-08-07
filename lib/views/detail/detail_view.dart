import 'package:flutter/material.dart';

import 'detail_viewmodel.dart';

class DetailView extends StatelessWidget {
  final DetailViewModel viewModel;

  const DetailView({super.key, required this.viewModel});

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return Colors.green;
      case 'dead':
        return Colors.red;
      case 'unknown':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = viewModel.item;
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: 'character_name_${item.name}_${item.id}',
          child: Material(
            color: Colors.transparent,
            child: Text(
              item.name,
              style: Theme.of(context).textTheme.headlineMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'character_image_${item.name}_${item.id}',
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(100),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    item.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[800],
                        child: const Icon(Icons.person, size: 100, color: Colors.white54),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  _buildInfoRow('Espécie', item.species),
                  const SizedBox(height: 16),

                  _buildInfoRow('Origin:', item.origin),
                  const SizedBox(height: 16),

                  _buildInfoRow('Gender:', item.gender),
                  const SizedBox(height: 16),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 8),
                      decoration: BoxDecoration(
                        color: _getStatusColor(item.status),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        item.status.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
