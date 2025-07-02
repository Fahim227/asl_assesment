import 'package:asl_assesment/core/network/custom_exception.dart';
import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart';
import 'package:asl_assesment/features/items_list/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:asl_assesment/features/items_list/data/data_source/remote/data_source.dart';

import 'package:asl_assesment/core/utils/mapper.dart';

import 'package:asl_assesment/features/items_list/data/model/post_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PostsRepository)
class PostsRepositoryImpl implements PostsRepository {
  final PostsDataSource _dataSource;
  final Mapper<List<PostModel>, List<PostEntity>> _postModelToEntityMapper;

  PostsRepositoryImpl(this._dataSource, this._postModelToEntityMapper);

  @override
  Future<Either<CustomException, List<PostEntity>>> getAllPosts() async {
    final result = await _dataSource.getAllPosts();
    return result.fold((error) => Left(error), (data) {
      final postEntity = _postModelToEntityMapper.map(data);
      return Right(postEntity);
    });
  }
}
