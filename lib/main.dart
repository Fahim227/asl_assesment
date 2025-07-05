import 'package:asl_assesment/features/add_item/data/model/post_local_model.dart';
import 'package:asl_assesment/features/add_item/presentation/bloc/add_item_form_cubit.dart';
import 'package:asl_assesment/features/add_item/presentation/pages/add_item_page.dart';
import 'package:asl_assesment/features/items_list/presentation/bloc/posts_cubit.dart';
import 'package:asl_assesment/features/items_list/presentation/pages/all_items_page.dart';
import 'package:asl_assesment/features/post_details/presentation/bloc/post_details_cubit.dart';
import 'package:asl_assesment/features/post_details/presentation/pages/post_details_page.dart';
import 'package:asl_assesment/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'core/di/di.dart';
import 'core/models/flavor_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Hive.registerAdapter(PostLocalModelAdapter());

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
        theme: AppTheme.themeData,
        initialRoute: '/',
        routes: {
          '/': (context) => BlocProvider(
                create: (context) => sl.get<PostsCubit>()..getAllPostedItems(),
                child: const AllPostedItemsPage(),
              ),
          '/add_item': (context) => BlocProvider(
                create: (context) => sl.get<AddItemFormCubit>(),
                child: const AddItemPage(),
              ),
        },
        onGenerateRoute: (settings) {
          if (settings.name!.startsWith('/details')) {
            final postId = settings.arguments as String;

            return MaterialPageRoute(
                builder: (_) => BlocProvider(
                      create: (context) =>
                          sl.get<PostDetailsCubit>()..getPostDetails(postId),
                      child: const DetailsPage(),
                    ));
          }
          return null;
        },
      ),
    );
  }
}
