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

  List<PostEntity> _allPosts = [];

  Future<void> getAllPostedItems() async {
    emit(PostsLoading());
    final result = await _getAllPostedItems.call();
    result.fold(
          (error) => emit(PostsErrorState(error.message)),
          (allPosts) {
        _allPosts = allPosts;
        emit(PostsLoaded(allPosts));
      },
    );
  }


  void searchPosts(String query) {
    if (state is! PostsLoaded) return;

    if (query.isEmpty) {
      emit(PostsLoaded(_allPosts));
    } else {
      final filtered = _allPosts
          .where((post) =>
      post.title.toLowerCase().contains(query.toLowerCase()) ||
          post.body.toLowerCase().contains(query.toLowerCase()))
          .toList();

      emit(PostsLoaded(filtered));
    }
  }
}
