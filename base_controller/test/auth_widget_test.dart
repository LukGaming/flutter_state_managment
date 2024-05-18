import 'package:base_controller/main.dart';
import 'package:base_controller/utilities/keys.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Should test the auth page", (widgetTester) async {
    await widgetTester.pumpWidget(const MyApp());
    final loginButton = find.byKey(login_button_key);
    final loggedText = find.text("Unlogged");

    final logoutButton = find.byKey(logout_button_key);

    expect(loggedText, findsOne);

    expect(loginButton, findsOne);

    await widgetTester.tap(loginButton);

    await widgetTester.pump();

    expect(loginButton, findsNothing);

    expect(loggedText, findsNothing);

    expect(logoutButton, findsOne);
  });
}
