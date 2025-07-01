import 'package:asl_assesment/features/items_list/presentation/bloc/posts_cubit.dart';
import 'package:asl_assesment/features/items_list/presentation/pages/all_items_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/di.dart';
import 'core/models/flavor_config.dart';
import 'core/utils/app_colors.dart';

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
          /*textTheme: TextTheme(
              bodyText1: TextStyle(),
              bodyText2: TextStyle(fontSize: 12.0),
            )*/
          //
          // the below code is getting fonts from http
          //textTheme: GoogleFonts.roboto(),
          // textTheme: GoogleFonts.sourceSansProTextTheme(textTheme).copyWith(
          //   bodyText1:
          //       GoogleFonts.sourceSansPro(textStyle: textTheme.bodyText1),
          //   bodyText2: GoogleFonts.sourceSansPro(
          //       textStyle: textTheme.bodyText2, fontSize: 12),
          // ),
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
