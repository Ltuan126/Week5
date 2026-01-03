import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Column vs Lazy List',
      theme: ThemeData(useMaterial3: true),
      home: const ChooseListTypeScreen(),
    );
  }
}

class ChooseListTypeScreen extends StatelessWidget {
  const ChooseListTypeScreen({super.key});

  static const int totalItems = 1000000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose List Type')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ListScreen(
                          mode: ListMode.column,
                          total: totalItems,
                        ),
                      ),
                    );
                  },
                  child: const Text('Column (1,000,000 items)'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ListScreen(
                          mode: ListMode.lazy,
                          total: totalItems,
                        ),
                      ),
                    );
                  },
                  child: const Text('Lazy (ListView.builder) (1,000,000 items)'),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Gợi ý: Column sẽ build ALL items (dễ lag/crash).\n'
                'ListView.builder chỉ build items đang hiển thị (mượt).',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum ListMode { column, lazy }

class ListScreen extends StatelessWidget {
  const ListScreen({
    super.key,
    required this.mode,
    required this.total,
  });

  final ListMode mode;
  final int total;

  String _randomSubtitle(int seed) {
    final r = Random(seed);
    const words = [
      'The only way to do great work',
      'is to love what you do.',
      'Stay focused.',
      'Keep going.',
      'Small steps every day.',
      'Consistency wins.',
    ];
    return '${words[r.nextInt(words.length)]} ${words[r.nextInt(words.length)]}';
  }

  @override
  Widget build(BuildContext context) {
    final title = mode == ListMode.column ? 'Column' : 'Lazy List';
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: mode == ListMode.column
          // ❌ Column: build hết 1,000,000 widgets -> lag/crash (để test)
          ? SingleChildScrollView(
              child: Column(
                children: List.generate(total, (i) {
                  return ItemCard(
                    index: i + 1,
                    subtitle: _randomSubtitle(i),
                  );
                }),
              ),
            )
          // ✅ Lazy: build theo nhu cầu
          : ListView.builder(
              itemCount: total,
              itemBuilder: (context, i) {
                return ItemCard(
                  index: i + 1,
                  subtitle: _randomSubtitle(i),
                );
              },
            ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.index,
    required this.subtitle,
  });

  final int index;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
      child: Card(
        elevation: 0.5,
        child: ListTile(
          leading: Text(
            '$index',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          title: Text(
            subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
