// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../main.dart' as _i12;
import '../apis/addrees/add_addrees_datasource.dart' as _i26;
import '../apis/addrees/service/add_addrees_api.dart' as _i25;
import '../apis/cart/cart_datasource.dart' as _i29;
import '../apis/cart/service/cart_api.dart' as _i28;
import '../apis/category/category_datasource.dart' as _i31;
import '../apis/category/service/category_api.dart' as _i30;
import '../apis/login/login_datasource.dart' as _i10;
import '../apis/login/service/login_api.dart' as _i9;
import '../apis/order/order_datasource.dart' as _i14;
import '../apis/order/service/order_api.dart' as _i13;
import '../apis/product/product_datasoure.dart' as _i17;
import '../apis/product/service/product_api.dart' as _i16;
import '../apis/shipping_payment_status/method_datasource.dart' as _i34;
import '../apis/shipping_payment_status/service/method_order_api.dart' as _i11;
import '../apis/subcategory/service/subcategory_api.dart' as _i21;
import '../apis/subcategory/subcategory_datasource.dart' as _i22;
import '../apis/user_addrees/service/user_address_api.dart' as _i23;
import '../apis/user_addrees/user_address_datasource.dart' as _i24;
import '../core/dio_cache/dio_cache_manager.dart' as _i3;
import '../modules/action/search/search_model.dart' as _i37;
import '../modules/address/add_addrees/add_address_model.dart' as _i44;
import '../modules/address/address_model.dart' as _i5;
import '../modules/cart/cart_model.dart' as _i45;
import '../modules/homepage/homepage_model.dart' as _i41;
import '../modules/homepage/widgets/list_product_model.dart' as _i33;
import '../modules/main_page_model.dart' as _i42;
import '../modules/product_widget/product_detail_model.dart' as _i35;
import '../modules/product_widget/product_model.dart' as _i43;
import '../modules/product_widget/product_selling/product_selling_model.dart'
    as _i36;
import '../modules/signin_signup/app/form_pass/form_pass_model.dart' as _i4;
import '../modules/signin_signup/app/signin/app/signin_model.dart' as _i19;
import '../modules/splashsreen/splashsreen_model.dart' as _i20;
import '../modules/subcategory/subcategory_model.dart' as _i39;
import '../usecases/add_addrees_usercase/add_addrees_usercase.dart' as _i27;
import '../usecases/cart_usercase/cart_usercase.dart' as _i40;
import '../usecases/category_usercase/category_usercase.dart' as _i32;
import '../usecases/category_usercase/product_usercase.dart' as _i18;
import '../usecases/order/order_usercase.dart' as _i15;
import '../usecases/subcategory_usercase/subcategory_usercase.dart' as _i38;
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
  gh.lazySingleton<_i8.Dio>(() => moduleRegister.getDio(
      get<_i7.SharedPreferences>(), get<_i3.DioCacheManager>()));
  gh.lazySingleton<_i9.LoginAPI>(() => _i9.LoginAPI(get<_i8.Dio>()));
  gh.lazySingleton<_i10.LoginDataSource>(
      () => _i10.LoginDataSourceImpl(get<_i9.LoginAPI>()));
  gh.lazySingleton<_i11.MethodOrderApi>(
      () => _i11.MethodOrderApi(get<_i8.Dio>()));
  gh.factory<_i12.MyApp>(() => _i12.MyApp(get<_i7.SharedPreferences>()));
  gh.lazySingleton<_i13.OrderAPI>(() => _i13.OrderAPI(get<_i8.Dio>()));
  gh.lazySingleton<_i14.OrderDataSource>(
      () => _i14.OrderDataSourceImpl(get<_i13.OrderAPI>()));
  gh.lazySingleton<_i15.OrderUserCase>(
      () => _i15.OrderUserCase(get<_i14.OrderDataSource>()));
  gh.lazySingleton<_i16.ProductAPI>(() => _i16.ProductAPI(get<_i8.Dio>()));
  gh.lazySingleton<_i17.ProductDataSource>(
      () => _i17.ProductDataSourceImpl(get<_i16.ProductAPI>()));
  gh.lazySingleton<_i18.ProductUserCase>(
      () => _i18.ProductUserCase(get<_i17.ProductDataSource>()));
  gh.factory<_i19.SigninModel>(() => _i19.SigninModel(
      get<_i7.SharedPreferences>(), get<_i10.LoginDataSource>()));
  gh.lazySingleton<_i20.SplashsreenModel>(() =>
      _i20.SplashsreenModel(get<_i7.SharedPreferences>(), get<_i8.Dio>()));
  gh.lazySingleton<_i21.SubCategoryAPI>(
      () => _i21.SubCategoryAPI(get<_i8.Dio>()));
  gh.lazySingleton<_i22.SubCategoryDataSource>(
      () => _i22.SubCategoryDataSourceImpl(get<_i21.SubCategoryAPI>()));
  gh.lazySingleton<_i23.UserAddressApi>(
      () => _i23.UserAddressApi(get<_i8.Dio>()));
  gh.lazySingleton<_i24.UserAddressDataSource>(
      () => _i24.UserAddressDataSourceIpml(get<_i23.UserAddressApi>()));
  gh.lazySingleton<_i25.AddAddreesAPI>(
      () => _i25.AddAddreesAPI(get<_i8.Dio>()));
  gh.lazySingleton<_i26.AddAddreesDataSource>(
      () => _i26.AddAddreesDataSourceImpl(get<_i25.AddAddreesAPI>()));
  gh.lazySingleton<_i27.AddAddreesUserCase>(
      () => _i27.AddAddreesUserCase(get<_i26.AddAddreesDataSource>()));
  gh.lazySingleton<_i28.CartAPI>(() => _i28.CartAPI(get<_i8.Dio>()));
  gh.lazySingleton<_i29.CartDataSource>(
      () => _i29.CartDataSourceImpl(get<_i28.CartAPI>()));
  gh.lazySingleton<_i30.CategoryAPI>(() => _i30.CategoryAPI(get<_i8.Dio>()));
  gh.lazySingleton<_i31.CategoryDataSource>(
      () => _i31.CategoryDataSourceImpl(get<_i30.CategoryAPI>()));
  gh.lazySingleton<_i32.CategoryUserCase>(
      () => _i32.CategoryUserCase(get<_i31.CategoryDataSource>()));
  gh.factory<_i33.ListProductModel>(
      () => _i33.ListProductModel(get<_i18.ProductUserCase>()));
  gh.lazySingleton<_i34.MethodDataSource>(
      () => _i34.MethodDataSourceImpl(get<_i11.MethodOrderApi>()));
  gh.factory<_i35.ProductDetailModel>(
      () => _i35.ProductDetailModel(get<_i18.ProductUserCase>()));
  gh.factory<_i36.ProductSellingModel>(
      () => _i36.ProductSellingModel(get<_i18.ProductUserCase>()));
  gh.lazySingleton<_i37.SearchModel>(() => _i37.SearchModel(
      get<_i18.ProductUserCase>(), get<_i32.CategoryUserCase>()));
  gh.lazySingleton<_i38.SubCateUserCase>(
      () => _i38.SubCateUserCase(get<_i22.SubCategoryDataSource>()));
  gh.factory<_i39.SubCategoryModel>(() => _i39.SubCategoryModel(
      get<_i18.ProductUserCase>(), get<_i38.SubCateUserCase>()));
  gh.lazySingleton<_i40.CartUserCase>(() => _i40.CartUserCase(
      get<_i29.CartDataSource>(),
      get<_i24.UserAddressDataSource>(),
      get<_i34.MethodDataSource>()));
  gh.factory<_i41.HomePageModel>(() => _i41.HomePageModel(
      get<_i32.CategoryUserCase>(),
      get<_i18.ProductUserCase>(),
      get<_i40.CartUserCase>()));
  gh.lazySingleton<_i42.MainPageModel>(
      () => _i42.MainPageModel(get<_i40.CartUserCase>()));
  gh.factory<_i43.ProductCartModel>(() => _i43.ProductCartModel(
      get<_i40.CartUserCase>(), get<_i42.MainPageModel>()));
  gh.factory<_i44.AddAddressModel>(() => _i44.AddAddressModel(
      get<_i27.AddAddreesUserCase>(), get<_i40.CartUserCase>()));
  gh.lazySingleton<_i45.CartModel>(() => _i45.CartModel(
      get<_i40.CartUserCase>(),
      get<_i42.MainPageModel>(),
      get<_i15.OrderUserCase>()));
  return get;
}

class _$ModuleRegister extends _i6.ModuleRegister {}
