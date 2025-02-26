import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

/// Represents a movie genre from TMDB.
@JsonSerializable()
class Genre {
  /// The unique identifier for the genre.
  final int? id; // Made nullable for null safety, as TMDB might return null in some cases

  /// The name of the genre (e.g., Action, Comedy).
  final String? name; // Made nullable for null safety, as TMDB might return null

  /// Creates a new [Genre] instance.
  Genre({
    this.id,
    this.name,
  });

  /// Creates a [Genre] instance from a JSON map.
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  /// Converts a [Genre] instance to a JSON map.
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}