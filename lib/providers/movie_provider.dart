// movie_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/movie_services.dart';
import '../models/movie.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  return MovieService(baseUrl: 'https://api.themoviedb.org/3', apiKey: 'a32e37f0ffdee589fb9b0e8235b32b0a');
});

final movieProvider = FutureProvider<List<Movie>>((ref) async {
  final service = ref.read(movieServiceProvider);
  return service.fetchMovies();
});