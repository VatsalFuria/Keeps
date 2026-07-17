
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keeps/main.dart';

void main() {
  testWidgets('Keeps home screen renders', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: KeepsApp()));
    await tester.pumpAndSettle();

    expect(find.text('Keeps'), findsOneWidget);
  });
}