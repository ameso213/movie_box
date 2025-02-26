// import 'package:flutter/material.dart';
// import '../models/movie.dart';

// class MovieCard extends StatelessWidget {
//   final Movie movie;

//   const MovieCard({Key? key, required this.movie}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8.0),
//       child: ListTile(
//         leading: movie.posterPath.isNotEmpty
//             ? Image.network(
//                 'https://image.tmdb.org/t/p/w200${movie.posterPath}', // Example image base URL
//                 width: 50,
//                 fit: BoxFit.cover,
//               )
//             : const SizedBox(width: 50),
//         title: Text(movie.title),
//         subtitle: Text(movie.overview, maxLines: 2, overflow: TextOverflow.ellipsis),
//       ),
//     );
//   }
// }
