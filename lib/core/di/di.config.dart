// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:asl_assesment/core/network/network_client.dart' as _i14;
import 'package:asl_assesment/core/network/private_network_client.dart' as _i15;
import 'package:asl_assesment/core/utils/mapper.dart' as _i7;
import 'package:asl_assesment/features/add_item/data/local/data_source.dart'
    as _i3;
import 'package:asl_assesment/features/add_item/data/local/data_source_impl.dart'
    as _i4;
import 'package:asl_assesment/features/add_item/data/mapper/post_response_model_to_entity.dart'
    as _i13;
import 'package:asl_assesment/features/add_item/data/model/post_local_model.dart'
    as _i6;
import 'package:asl_assesment/features/add_item/data/repository/add_item_repository_impl.dart'
    as _i25;
import 'package:asl_assesment/features/add_item/domain/entity/post_response_entity.dart'
    as _i12;
import 'package:asl_assesment/features/add_item/domain/repository/add_item_repository.dart'
    as _i24;
import 'package:asl_assesment/features/add_item/domain/use_cases/add_item_use_case.dart'
    as _i26;
import 'package:asl_assesment/features/add_item/presentation/bloc/add_item_form_cubit.dart'
    as _i31;
import 'package:asl_assesment/features/items_list/data/data_source/remote/data_source.dart'
    as _i18;
import 'package:asl_assesment/features/items_list/data/data_source/remote/data_source_impl.dart'
    as _i19;
import 'package:asl_assesment/features/items_list/data/mapper/post_model_to_entity.dart'
    as _i10;
import 'package:asl_assesment/features/items_list/data/model/post_model.dart'
    as _i8;
import 'package:asl_assesment/features/items_list/data/repository/post_repository_impl.dart'
    as _i23;
import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart'
    as _i9;
import 'package:asl_assesment/features/items_list/domain/repository/post_repository.dart'
    as _i22;
import 'package:asl_assesment/features/items_list/domain/use_case/get_all_items.dart'
    as _i27;
import 'package:asl_assesment/features/items_list/presentation/bloc/posts_cubit.dart'
    as _i30;
import 'package:asl_assesment/features/post_details/data/data_source/remote/post_details_data_source.dart'
    as _i16;
import 'package:asl_assesment/features/post_details/data/data_source/remote/post_details_data_source_impl.dart'
    as _i17;
import 'package:asl_assesment/features/post_details/data/mapper/post_model_to_entity.dart'
    as _i11;
import 'package:asl_assesment/features/post_details/data/repository/post_details_repository_impl.dart'
    as _i21;
import 'package:asl_assesment/features/post_details/domain/repository/post_details_repository.dart'
    as _i20;
import 'package:asl_assesment/features/post_details/domain/use_case/get_post_details.dart'
    as _i28;
import 'package:asl_assesment/features/post_details/presentation/bloc/post_details_cubit.dart'
    as _i29;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i5;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AddItemDataSource>(() =>
        _i4.AddItemLocalDataSourceImpl(gh<_i5.Box<_i6.PostLocalModel>>()));
    gh.factory<_i7.Mapper<List<_i8.PostModel>, List<_i9.PostEntity>>>(
        () => _i10.PostModelToEntity());
    gh.factory<_i7.Mapper<_i8.PostModel, _i9.PostEntity>>(
        () => _i11.PostModelToEntity());
    gh.factory<_i7.Mapper<_i6.PostLocalModel, _i12.PostLocalEntity>>(
        () => _i13.PostResponseModelToEntity());
    gh.singleton<_i14.NetworkClient>(_i15.PrivateNetworkClient());
    gh.factory<_i16.PostDetailsDataSource>(
        () => _i17.PostDetailsDataSourceImpl(gh<_i14.NetworkClient>()));
    gh.factory<_i18.PostsDataSource>(
        () => _i19.PostsDataSourceImpl(gh<_i14.NetworkClient>()));
    gh.factory<_i20.PostsDetailsRepository>(
        () => _i21.PostsDetailsRepositoryImpl(
              gh<_i16.PostDetailsDataSource>(),
              gh<_i7.Mapper<_i8.PostModel, _i9.PostEntity>>(),
            ));
    gh.factory<_i22.PostsRepository>(() => _i23.PostsRepositoryImpl(
          gh<_i18.PostsDataSource>(),
          gh<_i7.Mapper<List<_i8.PostModel>, List<_i9.PostEntity>>>(),
        ));
    gh.factory<_i24.AddItemRepository>(() => _i25.AddItemRepositoryImpl(
          gh<_i3.AddItemDataSource>(),
          gh<_i7.Mapper<_i6.PostLocalModel, _i12.PostLocalEntity>>(),
        ));
    gh.factory<_i26.AddItemUseCase>(
        () => _i26.AddItemUseCase(gh<_i24.AddItemRepository>()));
    gh.factory<_i27.GetAllPostedItems>(
        () => _i27.GetAllPostedItems(gh<_i22.PostsRepository>()));
    gh.factory<_i28.GetPostDetails>(
        () => _i28.GetPostDetails(gh<_i20.PostsDetailsRepository>()));
    gh.factory<_i29.PostDetailsCubit>(
        () => _i29.PostDetailsCubit(gh<_i28.GetPostDetails>()));
    gh.factory<_i30.PostsCubit>(
        () => _i30.PostsCubit(getAllPostedItems: gh<_i27.GetAllPostedItems>()));
    gh.factory<_i31.AddItemFormCubit>(
        () => _i31.AddItemFormCubit(gh<_i26.AddItemUseCase>()));
    return this;
  }
}
