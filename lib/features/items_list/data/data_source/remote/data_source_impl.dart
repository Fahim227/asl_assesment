import 'package:asl_assesment/features/items_list/data/data_source/remote/data_source.dart';
import 'package:asl_assesment/features/items_list/data/model/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:asl_assesment/core/network/network_client.dart';
import 'package:asl_assesment/core/network/network_exception.dart';

@Injectable(as: PostsDataSource)
class PostsDataSourceImpl implements PostsDataSource {
  final NetworkClient _client;

  PostsDataSourceImpl(this._client);

  final String path = "/posts/";

  @override
  Future<Either<NetworkException, List<PostModel>>> getAllPosts() async {
    return await _client.get(path,
        parser: (data) =>
            (data as List).map((e) => PostModel.fromJson(e)).toList());
  }
}
