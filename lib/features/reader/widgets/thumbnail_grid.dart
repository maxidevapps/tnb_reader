import 'package:flutter/material.dart';

class ThumbnailGrid extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  final Function(int page) onPageSelected;

  const ThumbnailGrid({
    super.key,
    required this.totalPages,
    required this.currentPage,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: totalPages,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        final page = index + 1;

        final imagePath =
            'assets/magazines/demo/page_${page.toString().padLeft(3, '0')}.jpeg';

        final selected = page == currentPage;

        return GestureDetector(
          onTap: () => onPageSelected(page),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: selected ? Colors.blue : Colors.grey.shade400,
                width: selected ? 3 : 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  color: selected
                      ? Colors.blue.shade100
                      : Colors.grey.shade200,
                  child: Text(
                    'Page $page',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}