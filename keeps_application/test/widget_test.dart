import 'package:flutter_test/flutter_test.dart';

import 'package:keeps/main.dart';

void main() {
  testWidgets('Keeps app renders', (WidgetTester tester) async {
    await tester.pumpWidget(const KeepsApp());

    expect(find.text('Keeps'), findsWidgets);
  });
}
