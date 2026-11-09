import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  final String title;
  final String location;
  final int starCount;
  final bool isFavorited;
  final VoidCallback onFavoriteToggle;

  const TitleSectionWidget({
    super.key,
    required this.title,
    required this.location,
    required this.starCount,
    required this.isFavorited,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 8),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          IconButton(
            icon: Icon(isFavorited ? Icons.star : Icons.star_border),
            color: Colors.red[500],
            onPressed: onFavoriteToggle,
          ),
          Text('$starCount'),
        ],
      ),
    );
  }
}