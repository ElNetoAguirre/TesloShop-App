import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:teslo_shop/features/auth/auth.dart";
import "package:teslo_shop/features/products/products.dart";

import "app_router_notifier.dart";

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: "/splash",
    refreshListenable: goRouterNotifier,
    routes: [
      ///* Primer pantalla
      GoRoute(
        path: "/splash",
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),

      ///* Auth Routes
      GoRoute(
        path: "/login",
        builder: (context, state) => const LoginScreen(),
      ),

      GoRoute(
        path: "/register",
        builder: (context, state) => const RegisterScreen(),
      ),

      ///* Product Routes
      GoRoute(
        path: "/",
        builder: (context, state) => const ProductsScreen(),
      ),

      GoRoute(
        path: "/product/:id",
        builder: (context, state) => ProductScreen(
          productId: state.pathParameters["id"] ?? "no-id",
        ),
      ),
    ],

    redirect: ((context, state) {
      final isGoingTo = state.matchedLocation;
      final authStatus = goRouterNotifier.authStatus;

      if(isGoingTo == "/splash" && authStatus == AuthStatus.checking) return null;

      if(authStatus == AuthStatus.notAuthenticated) {
        if(isGoingTo =="/login" || isGoingTo == "/register") return null;

        return "/login";
      }

      if(authStatus == AuthStatus.authenticated) {
        if(isGoingTo =="/login" || isGoingTo == "/register" || isGoingTo == "/splash") {
          return "/";
        }
      }

      //! Aquí se pueden hacer las validaciones para un LogIn basado en el rol de Admin.
      //! Se debe llamar del provider el user.isAdmin y hacer las validaciones.

      return null;
    })
  );
});