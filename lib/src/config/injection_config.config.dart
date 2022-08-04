// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../main.dart' as _i13;
import '../apis/addrees/add_addrees_datasource.dart' as _i28;
import '../apis/addrees/service/add_addrees_api.dart' as _i27;
import '../apis/cart/cart_datasource.dart' as _i31;
import '../apis/cart/service/cart_api.dart' as _i30;
import '../apis/category/category_datasource.dart' as _i33;
import '../apis/category/service/category_api.dart' as _i32;
import '../apis/login/login_datasource.dart' as _i11;
import '../apis/login/service/login_api.dart' as _i10;
import '../apis/order/order_datasource.dart' as _i15;
import '../apis/order/service/order_api.dart' as _i14;
import '../apis/product/product_datasoure.dart' as _i18;
import '../apis/product/service/product_api.dart' as _i17;
import '../apis/shipping_payment_status/method_datasource.dart' as _i37;
import '../apis/shipping_payment_status/service/method_order_api.dart' as _i12;
import '../apis/subcategory/service/subcategory_api.dart' as _i22;
import '../apis/subcategory/subcategory_datasource.dart' as _i23;
import '../apis/user_addrees/service/user_address_api.dart' as _i24;
import '../apis/user_addrees/user_address_datasource.dart' as _i25;
import '../core/dio_cache/dio_cache_manager.dart' as _i3;
import '../modules/action/search/search_model.dart' as _i41;
import '../modules/address/add_addrees/add_address_model.dart' as _i49;
import '../modules/address/address_model.dart' as _i51;
import '../modules/cart/cart_model.dart' as _i50;
import '../modules/homepage/homepage_model.dart' as _i46;
import '../modules/homepage/widgets/list_product_model.dart' as _i36;
import '../modules/main_page_model.dart' as _i47;
import '../modules/product_widget/product_detail_model.dart' as _i38;
import '../modules/product_widget/product_model.dart' as _i48;
import '../modules/product_widget/product_selling/product_selling_model.dart'
    as _i39;
import '../modules/profile/managerorder/manager_model.dart' as _i5;
import '../modules/profile/product/pur_product_model.dart' as _i7;
import '../modules/profile/profile_model.dart' as _i40;
import '../modules/profile/setting/password/change_password_model.dart' as _i35;
import '../modules/profile/setting/setting_profile_model.dart' as _i42;
import '../modules/signin_signup/app/form_pass/form_pass_model.dart' as _i4;
import '../modules/signin_signup/app/signin/app/signin_model.dart' as _i20;
import '../modules/splashsreen/splashsreen_model.dart' as _i21;
import '../modules/subcategory/subcategory_model.dart' as _i44;
import '../usecases/add_addrees_usercase/add_addrees_usercase.dart' as _i29;
import '../usecases/cart_usercase/cart_usercase.dart' as _i45;
import '../usecases/category_usercase/category_usercase.dart' as _i34;
import '../usecases/category_usercase/product_usercase.dart' as _i19;
import '../usecases/order/order_usercase.dart' as _i16;
import '../usecases/subcategory_usercase/subcategory_usercase.dart' as _i43;
import '../usecases/user_usercase.dart' as _i26;
import 'injection_config.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final moduleRegister = _$ModuleRegister();
  gh.lazySingleton<_i3.DioCacheManager>(() => moduleRegister.getDioCache());
  gh.factory<_i4.FormPassModel>(() => _i4.FormPassModel());
  gh.factory<_i5.ManagerOrderModel>(() => _i5.ManagerOrderModel());
  gh.singleton<_i6.NumCartDetail>(_i6.NumCartDetail(),
      dispose: (i) => i.disposeCartNumberStream());
  gh.singleton<_i6.NumCartPoint>(_i6.NumCartPoint(),
      dispose: (i) => i.disposeCartNumberStream());
  gh.factory<_i7.PurchasedProductModel>(() => _i7.PurchasedProductModel());
  await gh.factoryAsync<_i8.SharedPreferences>(
      () => moduleRegister.sharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i9.Dio>(() => moduleRegister.getDio(
      get<_i8.SharedPreferences>(), get<_i3.DioCacheManager>()));
  gh.lazySingleton<_i10.LoginAPI>(() => _i10.LoginAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i11.LoginDataSource>(
      () => _i11.LoginDataSourceImpl(get<_i10.LoginAPI>()));
  gh.lazySingleton<_i12.MethodOrderApi>(
      () => _i12.MethodOrderApi(get<_i9.Dio>()));
  gh.factory<_i13.MyApp>(() => _i13.MyApp(get<_i8.SharedPreferences>()));
  gh.lazySingleton<_i14.OrderAPI>(() => _i14.OrderAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i15.OrderDataSource>(
      () => _i15.OrderDataSourceImpl(get<_i14.OrderAPI>()));
  gh.lazySingleton<_i16.OrderUserCase>(
      () => _i16.OrderUserCase(get<_i15.OrderDataSource>()));
  gh.lazySingleton<_i17.ProductAPI>(() => _i17.ProductAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i18.ProductDataSource>(
      () => _i18.ProductDataSourceImpl(get<_i17.ProductAPI>()));
  gh.lazySingleton<_i19.ProductUserCase>(
      () => _i19.ProductUserCase(get<_i18.ProductDataSource>()));
  gh.factory<_i20.SigninModel>(() => _i20.SigninModel(
      get<_i8.SharedPreferences>(), get<_i11.LoginDataSource>()));
  gh.lazySingleton<_i21.SplashsreenModel>(() =>
      _i21.SplashsreenModel(get<_i8.SharedPreferences>(), get<_i9.Dio>()));
  gh.lazySingleton<_i22.SubCategoryAPI>(
      () => _i22.SubCategoryAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i23.SubCategoryDataSource>(
      () => _i23.SubCategoryDataSourceImpl(get<_i22.SubCategoryAPI>()));
  gh.lazySingleton<_i24.UserAddressApi>(
      () => _i24.UserAddressApi(get<_i9.Dio>()));
  gh.lazySingleton<_i25.UserAddressDataSource>(
      () => _i25.UserAddressDataSourceIpml(get<_i24.UserAddressApi>()));
  gh.lazySingleton<_i26.UserUserCase>(() => _i26.UserUserCase(
      get<_i11.LoginDataSource>(), get<_i25.UserAddressDataSource>()));
  gh.lazySingleton<_i27.AddAddreesAPI>(
      () => _i27.AddAddreesAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i28.AddAddreesDataSource>(
      () => _i28.AddAddreesDataSourceImpl(get<_i27.AddAddreesAPI>()));
  gh.lazySingleton<_i29.AddAddreesUserCase>(
      () => _i29.AddAddreesUserCase(get<_i28.AddAddreesDataSource>()));
  gh.lazySingleton<_i30.CartAPI>(() => _i30.CartAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i31.CartDataSource>(
      () => _i31.CartDataSourceImpl(get<_i30.CartAPI>()));
  gh.lazySingleton<_i32.CategoryAPI>(() => _i32.CategoryAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i33.CategoryDataSource>(
      () => _i33.CategoryDataSourceImpl(get<_i32.CategoryAPI>()));
  gh.lazySingleton<_i34.CategoryUserCase>(
      () => _i34.CategoryUserCase(get<_i33.CategoryDataSource>()));
  gh.factory<_i35.ChangePasswordModel>(
      () => _i35.ChangePasswordModel(get<_i26.UserUserCase>()));
  gh.factory<_i36.ListProductModel>(
      () => _i36.ListProductModel(get<_i19.ProductUserCase>()));
  gh.lazySingleton<_i37.MethodDataSource>(
      () => _i37.MethodDataSourceImpl(get<_i12.MethodOrderApi>()));
  gh.factory<_i38.ProductDetailModel>(
      () => _i38.ProductDetailModel(get<_i19.ProductUserCase>()));
  gh.factory<_i39.ProductSellingModel>(
      () => _i39.ProductSellingModel(get<_i19.ProductUserCase>()));
  gh.factory<_i40.ProfileModel>(() => _i40.ProfileModel(
      get<_i8.SharedPreferences>(), get<_i26.UserUserCase>()));
  gh.lazySingleton<_i41.SearchModel>(() => _i41.SearchModel(
      get<_i19.ProductUserCase>(), get<_i34.CategoryUserCase>()));
  gh.factory<_i42.SettingProfileModel>(
      () => _i42.SettingProfileModel(get<_i26.UserUserCase>()));
  gh.lazySingleton<_i43.SubCateUserCase>(
      () => _i43.SubCateUserCase(get<_i23.SubCategoryDataSource>()));
  gh.factory<_i44.SubCategoryModel>(() => _i44.SubCategoryModel(
      get<_i19.ProductUserCase>(), get<_i43.SubCateUserCase>()));
  gh.lazySingleton<_i45.CartUserCase>(() => _i45.CartUserCase(
      get<_i31.CartDataSource>(),
      get<_i25.UserAddressDataSource>(),
      get<_i37.MethodDataSource>()));
  gh.factory<_i46.HomePageModel>(() => _i46.HomePageModel(
      get<_i34.CategoryUserCase>(),
      get<_i19.ProductUserCase>(),
      get<_i45.CartUserCase>()));
  gh.lazySingleton<_i47.MainPageModel>(
      () => _i47.MainPageModel(get<_i45.CartUserCase>()));
  gh.factory<_i48.ProductCartModel>(() => _i48.ProductCartModel(
      get<_i45.CartUserCase>(), get<_i47.MainPageModel>()));
  gh.factory<_i49.AddAddressModel>(() => _i49.AddAddressModel(
      get<_i29.AddAddreesUserCase>(), get<_i45.CartUserCase>()));
  gh.lazySingleton<_i50.CartModel>(() => _i50.CartModel(
      get<_i45.CartUserCase>(),
      get<_i47.MainPageModel>(),
      get<_i16.OrderUserCase>()));
  gh.factory<_i51.NotAddressModel>(() =>
      _i51.NotAddressModel(get<_i45.CartUserCase>(), get<_i50.CartModel>()));
  return get;
}

class _$ModuleRegister extends _i6.ModuleRegister {}
