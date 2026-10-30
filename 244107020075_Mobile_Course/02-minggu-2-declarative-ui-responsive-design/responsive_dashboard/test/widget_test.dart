import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_dashboard/main.dart';

void main() {
  testWidgets('AcademicApp dapat ditampilkan', (tester) async {
    await tester.pumpWidget(const AcademicApp());

    expect(find.byType(AcademicApp), findsOneWidget);
  });
}