import 'package:asl_assesment/features/items_list/data/model/post_model.dart';
import 'package:asl_assesment/features/post_details/data/data_source/remote/post_details_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:asl_assesment/core/network/network_client.dart';
import 'package:asl_assesment/core/network/custom_exception.dart';

@Injectable(as: PostDetailsDataSource)
class PostDetailsDataSourceImpl implements PostDetailsDataSource {
  final NetworkClient _client;

  PostDetailsDataSourceImpl(this._client);

  String path(String id) => "/posts/$id";

  @override
  Future<Either<CustomException, PostModel>> getPostDetails(String id) async {
    return await _client.get(path(id),
        parser: (data) => PostModel.fromJson(data));
  }
}
