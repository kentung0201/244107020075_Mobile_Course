
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:week3_todo/main.dart';

void main() {
  testWidgets('App displays navigation destinations', (tester) async {
    // ProviderScope diperlukan agar widget dapat mengakses Riverpod.
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    // Periksa apakah ketiga menu navigasi ditampilkan.
    expect(find.text('ToDo'), findsOneWidget);
    expect(find.text('Products'), findsOneWidget);
    expect(find.text('Stats'), findsOneWidget);
  });
}
