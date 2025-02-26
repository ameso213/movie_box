import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/movie_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesAsyncValue = ref.watch(movieProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie DB'),
        backgroundColor: const Color(0xFF4A1D1D), // Optional: Add Mama D branding (dark red)
      ),
      body: moviesAsyncValue.when(
        data: (movies) => ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(
              leading: movie.posterPath != null
                  ? Image.network(
                      'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.movie),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                            color: const Color(0xFF4A1D1D), // Mama D branding
                          ),
                        );
                      },
                    )
                  : const Icon(Icons.movie, color: Color(0xFF4A1D1D)), // Mama D branding
              title: Text(
                movie.title ?? 'No Title',
                style: const TextStyle(color: Color.fromARGB(255, 252, 252, 252)),
              ),
              subtitle: Text(
                movie.releaseDate ?? 'Unknown Release Date',
                style: const TextStyle(color: Colors.grey),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFF4A1D1D))),
        error: (error, stackTrace) => Center(
          child: Text(
            'Error: $error',
            style: const TextStyle(color: Color(0xFF4A1D1D)),
          ),
        ),
      ),
    );
  }
}