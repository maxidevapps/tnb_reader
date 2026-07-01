import 'package:flutter/material.dart';

import 'models/page_model.dart';
import 'services/reader_controller.dart';
import 'widgets/page_spread.dart';

class ReaderScreen extends StatefulWidget {
  const ReaderScreen({super.key});

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  final ReaderController controller = ReaderController();

  final List<PageModel> pages = List.generate(
    40,
    (index) => PageModel(
      pageNumber: index + 1,
      imagePath: '',
    ),
  );

  @override
  void initState() {
    super.initState();
    controller.addListener(_refresh);
  }

  @override
  void dispose() {
    controller.removeListener(_refresh);
    controller.dispose();
    super.dispose();
  }

  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final page = pages[controller.currentPage - 1];

    return Scaffold(
      appBar: AppBar(
        title: const Text('TNB Reader'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity == null) return;

          if (details.primaryVelocity! < 0) {
            controller.nextPage(pages.length);
          } else if (details.primaryVelocity! > 0) {
            controller.previousPage();
          }
        },
        child: Column(
          children: [
            Expanded(
              child: PageSpread(
                currentPage: page,
                nextPage: controller.currentPage < pages.length
                    ? pages[controller.currentPage]
                    : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: controller.currentPage == 1
                        ? null
                        : controller.previousPage,
                    child: const Text('Previous'),
                  ),
                  const Spacer(),
                  Text(
                    '${controller.currentPage} / ${pages.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: controller.currentPage == pages.length
                        ? null
                        : () => controller.nextPage(pages.length),
                    child: const Text('Next'),
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