part of 'post_details_cubit.dart';

class PostDetailsState {}

class PostDetailsLoading extends PostDetailsState {}

class PostDetailsFailure extends PostDetailsState {
  final String errorMessage;

  PostDetailsFailure(this.errorMessage);
}

class PostDetailsLoaded extends PostDetailsState {
  final PostEntity postEntity;

  PostDetailsLoaded(this.postEntity);
}
