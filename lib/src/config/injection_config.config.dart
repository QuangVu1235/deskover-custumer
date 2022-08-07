// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../main.dart' as _i13;
import '../apis/addrees/add_addrees_datasource.dart' as _i32;
import '../apis/addrees/service/add_addrees_api.dart' as _i31;
import '../apis/cart/cart_datasource.dart' as _i35;
import '../apis/cart/service/cart_api.dart' as _i34;
import '../apis/category/category_datasource.dart' as _i37;
import '../apis/category/service/category_api.dart' as _i36;
import '../apis/login/login_datasource.dart' as _i11;
import '../apis/login/service/login_api.dart' as _i10;
import '../apis/notify/service/notify_api.dart' as _i14;
import '../apis/order/order_datasource.dart' as _i18;
import '../apis/order/service/order_api.dart' as _i17;
import '../apis/product/product_datasoure.dart' as _i22;
import '../apis/product/service/product_api.dart' as _i21;
import '../apis/shipping_payment_status/method_datasource.dart' as _i42;
import '../apis/shipping_payment_status/service/method_order_api.dart' as _i12;
import '../apis/subcategory/service/subcategory_api.dart' as _i26;
import '../apis/subcategory/subcategory_datasource.dart' as _i27;
import '../apis/user_addrees/service/user_address_api.dart' as _i28;
import '../apis/user_addrees/user_address_datasource.dart' as _i29;
import '../core/dio_cache/dio_cache_manager.dart' as _i3;
import '../modules/action/search/search_model.dart' as _i46;
import '../modules/address/add_addrees/add_address_model.dart' as _i54;
import '../modules/address/address_model.dart' as _i56;
import '../modules/cart/cart_model.dart' as _i55;
import '../modules/homepage/homepage_model.dart' as _i51;
import '../modules/homepage/widgets/list_product_model.dart' as _i41;
import '../modules/main_page_model.dart' as _i52;
import '../modules/notification/datasource/notify_datasource.dart' as _i15;
import '../modules/notification/notifi_model.dart' as _i16;
import '../modules/order/all_order/list_order_model.dart' as _i40;
import '../modules/order/order_manager_model.dart' as _i19;
import '../modules/product_widget/product_detail_model.dart' as _i43;
import '../modules/product_widget/product_model.dart' as _i53;
import '../modules/product_widget/product_selling/product_selling_model.dart'
    as _i44;
import '../modules/profile/managerorder/manager_model.dart' as _i5;
import '../modules/profile/product/pur_product_model.dart' as _i7;
import '../modules/profile/profile_model.dart' as _i45;
import '../modules/profile/setting/password/change_password_model.dart' as _i39;
import '../modules/profile/setting/setting_profile_model.dart' as _i47;
import '../modules/signin_signup/app/form_pass/form_pass_model.dart' as _i4;
import '../modules/signin_signup/app/signin/app/signin_model.dart' as _i24;
import '../modules/splashsreen/splashsreen_model.dart' as _i25;
import '../modules/subcategory/subcategory_model.dart' as _i49;
import '../usecases/add_addrees_usercase/add_addrees_usercase.dart' as _i33;
import '../usecases/cart_usercase/cart_usercase.dart' as _i50;
import '../usecases/category_usercase/category_usercase.dart' as _i38;
import '../usecases/category_usercase/product_usercase.dart' as _i23;
import '../usecases/order/order_usercase.dart' as _i20;
import '../usecases/subcategory_usercase/subcategory_usercase.dart' as _i48;
import '../usecases/user_usercase.dart' as _i30;
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
  gh.lazySingleton<_i14.NotifyApi>(() => _i14.NotifyApi(get<_i9.Dio>()));
  gh.lazySingleton<_i15.NotifyDatasoure>(
      () => _i15.NotifyDatasoureImpl(get<_i14.NotifyApi>()));
  gh.factory<_i16.NotifyModel>(() =>
      _i16.NotifyModel(get<_i14.NotifyApi>(), get<_i15.NotifyDatasoure>()));
  gh.lazySingleton<_i17.OrderAPI>(() => _i17.OrderAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i18.OrderDataSource>(() =>
      _i18.OrderDataSourceImpl(get<_i17.OrderAPI>(), get<_i14.NotifyApi>()));
  gh.factory<_i19.OrderManagerModel>(() => _i19.OrderManagerModel(
      get<_i18.OrderDataSource>(), get<_i14.NotifyApi>()));
  gh.lazySingleton<_i20.OrderUserCase>(
      () => _i20.OrderUserCase(get<_i18.OrderDataSource>()));
  gh.lazySingleton<_i21.ProductAPI>(() => _i21.ProductAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i22.ProductDataSource>(
      () => _i22.ProductDataSourceImpl(get<_i21.ProductAPI>()));
  gh.lazySingleton<_i23.ProductUserCase>(
      () => _i23.ProductUserCase(get<_i22.ProductDataSource>()));
  gh.factory<_i24.SigninModel>(() => _i24.SigninModel(
      get<_i8.SharedPreferences>(), get<_i11.LoginDataSource>()));
  gh.lazySingleton<_i25.SplashsreenModel>(() =>
      _i25.SplashsreenModel(get<_i8.SharedPreferences>(), get<_i9.Dio>()));
  gh.lazySingleton<_i26.SubCategoryAPI>(
      () => _i26.SubCategoryAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i27.SubCategoryDataSource>(
      () => _i27.SubCategoryDataSourceImpl(get<_i26.SubCategoryAPI>()));
  gh.lazySingleton<_i28.UserAddressApi>(
      () => _i28.UserAddressApi(get<_i9.Dio>()));
  gh.lazySingleton<_i29.UserAddressDataSource>(
      () => _i29.UserAddressDataSourceIpml(get<_i28.UserAddressApi>()));
  gh.lazySingleton<_i30.UserUserCase>(() => _i30.UserUserCase(
      get<_i11.LoginDataSource>(), get<_i29.UserAddressDataSource>()));
  gh.lazySingleton<_i31.AddAddreesAPI>(
      () => _i31.AddAddreesAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i32.AddAddreesDataSource>(
      () => _i32.AddAddreesDataSourceImpl(get<_i31.AddAddreesAPI>()));
  gh.lazySingleton<_i33.AddAddreesUserCase>(
      () => _i33.AddAddreesUserCase(get<_i32.AddAddreesDataSource>()));
  gh.lazySingleton<_i34.CartAPI>(() => _i34.CartAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i35.CartDataSource>(
      () => _i35.CartDataSourceImpl(get<_i34.CartAPI>()));
  gh.lazySingleton<_i36.CategoryAPI>(() => _i36.CategoryAPI(get<_i9.Dio>()));
  gh.lazySingleton<_i37.CategoryDataSource>(
      () => _i37.CategoryDataSourceImpl(get<_i36.CategoryAPI>()));
  gh.lazySingleton<_i38.CategoryUserCase>(
      () => _i38.CategoryUserCase(get<_i37.CategoryDataSource>()));
  gh.factory<_i39.ChangePasswordModel>(
      () => _i39.ChangePasswordModel(get<_i30.UserUserCase>()));
  gh.factory<_i40.ListOrderModel>(
      () => _i40.ListOrderModel(get<_i18.OrderDataSource>()));
  gh.factory<_i41.ListProductModel>(
      () => _i41.ListProductModel(get<_i23.ProductUserCase>()));
  gh.lazySingleton<_i42.MethodDataSource>(
      () => _i42.MethodDataSourceImpl(get<_i12.MethodOrderApi>()));
  gh.factory<_i43.ProductDetailModel>(
      () => _i43.ProductDetailModel(get<_i23.ProductUserCase>()));
  gh.factory<_i44.ProductSellingModel>(
      () => _i44.ProductSellingModel(get<_i23.ProductUserCase>()));
  gh.factory<_i45.ProfileModel>(() => _i45.ProfileModel(
      get<_i8.SharedPreferences>(), get<_i30.UserUserCase>()));
  gh.lazySingleton<_i46.SearchModel>(() => _i46.SearchModel(
      get<_i23.ProductUserCase>(), get<_i38.CategoryUserCase>()));
  gh.factory<_i47.SettingProfileModel>(
      () => _i47.SettingProfileModel(get<_i30.UserUserCase>()));
  gh.lazySingleton<_i48.SubCateUserCase>(
      () => _i48.SubCateUserCase(get<_i27.SubCategoryDataSource>()));
  gh.factory<_i49.SubCategoryModel>(() => _i49.SubCategoryModel(
      get<_i23.ProductUserCase>(), get<_i48.SubCateUserCase>()));
  gh.lazySingleton<_i50.CartUserCase>(() => _i50.CartUserCase(
      get<_i35.CartDataSource>(),
      get<_i29.UserAddressDataSource>(),
      get<_i42.MethodDataSource>()));
  gh.factory<_i51.HomePageModel>(() => _i51.HomePageModel(
      get<_i38.CategoryUserCase>(),
      get<_i23.ProductUserCase>(),
      get<_i50.CartUserCase>()));
  gh.lazySingleton<_i52.MainPageModel>(() => _i52.MainPageModel(
      get<_i50.CartUserCase>(),
      get<_i14.NotifyApi>(),
      get<_i15.NotifyDatasoure>()));
  gh.factory<_i53.ProductCartModel>(() => _i53.ProductCartModel(
      get<_i50.CartUserCase>(), get<_i52.MainPageModel>()));
  gh.factory<_i54.AddAddressModel>(() => _i54.AddAddressModel(
      get<_i33.AddAddreesUserCase>(), get<_i50.CartUserCase>()));
  gh.lazySingleton<_i55.CartModel>(() => _i55.CartModel(
      get<_i50.CartUserCase>(),
      get<_i52.MainPageModel>(),
      get<_i20.OrderUserCase>()));
  gh.factory<_i56.NotAddressModel>(() =>
      _i56.NotAddressModel(get<_i50.CartUserCase>(), get<_i55.CartModel>()));
  return get;
}

class _$ModuleRegister extends _i6.ModuleRegister {}
