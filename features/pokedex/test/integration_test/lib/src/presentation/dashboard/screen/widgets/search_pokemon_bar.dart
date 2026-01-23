import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/presentation/screens/dashboard/widgets/search_pokemon_bar.dart';

void main() {
  testWidgets("search pokemon", (WidgetTester tester) async {
    // Arrange

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: SearchPokemonBar(initialValue: "")),
      ),
    );

    await tester.pumpAndSettle();

    // Assert
  });
}
