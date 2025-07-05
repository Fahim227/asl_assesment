// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:asl_assesment/core/network/network_client.dart' as _i497;
import 'package:asl_assesment/core/network/private_network_client.dart'
    as _i383;
import 'package:asl_assesment/core/utils/mapper.dart' as _i60;
import 'package:asl_assesment/features/add_item/data/local/data_source.dart'
    as _i603;
import 'package:asl_assesment/features/add_item/data/local/data_source_impl.dart'
    as _i390;
import 'package:asl_assesment/features/add_item/data/mapper/post_response_model_to_entity.dart'
    as _i515;
import 'package:asl_assesment/features/add_item/data/model/post_local_model.dart'
    as _i669;
import 'package:asl_assesment/features/add_item/data/repository/add_item_repository_impl.dart'
    as _i865;
import 'package:asl_assesment/features/add_item/domain/entity/post_response_entity.dart'
    as _i591;
import 'package:asl_assesment/features/add_item/domain/repository/add_item_repository.dart'
    as _i264;
import 'package:asl_assesment/features/add_item/domain/use_cases/add_item_use_case.dart'
    as _i1007;
import 'package:asl_assesment/features/add_item/presentation/bloc/add_item_form_cubit.dart'
    as _i530;
import 'package:asl_assesment/features/items_list/data/data_source/remote/data_source.dart'
    as _i495;
import 'package:asl_assesment/features/items_list/data/data_source/remote/data_source_impl.dart'
    as _i105;
import 'package:asl_assesment/features/items_list/data/mapper/post_model_to_entity.dart'
    as _i336;
import 'package:asl_assesment/features/items_list/data/model/post_model.dart'
    as _i413;
import 'package:asl_assesment/features/items_list/data/repository/post_repository_impl.dart'
    as _i139;
import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart'
    as _i439;
import 'package:asl_assesment/features/items_list/domain/repository/post_repository.dart'
    as _i646;
import 'package:asl_assesment/features/items_list/domain/use_case/get_all_items.dart'
    as _i924;
import 'package:asl_assesment/features/items_list/presentation/bloc/posts_cubit.dart'
    as _i731;
import 'package:asl_assesment/features/post_details/data/data_source/remote/post_details_data_source.dart'
    as _i473;
import 'package:asl_assesment/features/post_details/data/data_source/remote/post_details_data_source_impl.dart'
    as _i37;
import 'package:asl_assesment/features/post_details/data/mapper/post_model_to_entity.dart'
    as _i903;
import 'package:asl_assesment/features/post_details/data/repository/post_details_repository_impl.dart'
    as _i127;
import 'package:asl_assesment/features/post_details/domain/repository/post_details_repository.dart'
    as _i858;
import 'package:asl_assesment/features/post_details/domain/use_case/get_post_details.dart'
    as _i107;
import 'package:asl_assesment/features/post_details/presentation/bloc/post_details_cubit.dart'
    as _i173;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i497.NetworkClient>(() => _i383.PrivateNetworkClient());
    gh.factory<_i603.AddItemDataSource>(() => _i390.AddItemLocalDataSourceImpl(
        gh<_i979.Box<_i669.PostLocalModel>>()));
    gh.factory<_i60.Mapper<List<_i413.PostModel>, List<_i439.PostEntity>>>(
        () => _i336.PostModelToEntity());
    gh.factory<_i60.Mapper<_i413.PostModel, _i439.PostEntity>>(
        () => _i903.PostModelToEntity());
    gh.factory<_i473.PostDetailsDataSource>(
        () => _i37.PostDetailsDataSourceImpl(gh<_i497.NetworkClient>()));
    gh.factory<_i60.Mapper<_i669.PostLocalModel, _i591.PostLocalEntity>>(
        () => _i515.PostResponseModelToEntity());
    gh.factory<_i495.PostsDataSource>(
        () => _i105.PostsDataSourceImpl(gh<_i497.NetworkClient>()));
    gh.factory<_i858.PostsDetailsRepository>(
        () => _i127.PostsDetailsRepositoryImpl(
              gh<_i473.PostDetailsDataSource>(),
              gh<_i60.Mapper<_i413.PostModel, _i439.PostEntity>>(),
            ));
    gh.factory<_i646.PostsRepository>(() => _i139.PostsRepositoryImpl(
          gh<_i495.PostsDataSource>(),
          gh<_i60.Mapper<List<_i413.PostModel>, List<_i439.PostEntity>>>(),
        ));
    gh.factory<_i264.AddItemRepository>(() => _i865.AddItemRepositoryImpl(
          gh<_i603.AddItemDataSource>(),
          gh<_i60.Mapper<_i669.PostLocalModel, _i591.PostLocalEntity>>(),
        ));
    gh.factory<_i1007.AddItemUseCase>(
        () => _i1007.AddItemUseCase(gh<_i264.AddItemRepository>()));
    gh.factory<_i924.GetAllPostedItems>(
        () => _i924.GetAllPostedItems(gh<_i646.PostsRepository>()));
    gh.factory<_i107.GetPostDetails>(
        () => _i107.GetPostDetails(gh<_i858.PostsDetailsRepository>()));
    gh.factory<_i173.PostDetailsCubit>(
        () => _i173.PostDetailsCubit(gh<_i107.GetPostDetails>()));
    gh.factory<_i530.AddItemFormCubit>(
        () => _i530.AddItemFormCubit(gh<_i1007.AddItemUseCase>()));
    gh.factory<_i731.PostsCubit>(() =>
        _i731.PostsCubit(getAllPostedItems: gh<_i924.GetAllPostedItems>()));
    return this;
  }
}
