// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../main.dart' as _i9;
import '../apis/cart/cart_datasource.dart' as _i15;
import '../apis/cart/service/cart_api.dart' as _i14;
import '../apis/category/category_datasource.dart' as _i18;
import '../apis/category/service/category_api.dart' as _i17;
import '../apis/product/product_datasoure.dart' as _i11;
import '../apis/product/service/product_api.dart' as _i10;
import '../core/dio_cache/dio_cache_manager.dart' as _i3;
import '../modules/exchange_points/cart_model.dart' as _i23;
import '../modules/gift_exchange/product_model.dart' as _i22;
import '../modules/homepage/homepage_model.dart' as _i20;
import '../modules/main_page_model.dart' as _i21;
import '../modules/signin_signup/app/form_pass/form_pass_model.dart' as _i4;
import '../modules/signin_signup/app/signin/app/signin_model.dart' as _i7;
import '../modules/splashsreen/splashsreen_model.dart' as _i13;
import '../usecases/cart_usercase/cart_usercase.dart' as _i16;
import '../usecases/category_usercase/category_usercase.dart' as _i19;
import '../usecases/category_usercase/product_usercase.dart' as _i12;
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
  gh.lazySingleton<_i14.CartAPI>(() => _i14.CartAPI(get<_i8.Dio>()));
  gh.lazySingleton<_i15.CartDataSource>(
      () => _i15.CartDataSourceImpl(get<_i14.CartAPI>()));
  gh.lazySingleton<_i16.CartUserCase>(
      () => _i16.CartUserCase(get<_i15.CartDataSource>()));
  gh.lazySingleton<_i17.CategoryAPI>(() => _i17.CategoryAPI(get<_i8.Dio>()));
  gh.lazySingleton<_i18.CategoryDataSource>(
      () => _i18.CategoryDataSourceImpl(get<_i17.CategoryAPI>()));
  gh.lazySingleton<_i19.CategoryUserCase>(
      () => _i19.CategoryUserCase(get<_i18.CategoryDataSource>()));
  gh.factory<_i20.HomePageModel>(() => _i20.HomePageModel(
      get<_i19.CategoryUserCase>(),
      get<_i12.ProductUserCase>(),
      get<_i16.CartUserCase>()));
  gh.lazySingleton<_i21.MainPageModel>(
      () => _i21.MainPageModel(get<_i16.CartUserCase>()));
  gh.factory<_i22.ProductCartModel>(() => _i22.ProductCartModel(
      get<_i16.CartUserCase>(), get<_i21.MainPageModel>()));
  gh.lazySingleton<_i23.CartModel>(() =>
      _i23.CartModel(get<_i16.CartUserCase>(), get<_i21.MainPageModel>()));
  return get;
}

class _$ModuleRegister extends _i5.ModuleRegister {}
