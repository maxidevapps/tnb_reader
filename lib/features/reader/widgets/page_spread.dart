import 'package:flutter/material.dart';

import '../models/page_model.dart';
import 'page_card.dart';

class PageSpread extends StatelessWidget {
  final PageModel currentPage;
  final PageModel? nextPage;

  const PageSpread({
    super.key,
    required this.currentPage,
    this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 700;

    // Cover page
    if (currentPage.pageNumber == 1) {
      return Center(
        child: SizedBox(
          width: 360,
          height: 520,
          child: PageCard(
            pageNumber: currentPage.pageNumber,
          ),
        ),
      );
    }

    // Phone layout
    if (!isWide) {
      return Center(
        child: SizedBox(
          width: 360,
          height: 520,
          child: PageCard(
            pageNumber: currentPage.pageNumber,
          ),
        ),
      );
    }

    // Tablet/Desktop layout
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 340,
            height: 520,
            child: PageCard(
              pageNumber: currentPage.pageNumber,
            ),
          ),

          const SizedBox(width: 2),

          SizedBox(
            width: 340,
            height: 520,
            child: nextPage == null
                ? const SizedBox()
                : PageCard(
                    pageNumber: nextPage!.pageNumber,
                  ),
          ),
        ],
      ),
    );
  }
}