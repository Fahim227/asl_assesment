import 'package:asl_assesment/core/network/custom_exception.dart';
import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart';
import 'package:asl_assesment/features/items_list/domain/repository/post_repository.dart';
import 'package:asl_assesment/features/post_details/data/data_source/remote/post_details_data_source.dart';
import 'package:asl_assesment/features/post_details/domain/repository/post_details_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:asl_assesment/features/items_list/data/data_source/remote/data_source.dart';

import 'package:asl_assesment/core/utils/mapper.dart';

import 'package:asl_assesment/features/items_list/data/model/post_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PostsDetailsRepository)
class PostsDetailsRepositoryImpl implements PostsDetailsRepository {
  final PostDetailsDataSource _dataSource;
  final Mapper<PostModel, PostEntity> _postModelToEntityMapper;

  PostsDetailsRepositoryImpl(this._dataSource, this._postModelToEntityMapper);

  @override
  Future<Either<CustomException, PostEntity>> getPostDetails(String id) async {
    final result = await _dataSource.getPostDetails(id);
    return result.fold((error) => Left(error), (data) {
      final postEntity = _postModelToEntityMapper.map(data);
      return Right(postEntity);
    });
  }
}
