import 'package:flutter/material.dart';

void main() {
  runApp(const TNBReaderApp());
}

class TNBReaderApp extends StatelessWidget {
  const TNBReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TNB Reader',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.red,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const ReaderHomePage(),
    );
  }
}

class ReaderHomePage extends StatelessWidget {
  const ReaderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width >= 768;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TNB Reader',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: isTablet ? 1200 : 600,
          ),
          padding: const EdgeInsets.all(24),
          child: Card(
            elevation: 6,
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: const Center(
                            child: Text(
                              'LEFT PAGE',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                      if (isTablet)
                        Container(
                          width: 2,
                          color: Colors.black12,
                        ),

                      if (isTablet)
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: const Center(
                              child: Text(
                                'RIGHT PAGE',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                Container(
                  height: 60,
                  color: Colors.black87,
                  alignment: Alignment.center,
                  child: const Text(
                    'Page 1 of 40',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}