// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../main.dart' as _i11;
import '../apis/cart/cart_datasource.dart' as _i24;
import '../apis/cart/service/cart_api.dart' as _i23;
import '../apis/category/category_datasource.dart' as _i26;
import '../apis/category/service/category_api.dart' as _i25;
import '../apis/order/order_datasource.dart' as _i13;
import '../apis/order/service/order_api.dart' as _i12;
import '../apis/product/product_datasoure.dart' as _i16;
import '../apis/product/service/product_api.dart' as _i15;
import '../apis/shipping_payment_status/method_datasource.dart' as _i28;
import '../apis/shipping_payment_status/service/method_order_api.dart' as _i10;
import '../apis/subcategory/service/subcategory_api.dart' as _i19;
import '../apis/subcategory/subcategory_datasource.dart' as _i20;
import '../apis/user_addrees/service/user_address_api.dart' as _i21;
import '../apis/user_addrees/user_address_datasource.dart' as _i22;
import '../core/dio_cache/dio_cache_manager.dart' as _i3;
import '../modules/address/address_model.dart' as _i5;
import '../modules/cart/cart_model.dart' as _i36;
import '../modules/homepage/homepage_model.dart' as _i33;
import '../modules/main_page_model.dart' as _i34;
import '../modules/product_widget/product_detail_model.dart' as _i29;
import '../modules/product_widget/product_model.dart' as _i35;
import '../modules/signin_signup/app/form_pass/form_pass_model.dart' as _i4;
import '../modules/signin_signup/app/signin/app/signin_model.dart' as _i8;
import '../modules/splashsreen/splashsreen_model.dart' as _i18;
import '../modules/subcategory/subcategory_model.dart' as _i31;
import '../usecases/cart_usercase/cart_usercase.dart' as _i32;
import '../usecases/category_usercase/category_usercase.dart' as _i27;
import '../usecases/category_usercase/product_usercase.dart' as _i17;
import '../usecases/order/order_usercase.dart' as _i14;
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
  gh.lazySingleton<_i12.OrderAPI>(() => _i12.OrderAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i13.OrderDataSource>(
      () => _i13.OrderDataSourceImpl(get<_i12.OrderAPI>()));
  gh.lazySingleton<_i14.OrderUserCase>(
      () => _i14.OrderUserCase(get<_i13.OrderDataSource>()));
  gh.lazySingleton<_i15.ProductAPI>(() => _i15.ProductAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i16.ProductDataSource>(
      () => _i16.ProductDataSourceImpl(get<_i15.ProductAPI>()));
  gh.lazySingleton<_i17.ProductUserCase>(
      () => _i17.ProductUserCase(get<_i16.ProductDataSource>()));
  gh.lazySingleton<_i18.SplashsreenModel>(() =>
      _i18.SplashsreenModel(get<_i7.SharedPreferences>(), get<_i9.Dio>()));
  gh.lazySingleton<_i19.SubCategoryAPI>(
      () => _i19.SubCategoryAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i20.SubCategoryDataSource>(
      () => _i20.SubCategoryDataSourceImpl(get<_i19.SubCategoryAPI>()));
  gh.lazySingleton<_i21.UserAddressApi>(
      () => _i21.UserAddressApi(get<_i9.Dio>()));
  gh.lazySingleton<_i22.UserAddressDataSource>(
      () => _i22.UserAddressDataSourceIpml(get<_i21.UserAddressApi>()));
  gh.lazySingleton<_i23.CartAPI>(() => _i23.CartAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i24.CartDataSource>(
      () => _i24.CartDataSourceImpl(get<_i23.CartAPI>()));
  gh.lazySingleton<_i25.CategoryAPI>(() => _i25.CategoryAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i26.CategoryDataSource>(
      () => _i26.CategoryDataSourceImpl(get<_i25.CategoryAPI>()));
  gh.lazySingleton<_i27.CategoryUserCase>(
      () => _i27.CategoryUserCase(get<_i26.CategoryDataSource>()));
  gh.lazySingleton<_i28.MethodDataSource>(
      () => _i28.MethodDataSourceImpl(get<_i10.MethodOrderApi>()));
  gh.factory<_i29.ProductDetailModel>(
      () => _i29.ProductDetailModel(get<_i17.ProductUserCase>()));
  gh.lazySingleton<_i30.SubCateUserCase>(
      () => _i30.SubCateUserCase(get<_i20.SubCategoryDataSource>()));
  gh.factory<_i31.SubCategoryModel>(() => _i31.SubCategoryModel(
      get<_i17.ProductUserCase>(), get<_i30.SubCateUserCase>()));
  gh.lazySingleton<_i32.CartUserCase>(() => _i32.CartUserCase(
      get<_i24.CartDataSource>(),
      get<_i22.UserAddressDataSource>(),
      get<_i28.MethodDataSource>()));
  gh.factory<_i33.HomePageModel>(() => _i33.HomePageModel(
      get<_i27.CategoryUserCase>(),
      get<_i17.ProductUserCase>(),
      get<_i32.CartUserCase>()));
  gh.lazySingleton<_i34.MainPageModel>(
      () => _i34.MainPageModel(get<_i32.CartUserCase>()));
  gh.factory<_i35.ProductCartModel>(() => _i35.ProductCartModel(
      get<_i32.CartUserCase>(), get<_i34.MainPageModel>()));
  gh.lazySingleton<_i36.CartModel>(() => _i36.CartModel(
      get<_i32.CartUserCase>(),
      get<_i34.MainPageModel>(),
      get<_i14.OrderUserCase>()));
  return get;
}

class _$ModuleRegister extends _i6.ModuleRegister {}
