import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex/src/data/datasources/pokedex_local_data_source.dart';
import 'package:pokedex/src/data/models/request/pokemon_request.dart';
import 'package:pokedex/src/data/models/response/pokemon_detail_response.dart';
import 'package:pokedex/src/data/models/response/pokemon_response.dart';

class PokedexRemoteDatasourceImpl implements PokedexRemoteDatasource {
  final ApiService apiService;
  final PokedexLocalDataSource localDataSource;

  PokedexRemoteDatasourceImpl(this.apiService, this.localDataSource);

  @override
  Future<PokemonResponse> getPokemons(PokemonRequest request) async {
    try {
      final response = await apiService.dio.get(
        '/pokemon',
        queryParameters: request.toJson(),
      );

      return PokemonResponse.fromJson(response.data);
    } on DioException catch (e) {
      // var pokedexLocalDataSource = await localDataSource.getPokemons();

      // if (pokedexLocalDataSource != null && pokedexLocalDataSource.isNotEmpty) {
      //   var localJson = json.decode(pokedexLocalDataSource);

      //   return PokemonResponse.fromJson(localJson);
      // }

      throw NetworkException(message: e.message ?? 'Unknown network error');
    }
  }

  @override
  Future<PokemonDetailResponse> getPokemonDetail(String name) async {
    try {
      final responsePokemon = await apiService.dio.get('/pokemon/$name');
      final responsePokemonSpecies = await apiService.dio.get(
        "/pokemon-species/$name",
      );

      final speciesData = responsePokemonSpecies.data;

      String description = "";

      final flavorTexts = speciesData["flavor_text_entries"] as List<dynamic>;

      final englishFlavor = flavorTexts.cast<Map<String, dynamic>>().firstWhere(
        (f) => f["language"]["name"] == "en",
        orElse: () => {},
      );

      if (englishFlavor.isNotEmpty) {
        description = (englishFlavor["flavor_text"] as String)
            .replaceAll("\n", " ")
            .replaceAll("\f", " ")
            .trim();
      }

      return PokemonDetailResponse.fromJson(responsePokemon.data, description);
    } on DioException catch (e) {
      throw NetworkException(message: e.message ?? 'Unknown network error');
    }
  }
}
