class PokemonRequest {
  final int limit;
  final int offset;

  PokemonRequest({required this.limit, required this.offset});

  Map<String, dynamic> toJson() => {'limit': limit, 'offset': offset};
}
