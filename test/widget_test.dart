import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dune_women/main.dart';

void main() {
  testWidgets('DUNE Women app loads', (WidgetTester tester) async {
    final originalOnError = FlutterError.onError;
    FlutterError.onError = (details) {
      if (details.library == 'image resource service') return;
      originalOnError?.call(details);
    };
    addTearDown(() => FlutterError.onError = originalOnError);

    await tester.pumpWidget(const DuneWomenApp());
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('SHOP NOW'), findsOneWidget);
  });
}
