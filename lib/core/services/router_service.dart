import 'package:go_router/go_router.dart';
import 'package:pokemon/pages/error_page.dart';
import 'package:pokemon/pages/home_page.dart';
import 'package:pokemon/pages/pokemon_page.dart';

import '../../pages/all_pokemons.dart';

class NavigationServices {
  /// Using the package Go-router
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/pokemon/:id',
        builder: (context, state) => PokemonPage(state.params['id']!),
      ),
      GoRoute(
        path: '/error',
        builder: (context, state) => const ErrorPage(),
      ),
      GoRoute(
        path: '/all',
        builder: (context, state) => const AllPokemons(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}
