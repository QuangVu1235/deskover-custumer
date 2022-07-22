// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../main.dart' as _i9;
import '../apis/cart/cart_datasource.dart' as _i17;
import '../apis/cart/service/cart_api.dart' as _i16;
import '../apis/category/category_datasource.dart' as _i20;
import '../apis/category/service/category_api.dart' as _i19;
import '../apis/product/product_datasoure.dart' as _i11;
import '../apis/product/service/product_api.dart' as _i10;
import '../apis/subcategory/service/subcategory_api.dart' as _i14;
import '../apis/subcategory/subcategory_datasource.dart' as _i15;
import '../core/dio_cache/dio_cache_manager.dart' as _i3;
import '../modules/exchange_points/cart_model.dart' as _i28;
import '../modules/homepage/homepage_model.dart' as _i22;
import '../modules/main_page_model.dart' as _i23;
import '../modules/product_widget/product_detail_model.dart' as _i25;
import '../modules/product_widget/product_model.dart' as _i24;
import '../modules/signin_signup/app/form_pass/form_pass_model.dart' as _i4;
import '../modules/signin_signup/app/signin/app/signin_model.dart' as _i7;
import '../modules/splashsreen/splashsreen_model.dart' as _i13;
import '../modules/subcategory/subcategory_model.dart' as _i27;
import '../usecases/cart_usercase/cart_usercase.dart' as _i18;
import '../usecases/category_usercase/category_usercase.dart' as _i21;
import '../usecases/category_usercase/product_usercase.dart' as _i12;
import '../usecases/subcategory_usercase/subcategory_usercase.dart' as _i26;
import 'injection_config.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final moduleRegister = _$ModuleRegister();
  gh.lazySingleton<_i3.DioCacheManager>(() => moduleRegister.getDioCache());
  gh.factory<_i4.FormPassModel>(() => _i4.FormPassModel());
  gh.singleton<_i5.NumCartDetail>(_i5.NumCartDetail(),
      dispose: (i) => i.disposeCartNumberStream());
  gh.singleton<_i5.NumCartPoint>(_i5.NumCartPoint(),
      dispose: (i) => i.disposeCartNumberStream());
  await gh.factoryAsync<_i6.SharedPreferences>(
      () => moduleRegister.sharedPreferences(),
      preResolve: true);
  gh.factory<_i7.SigninModel>(() => _i7.SigninModel());
  gh.lazySingleton<_i8.Dio>(() => moduleRegister.getDio(
      get<_i6.SharedPreferences>(), get<_i3.DioCacheManager>()));
  gh.factory<_i9.MyApp>(() => _i9.MyApp(get<_i6.SharedPreferences>()));
  gh.lazySingleton<_i10.ProductAPI>(() => _i10.ProductAPI(get<_i8.Dio>()));
  gh.lazySingleton<_i11.ProductDataSource>(
      () => _i11.ProductDataSourceImpl(get<_i10.ProductAPI>()));
  gh.lazySingleton<_i12.ProductUserCase>(
      () => _i12.ProductUserCase(get<_i11.ProductDataSource>()));
  gh.lazySingleton<_i13.SplashsreenModel>(() =>
      _i13.SplashsreenModel(get<_i6.SharedPreferences>(), get<_i8.Dio>()));
  gh.lazySingleton<_i14.SubCategoryAPI>(
      () => _i14.SubCategoryAPI(get<_i8.Dio>()));
  gh.lazySingleton<_i15.SubCategoryDataSource>(
      () => _i15.SubCategoryDataSourceImpl(get<_i14.SubCategoryAPI>()));
  gh.lazySingleton<_i16.CartAPI>(() => _i16.CartAPI(get<_i8.Dio>()));
  gh.lazySingleton<_i17.CartDataSource>(
      () => _i17.CartDataSourceImpl(get<_i16.CartAPI>()));
  gh.lazySingleton<_i18.CartUserCase>(
      () => _i18.CartUserCase(get<_i17.CartDataSource>()));
  gh.lazySingleton<_i19.CategoryAPI>(() => _i19.CategoryAPI(get<_i8.Dio>()));
  gh.lazySingleton<_i20.CategoryDataSource>(
      () => _i20.CategoryDataSourceImpl(get<_i19.CategoryAPI>()));
  gh.lazySingleton<_i21.CategoryUserCase>(
      () => _i21.CategoryUserCase(get<_i20.CategoryDataSource>()));
  gh.factory<_i22.HomePageModel>(() => _i22.HomePageModel(
      get<_i21.CategoryUserCase>(),
      get<_i12.ProductUserCase>(),
      get<_i18.CartUserCase>()));
  gh.lazySingleton<_i23.MainPageModel>(
      () => _i23.MainPageModel(get<_i18.CartUserCase>()));
  gh.factory<_i24.ProductCartModel>(() => _i24.ProductCartModel(
      get<_i18.CartUserCase>(), get<_i23.MainPageModel>()));
  gh.factory<_i25.ProductDetailModel>(
      () => _i25.ProductDetailModel(get<_i12.ProductUserCase>()));
  gh.lazySingleton<_i26.SubCateUserCase>(
      () => _i26.SubCateUserCase(get<_i15.SubCategoryDataSource>()));
  gh.factory<_i27.SubCategoryModel>(() => _i27.SubCategoryModel(
      get<_i12.ProductUserCase>(), get<_i26.SubCateUserCase>()));
  gh.lazySingleton<_i28.CartModel>(() =>
      _i28.CartModel(get<_i18.CartUserCase>(), get<_i23.MainPageModel>()));
  return get;
}

class _$ModuleRegister extends _i5.ModuleRegister {}
