import 'package:flutter_cases/pages/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

abstract class RouteName {}

final routerProvider = Provider((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (_, state) {
          return const MyHomePage();
        },
      ),
    ],
  );
});
