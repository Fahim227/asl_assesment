import 'package:asl_assesment/features/items_list/presentation/bloc/posts_cubit.dart';
import 'package:asl_assesment/features/items_list/presentation/pages/all_items_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/di.dart';
import 'core/models/flavor_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig.initialize(
    flavor: Flavor.dev,
    baseUrl: 'https://jsonplaceholder.typicode.com',
  );
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: (details) {
        final tappedContext = FocusManager.instance.primaryFocus?.context;
        debugPrint("Tapped widget: $tappedContext");
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/all_items',
        routes: {
          '/all_items': (context) => BlocProvider(
                create: (context) => sl.get<PostsCubit>()..getAllPostedItems(),
                child: const AllPostedItemsPage(),
              ),
        },
      ),
    );
  }
}
