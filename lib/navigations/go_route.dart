import 'package:expense_tracker/widgets/expenses_screen.dart';
import 'package:expense_tracker/widgets/splash.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => Splash()),
    GoRoute(path: '/home', builder: (context, state) => ExpensesScreen()),
  ],
);
