import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart';

import 'package:asl_assesment/features/items_list/domain/use_case/get_all_items.dart';
import 'package:injectable/injectable.dart';

part 'posts_state.dart';

@injectable
class PostsCubit extends Cubit<PostsState> {
  final GetAllPostedItems _getAllPostedItems;
  PostsCubit({required GetAllPostedItems getAllPostedItems})
      : _getAllPostedItems = getAllPostedItems,
        super(PostsInitial());

  Future<void> getAllPostedItems() async {
    final result = await _getAllPostedItems.call();
    result.fold((l) => null, (allPosts) => PostsLoaded(allPosts));
  }
}
