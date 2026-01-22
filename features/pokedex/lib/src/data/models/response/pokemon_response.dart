import 'package:pokedex/src/domain/entity/entity.dart';
import 'package:dependencies/dependencies.dart';

class PokemonResponse extends Equatable {
  final int count;
  final List<PokemonItemResponse> pokemonList;

  const PokemonResponse({required this.count, required this.pokemonList});

  factory PokemonResponse.fromJson(Map<String, dynamic> json) {
    return PokemonResponse(
      count: json['count'] ?? 0,
      pokemonList: json['results'] != null
          ? (json['results'] as List)
                .map((e) => PokemonItemResponse.fromJson(e))
                .toList()
          : [],
    );
  }

  PokemonEntity toEntity() {
    return PokemonEntity(
      count: count,
      pokemonList: pokemonList.map((e) => e.toEntity()).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    "count": count,
    "pokemonList": pokemonList.map((e) => e.toJson()),
  };

  @override
  List<Object?> get props => [count, pokemonList];
}

class PokemonItemResponse extends Equatable {
  final int id;
  final String name;
  final String imageUrl;

  const PokemonItemResponse({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory PokemonItemResponse.fromJson(Map<String, dynamic> json) {
    return PokemonItemResponse(
      id: json['url'] != null ? _extractIdFromUrl(json['url']) : 0,
      name: json['name'],
      imageUrl: json['url'] != null
          ? 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${_extractIdFromUrl(json["url"])}.png'
          : "",
    );
  }

  static int _extractIdFromUrl(String url) {
    final segments = url.split('/');
    return int.parse(segments[segments.length - 2]);
  }

  PokemonItemEntity toEntity() {
    return PokemonItemEntity(id: id, name: name, imageUrl: imageUrl);
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imageUrl": imageUrl,
  };

  @override
  List<Object?> get props => [id, name, imageUrl];
}
