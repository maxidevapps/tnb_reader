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
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      child: InteractiveViewer(
        minScale: 1.0,
        maxScale: 5.0,
        panEnabled: true,
        scaleEnabled: true,
        boundaryMargin: const EdgeInsets.all(100),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
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
      ),
    );
  }
}