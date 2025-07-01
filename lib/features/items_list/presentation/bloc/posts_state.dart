part of 'posts_cubit.dart';

class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsErrorState extends PostsState {
  final String errorMessage;

  PostsErrorState(this.errorMessage);
}

class PostsLoaded extends PostsState {
  final List<PostEntity> allPosts;

  PostsLoaded(this.allPosts);
}
