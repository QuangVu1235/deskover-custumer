// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../main.dart' as _i11;
import '../apis/cart/cart_datasource.dart' as _i21;
import '../apis/cart/service/cart_api.dart' as _i20;
import '../apis/category/category_datasource.dart' as _i24;
import '../apis/category/service/category_api.dart' as _i23;
import '../apis/product/product_datasoure.dart' as _i13;
import '../apis/product/service/product_api.dart' as _i12;
import '../apis/shipping_payment_status/service/method_order_api.dart' as _i10;
import '../apis/subcategory/service/subcategory_api.dart' as _i16;
import '../apis/subcategory/subcategory_datasource.dart' as _i17;
import '../apis/user_addrees/service/user_address_api.dart' as _i18;
import '../apis/user_addrees/user_address_datasource.dart' as _i19;
import '../core/dio_cache/dio_cache_manager.dart' as _i3;
import '../modules/address/address_model.dart' as _i5;
import '../modules/exchange_points/cart_model.dart' as _i32;
import '../modules/homepage/homepage_model.dart' as _i26;
import '../modules/main_page_model.dart' as _i27;
import '../modules/product_widget/product_detail_model.dart' as _i29;
import '../modules/product_widget/product_model.dart' as _i28;
import '../modules/signin_signup/app/form_pass/form_pass_model.dart' as _i4;
import '../modules/signin_signup/app/signin/app/signin_model.dart' as _i8;
import '../modules/splashsreen/splashsreen_model.dart' as _i15;
import '../modules/subcategory/subcategory_model.dart' as _i31;
import '../usecases/cart_usercase/cart_usercase.dart' as _i22;
import '../usecases/category_usercase/category_usercase.dart' as _i25;
import '../usecases/category_usercase/product_usercase.dart' as _i14;
import '../usecases/subcategory_usercase/subcategory_usercase.dart' as _i30;
import 'injection_config.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final moduleRegister = _$ModuleRegister();
  gh.lazySingleton<_i3.DioCacheManager>(() => moduleRegister.getDioCache());
  gh.factory<_i4.FormPassModel>(() => _i4.FormPassModel());
  gh.factory<_i5.NotAddressModel>(() => _i5.NotAddressModel());
  gh.singleton<_i6.NumCartDetail>(_i6.NumCartDetail(),
      dispose: (i) => i.disposeCartNumberStream());
  gh.singleton<_i6.NumCartPoint>(_i6.NumCartPoint(),
      dispose: (i) => i.disposeCartNumberStream());
  await gh.factoryAsync<_i7.SharedPreferences>(
      () => moduleRegister.sharedPreferences(),
      preResolve: true);
  gh.factory<_i8.SigninModel>(() => _i8.SigninModel());
  gh.lazySingleton<_i9.Dio>(() => moduleRegister.getDio(
      get<_i7.SharedPreferences>(), get<_i3.DioCacheManager>()));
  gh.lazySingleton<_i10.MethodOrderApi>(
      () => _i10.MethodOrderApi(get<_i9.Dio>()));
  gh.factory<_i11.MyApp>(() => _i11.MyApp(get<_i7.SharedPreferences>()));
  gh.lazySingleton<_i12.ProductAPI>(() => _i12.ProductAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i13.ProductDataSource>(
      () => _i13.ProductDataSourceImpl(get<_i12.ProductAPI>()));
  gh.lazySingleton<_i14.ProductUserCase>(
      () => _i14.ProductUserCase(get<_i13.ProductDataSource>()));
  gh.lazySingleton<_i15.SplashsreenModel>(() =>
      _i15.SplashsreenModel(get<_i7.SharedPreferences>(), get<_i9.Dio>()));
  gh.lazySingleton<_i16.SubCategoryAPI>(
      () => _i16.SubCategoryAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i17.SubCategoryDataSource>(
      () => _i17.SubCategoryDataSourceImpl(get<_i16.SubCategoryAPI>()));
  gh.lazySingleton<_i18.UserAddressApi>(
      () => _i18.UserAddressApi(get<_i9.Dio>()));
  gh.lazySingleton<_i19.UserAddressDataSource>(
      () => _i19.UserAddressDataSourceIpml(get<_i18.UserAddressApi>()));
  gh.lazySingleton<_i20.CartAPI>(() => _i20.CartAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i21.CartDataSource>(
      () => _i21.CartDataSourceImpl(get<_i20.CartAPI>()));
  gh.lazySingleton<_i22.CartUserCase>(() => _i22.CartUserCase(
      get<_i21.CartDataSource>(), get<_i19.UserAddressDataSource>()));
  gh.lazySingleton<_i23.CategoryAPI>(() => _i23.CategoryAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i24.CategoryDataSource>(
      () => _i24.CategoryDataSourceImpl(get<_i23.CategoryAPI>()));
  gh.lazySingleton<_i25.CategoryUserCase>(
      () => _i25.CategoryUserCase(get<_i24.CategoryDataSource>()));
  gh.factory<_i26.HomePageModel>(() => _i26.HomePageModel(
      get<_i25.CategoryUserCase>(),
      get<_i14.ProductUserCase>(),
      get<_i22.CartUserCase>()));
  gh.lazySingleton<_i27.MainPageModel>(
      () => _i27.MainPageModel(get<_i22.CartUserCase>()));
  gh.factory<_i28.ProductCartModel>(() => _i28.ProductCartModel(
      get<_i22.CartUserCase>(), get<_i27.MainPageModel>()));
  gh.factory<_i29.ProductDetailModel>(
      () => _i29.ProductDetailModel(get<_i14.ProductUserCase>()));
  gh.lazySingleton<_i30.SubCateUserCase>(
      () => _i30.SubCateUserCase(get<_i17.SubCategoryDataSource>()));
  gh.factory<_i31.SubCategoryModel>(() => _i31.SubCategoryModel(
      get<_i14.ProductUserCase>(), get<_i30.SubCateUserCase>()));
  gh.lazySingleton<_i32.CartModel>(() =>
      _i32.CartModel(get<_i22.CartUserCase>(), get<_i27.MainPageModel>()));
  return get;
}

class _$ModuleRegister extends _i6.ModuleRegister {}
