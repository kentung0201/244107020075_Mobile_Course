import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/stats_provider.dart';

// ConsumerWidget memungkinkan halaman mengakses Riverpod.
class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Memantau perubahan state dari statsProvider.
    final statsAsync = ref.watch(statsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),

      // Menangani tiga kemungkinan kondisi AsyncValue.
      body: statsAsync.when(
        // Kondisi pertama: data sedang dimuat.
        loading: () => const Center(child: CircularProgressIndicator()),

        // Kondisi kedua: terjadi kesalahan.
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),

                const SizedBox(height: 16),

                Text(
                  'Failed to load statistics:\n$error',
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                // Mengulang proses pengambilan data.
                FilledButton(
                  onPressed: () {
                    ref.invalidate(statsProvider);
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),

        // Kondisi ketiga: data berhasil diperoleh.
        data: (stats) => ListView.builder(
          itemCount: stats.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.analytics_outlined),
                title: Text(stats[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
