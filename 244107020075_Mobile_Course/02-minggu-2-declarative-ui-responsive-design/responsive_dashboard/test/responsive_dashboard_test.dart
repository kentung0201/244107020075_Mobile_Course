
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_dashboard/main.dart';

void main() {
  testWidgets('Dashboard satu kolom di layar sempit', (tester) async {
    // Mengatur ukuran layar menjadi 400 x 800
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;

    addTearDown(tester.view.reset);

    // Menjalankan aplikasi
    await tester.pumpWidget(const AcademicApp());
    await tester.pumpAndSettle();

    // Memastikan empat kartu ditampilkan
    expect(find.byType(InfoCard), findsNWidgets(4));

    // Mengambil ukuran kartu pertama
    final width = tester.getSize(find.byType(InfoCard).first).width;

    // Memastikan kartu menggunakan satu kolom
    expect(width, lessThan(700));
    expect(width, greaterThan(300));
  });

  testWidgets('Dashboard dua kolom di layar lebar', (tester) async {
    // Mengatur ukuran layar menjadi 1200 x 800
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;

    addTearDown(tester.view.reset);

    // Menjalankan aplikasi
    await tester.pumpWidget(const AcademicApp());
    await tester.pumpAndSettle();

    // Memastikan empat kartu ditampilkan
    expect(find.byType(InfoCard), findsNWidgets(4));

    // Mengambil ukuran kartu pertama
    final width = tester.getSize(find.byType(InfoCard).first).width;

    // Memastikan kartu menggunakan dua kolom
    expect(width, greaterThan(500));
  });
}
