
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:week3_todo/providers/stats_provider.dart';

// Notifier khusus untuk pengujian.
// Menghindari delay dan hasil random agar test konsisten.
class TestStatsNotifier extends StatsNotifier {
  @override
  Future<List<String>> build() async {
    return [
      'Total Users: 120',
      'Active Tasks: 45',
      'Completed Tasks: 75',
    ];
  }
}

void main() {
  test('StatsNotifier returns three statistics', () async {
    // ProviderContainer digunakan untuk menguji provider
    // tanpa harus menjalankan aplikasi Flutter.
    final container = ProviderContainer(
      overrides: [
        statsProvider.overrideWith(TestStatsNotifier.new),
      ],
    );

    addTearDown(container.dispose);

    // Mengambil hasil asynchronous dari provider.
    final result = await container.read(statsProvider.future);

    // Memastikan terdapat tiga data statistik.
    expect(result, hasLength(3));

    // Memastikan data pertama sesuai.
    expect(result[0], 'Total Users: 120');

    // Memastikan data kedua sesuai.
    expect(result[1], 'Active Tasks: 45');

    // Memastikan data ketiga sesuai.
    expect(result[2], 'Completed Tasks: 75');
  });
}
