import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/presentation/screens/screens.dart';

part 'app_router.g.dart';


@riverpod
GoRouter appRouter(AppRouterRef ref) {

  return GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/form',
      builder: (context, state) => const FormScreen(),
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) => ResultScreen(),
    ),
    GoRoute(
      path: '/report',
      builder: (context, state) => ReportScreen(),
    ),
  ]);
}
 