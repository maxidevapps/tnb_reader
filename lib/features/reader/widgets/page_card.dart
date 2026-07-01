import 'package:flutter/material.dart';

class PageCard extends StatelessWidget {
  final int pageNumber;

  const PageCard({
    super.key,
    required this.pageNumber,
  });

  @override
  Widget build(BuildContext context) {
    final imagePath =
        'assets/magazines/demo/page_${pageNumber.toString().padLeft(3, '0')}.jpeg';

    return Card(
      elevation: 6,
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.shade300,
            alignment: Alignment.center,
            child: Text(
              'Missing Page $pageNumber',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}