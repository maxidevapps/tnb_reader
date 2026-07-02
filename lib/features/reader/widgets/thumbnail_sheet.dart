import 'package:flutter/material.dart';

import 'thumbnail_grid.dart';

class ThumbnailSheet extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  final Function(int page) onPageSelected;

  const ThumbnailSheet({
    super.key,
    required this.totalPages,
    required this.currentPage,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.70,
        child: Column(
          children: [
            const SizedBox(height: 12),

            Container(
              width: 60,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Jump to Page',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ThumbnailGrid(
                totalPages: totalPages,
                currentPage: currentPage,
                onPageSelected: (page) {
                  Navigator.pop(context);
                  onPageSelected(page);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}