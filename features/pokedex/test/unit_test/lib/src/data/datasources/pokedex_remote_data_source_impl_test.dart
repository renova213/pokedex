import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:pokedex/src/data/datasources/pokedex_remote_data_source_impl.dart';
import 'package:pokedex/src/data/models/request/pokemon_request.dart';
import 'package:pokedex/src/data/models/response/response.dart';

import 'pokedex_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([PokedexRemoteDatasourceImpl])
void main() {
  const expectResult = PokemonResponse(
    count: 1,
    pokemonList: [
      PokemonItemResponse(
        id: 1,
        name: 'pikachu',
        imageUrl:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
      ),
    ],
  );

  PokemonRequest request = PokemonRequest(limit: 1, offset: 0);

  final MockPokedexRemoteDatasourceImpl mockPokedexRemoteDatasourceImpl =
      MockPokedexRemoteDatasourceImpl();

  group("getPokemons", () {
    test("should return a PokemonResponse", () async {
      // Arrange
      when(
        mockPokedexRemoteDatasourceImpl.getPokemons(request),
      ).thenAnswer((_) async => Future.value(expectResult));

      // Act
      final result = await mockPokedexRemoteDatasourceImpl.getPokemons(request);

      // Assert
      expect(result, expectResult);
    });
  });
}
