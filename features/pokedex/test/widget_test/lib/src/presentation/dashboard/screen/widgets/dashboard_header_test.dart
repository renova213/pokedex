import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:pokedex/src/presentation/screens/dashboard/widgets/widgets.dart";

void main() {
  testWidgets("Should have image asset on header", (WidgetTester tester) async {
    // Arrange

    // Act
    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: DashboardHeader())),
    );

    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(Image), findsOneWidget);
  });
}
