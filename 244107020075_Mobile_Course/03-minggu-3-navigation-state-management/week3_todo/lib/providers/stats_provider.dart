import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// Mengelola data statistik secara asynchronous.
class StatsNotifier extends AsyncNotifier<List<String>> {
  // Random digunakan untuk mensimulasikan kegagalan server.
  final Random _random = Random();

  @override
  Future<List<String>> build() async {
    // Simulasi proses mengambil data selama 2 detik.
    await Future.delayed(const Duration(seconds: 2));

    // Sekitar 30% kemungkinan pengambilan data gagal.
    if (_random.nextDouble() < 0.3) {
      throw Exception('Failed to fetch statistics');
    }

    // Data dikembalikan jika proses berhasil.
    return ['Total Users: 120', 'Active Tasks: 45', 'Completed Tasks: 75'];
  }
}

// Provider dengan tipe state yang eksplisit.
final statsProvider = AsyncNotifierProvider<StatsNotifier, List<String>>(
  StatsNotifier.new,
);
