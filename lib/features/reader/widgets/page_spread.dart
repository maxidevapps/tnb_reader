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

    if (!isWide) {
      return Center(
        child: SizedBox(
          width: 350,
          height: 500,
          child: PageCard(
            pageNumber: currentPage.pageNumber,
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 320,
          height: 500,
          child: PageCard(
            pageNumber: currentPage.pageNumber,
          ),
        ),

        const SizedBox(width: 2),

        SizedBox(
          width: 340,
          height: 500,
          child: nextPage == null
              ? const SizedBox()
              : PageCard(
                  pageNumber: nextPage!.pageNumber,
                ),
        ),
      ],
    );
  }
}