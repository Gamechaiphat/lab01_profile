import 'package:flutter_test/flutter_test.dart';

import 'package:lab01_profile/main.dart';

void main() {
  testWidgets('About me shows student ID and name', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Lab L1 · 67103150'), findsOneWidget);
    expect(find.text('ไชยภัทร อ่อนวันนา'), findsOneWidget);
  });

  testWidgets('Like button increments by 1', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Likes: 0'), findsOneWidget);
    for (var i = 0; i < 3; i++) {
      await tester.tap(find.text('Like'));
      await tester.pump();
    }
    expect(find.text('Likes: 3'), findsOneWidget);
  });
}
