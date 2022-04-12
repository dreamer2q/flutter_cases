import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

abstract class RouteName {
  // TODO add route names
}

final routerPrivider = Provider((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
      ),
    ],
  );
});
