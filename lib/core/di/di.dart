import 'package:asl_assesment/features/add_item/data/model/post_local_model.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';

final sl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  sl.init();
  // local sotrage
  final postBox = await Hive.openBox<PostLocalModel>('posts');
  sl.registerSingleton<Box<PostLocalModel>>(postBox);
}
