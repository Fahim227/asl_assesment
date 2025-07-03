import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart';
import 'package:asl_assesment/features/post_details/domain/use_case/get_post_details.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'post_details_state.dart';

@injectable
class PostDetailsCubit extends Cubit<PostDetailsState> {
  final GetPostDetails _getPostDetails;

  PostDetailsCubit(GetPostDetails getPostDetails)
      : _getPostDetails = getPostDetails,
        super(PostDetailsLoading());

  Future<void> getPostDetails(String id) async {
    final result = await _getPostDetails.call(id);
    result.fold((error) => emit(PostDetailsFailure(error.message)),
        (data) => emit(PostDetailsLoaded(data)));
  }
}
