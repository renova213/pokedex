import 'package:dependencies/dependencies.dart';
import 'package:pokedex/src/domain/entity/entity.dart';

class PokemonDetailResponse extends Equatable {
  final int id;
  final String name;
  final int height;
  final int weight;
  final String imageUrl;
  final String description;
  final List<PokemonTypeResponse> types;
  final List<PokemonStatResponse> stats;
  final List<String> abilities;

  const PokemonDetailResponse({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.imageUrl,
    required this.types,
    required this.stats,
    required this.abilities,
    required this.description,
  });

  factory PokemonDetailResponse.fromJson(
    Map<String, dynamic> json,
    String description,
  ) {
    return PokemonDetailResponse(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      imageUrl:
          json['sprites']?["other"]?["official-artwork"]?["front_default"] ??
          '',
      types: json['types'] != null
          ? (json['types'] as List)
                .map((e) => PokemonTypeResponse.fromJson(e))
                .toList()
          : [],
      stats: json['stats'] != null
          ? (json['stats'] as List)
                .map((e) => PokemonStatResponse.fromJson(e))
                .toList()
          : [],
      abilities: json['abilities'] != null
          ? (json['abilities'] as List)
                .map((e) => (e["ability"]?["name"] ?? "") as String)
                .toList()
          : [],
      description: description,
    );
  }

  PokemonDetailEntity toEntity() {
    return PokemonDetailEntity(
      id: id,
      name: name,
      height: height,
      weight: weight,
      imageUrl: imageUrl,
      types: types.map((e) => e.toEntity()).toList(),
      stats: stats.map((e) => e.toEntity()).toList(),
      abilities: abilities,
      description: description,
    );
  }

  @override
  List<Object?> get props => [id, name, height, weight, imageUrl, types, stats];
}

class PokemonTypeResponse extends Equatable {
  final String name;

  const PokemonTypeResponse({required this.name});

  factory PokemonTypeResponse.fromJson(Map<String, dynamic> json) {
    return PokemonTypeResponse(name: json['type']?['name'] ?? '');
  }

  PokemonTypeEntity toEntity() {
    return PokemonTypeEntity(name: name);
  }

  @override
  List<Object?> get props => [name];
}

class PokemonStatResponse extends Equatable {
  final String name;
  final int baseStat;

  const PokemonStatResponse({required this.name, required this.baseStat});

  factory PokemonStatResponse.fromJson(Map<String, dynamic> json) {
    return PokemonStatResponse(
      name: json['stat']?['name'] ?? '',
      baseStat: json['base_stat'] ?? 0,
    );
  }

  PokemonStatEntity toEntity() {
    return PokemonStatEntity(name: name, baseStat: baseStat);
  }

  @override
  List<Object?> get props => [name, baseStat];
}
