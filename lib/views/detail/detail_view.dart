import 'package:flutter/material.dart';

import '../../widgets/info_row.dart';
import 'detail_viewmodel.dart';

class DetailView extends StatelessWidget {
  final DetailViewModel viewModel;

  const DetailView({super.key, required this.viewModel});

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
                        color: const Color(0xFF424242),
                        child: const Icon(Icons.person, size: 100, color: Color(0xFF8A8A8A)),
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

                  InfoRow(label: 'Espécie', value: item.species),
                  const SizedBox(height: 16),

                  InfoRow(label: 'Origin:', value: item.origin),
                  const SizedBox(height: 16),

                  InfoRow(label: 'Gender:', value: item.gender),
                  const SizedBox(height: 16),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 8),
                      decoration: BoxDecoration(
                        color: viewModel.getStatusColor(item.status),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        (item.status).toUpperCase(),
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
}
