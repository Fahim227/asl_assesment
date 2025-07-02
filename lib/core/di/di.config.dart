// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:asl_assesment/core/network/network_client.dart' as _i7;
import 'package:asl_assesment/core/network/private_network_client.dart' as _i8;
import 'package:asl_assesment/core/utils/mapper.dart' as _i3;
import 'package:asl_assesment/features/add_item/data/remote/data_source.dart'
    as _i13;
import 'package:asl_assesment/features/add_item/data/remote/data_source_impl.dart'
    as _i14;
import 'package:asl_assesment/features/add_item/data/repository/add_item_repository_impl.dart'
    as _i16;
import 'package:asl_assesment/features/add_item/domain/repository/add_item_repository.dart'
    as _i15;
import 'package:asl_assesment/features/add_item/domain/use_cases/add_item_use_case.dart'
    as _i17;
import 'package:asl_assesment/features/add_item/presentation/bloc/add_item_form_cubit.dart'
    as _i20;
import 'package:asl_assesment/features/items_list/data/data_source/remote/data_source.dart'
    as _i9;
import 'package:asl_assesment/features/items_list/data/data_source/remote/data_source_impl.dart'
    as _i10;
import 'package:asl_assesment/features/items_list/data/mapper/post_model_to_entity.dart'
    as _i6;
import 'package:asl_assesment/features/items_list/data/model/post_model.dart'
    as _i4;
import 'package:asl_assesment/features/items_list/data/repository/post_repository_impl.dart'
    as _i12;
import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart'
    as _i5;
import 'package:asl_assesment/features/items_list/domain/repository/post_repository.dart'
    as _i11;
import 'package:asl_assesment/features/items_list/domain/use_case/get_all_items.dart'
    as _i18;
import 'package:asl_assesment/features/items_list/presentation/bloc/posts_cubit.dart'
    as _i19;
import 'package:get_it/get_it.dart' as _i1;
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
    gh.factory<_i3.Mapper<List<_i4.PostModel>, List<_i5.PostEntity>>>(
        () => _i6.PostModelToEntity());
    gh.singleton<_i7.NetworkClient>(_i8.PrivateNetworkClient());
    gh.factory<_i9.PostsDataSource>(
        () => _i10.PostsDataSourceImpl(gh<_i7.NetworkClient>()));
    gh.factory<_i11.PostsRepository>(() => _i12.PostsRepositoryImpl(
          gh<_i9.PostsDataSource>(),
          gh<_i3.Mapper<List<_i4.PostModel>, List<_i5.PostEntity>>>(),
        ));
    gh.factory<_i13.AddItemDataSource>(
        () => _i14.AddItemDataSourceImpl(gh<_i7.NetworkClient>()));
    gh.factory<_i15.AddItemRepository>(
        () => _i16.AddItemRepositoryImpl(gh<_i13.AddItemDataSource>()));
    gh.factory<_i17.AddItemUseCase>(
        () => _i17.AddItemUseCase(gh<_i15.AddItemRepository>()));
    gh.factory<_i18.GetAllPostedItems>(
        () => _i18.GetAllPostedItems(gh<_i11.PostsRepository>()));
    gh.factory<_i19.PostsCubit>(
        () => _i19.PostsCubit(getAllPostedItems: gh<_i18.GetAllPostedItems>()));
    gh.factory<_i20.AddItemFormCubit>(
        () => _i20.AddItemFormCubit(gh<_i17.AddItemUseCase>()));
    return this;
  }
}
