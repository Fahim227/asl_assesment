import 'package:asl_assesment/features/add_item/presentation/bloc/add_item_form_cubit.dart';
import 'package:asl_assesment/features/add_item/presentation/pages/add_item_page.dart';
import 'package:asl_assesment/features/items_list/presentation/bloc/posts_cubit.dart';
import 'package:asl_assesment/features/items_list/presentation/pages/all_items_page.dart';
import 'package:asl_assesment/features/post_details/presentation/bloc/post_details_cubit.dart';
import 'package:asl_assesment/features/post_details/presentation/pages/post_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/di.dart';
import 'core/models/flavor_config.dart';
import 'core/utils/app_colors.dart';
import 'features/items_list/domain/entity/post_entity.dart';

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
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  color: AppColors.borderColor,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  color: AppColors.borderColor,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  color: AppColors.borderColor,
                  width: 2.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide:
                    const BorderSide(width: 2, color: AppColors.borderColor),
              ),
            ),
            textTheme: const TextTheme(
              bodyText1: TextStyle(),
              bodyText2: TextStyle(fontSize: 12.0),
            )),
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
