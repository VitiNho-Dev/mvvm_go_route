import 'package:cep/cep_module.dart';
import 'package:core/core.dart';
import 'package:details/adapter/cep_details_adapter.dart';
import 'package:details/details_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const CepModule();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            final data = state.extra as Map<String, dynamic>;

            final cepDetailsModel = CepDetailsAdapter.fromJson(data);

            return DetailsPage(
              cepDetailsModel: cepDetailsModel,
            );
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
