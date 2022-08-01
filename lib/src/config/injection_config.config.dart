// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../main.dart' as _i14;
import '../apis/addrees/add_addrees_datasource.dart' as _i29;
import '../apis/addrees/service/add_addrees_api.dart' as _i28;
import '../apis/cart/cart_datasource.dart' as _i32;
import '../apis/cart/service/cart_api.dart' as _i31;
import '../apis/category/category_datasource.dart' as _i34;
import '../apis/category/service/category_api.dart' as _i33;
import '../apis/login/login_datasource.dart' as _i12;
import '../apis/login/service/login_api.dart' as _i11;
import '../apis/order/order_datasource.dart' as _i16;
import '../apis/order/service/order_api.dart' as _i15;
import '../apis/product/product_datasoure.dart' as _i19;
import '../apis/product/service/product_api.dart' as _i18;
import '../apis/shipping_payment_status/method_datasource.dart' as _i38;
import '../apis/shipping_payment_status/service/method_order_api.dart' as _i13;
import '../apis/subcategory/service/subcategory_api.dart' as _i23;
import '../apis/subcategory/subcategory_datasource.dart' as _i24;
import '../apis/user_addrees/service/user_address_api.dart' as _i25;
import '../apis/user_addrees/user_address_datasource.dart' as _i26;
import '../core/dio_cache/dio_cache_manager.dart' as _i3;
import '../modules/action/search/search_model.dart' as _i41;
import '../modules/address/add_addrees/add_address_model.dart' as _i49;
import '../modules/address/address_model.dart' as _i6;
import '../modules/cart/cart_model.dart' as _i50;
import '../modules/homepage/homepage_model.dart' as _i46;
import '../modules/homepage/widgets/list_product_model.dart' as _i37;
import '../modules/main_page_model.dart' as _i47;
import '../modules/product_widget/product_detail_model.dart' as _i39;
import '../modules/product_widget/product_model.dart' as _i48;
import '../modules/product_widget/product_selling/product_selling_model.dart'
    as _i40;
import '../modules/profile/managerorder/manager_model.dart' as _i5;
import '../modules/profile/product/pur_product_model.dart' as _i8;
import '../modules/profile/profile_model.dart' as _i51;
import '../modules/profile/setting/password/change_password_model.dart' as _i36;
import '../modules/profile/setting/setting_profile_model.dart' as _i42;
import '../modules/signin_signup/app/form_pass/form_pass_model.dart' as _i4;
import '../modules/signin_signup/app/signin/app/signin_model.dart' as _i21;
import '../modules/splashsreen/splashsreen_model.dart' as _i22;
import '../modules/subcategory/subcategory_model.dart' as _i44;
import '../usecases/add_addrees_usercase/add_addrees_usercase.dart' as _i30;
import '../usecases/cart_usercase/cart_usercase.dart' as _i45;
import '../usecases/category_usercase/category_usercase.dart' as _i35;
import '../usecases/category_usercase/product_usercase.dart' as _i20;
import '../usecases/order/order_usercase.dart' as _i17;
import '../usecases/subcategory_usercase/subcategory_usercase.dart' as _i43;
import '../usecases/user_usercase.dart' as _i27;
import 'injection_config.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final moduleRegister = _$ModuleRegister();
  gh.lazySingleton<_i3.DioCacheManager>(() => moduleRegister.getDioCache());
  gh.factory<_i4.FormPassModel>(() => _i4.FormPassModel());
  gh.factory<_i5.ManagerOrderModel>(() => _i5.ManagerOrderModel());
  gh.factory<_i6.NotAddressModel>(() => _i6.NotAddressModel());
  gh.singleton<_i7.NumCartDetail>(_i7.NumCartDetail(),
      dispose: (i) => i.disposeCartNumberStream());
  gh.singleton<_i7.NumCartPoint>(_i7.NumCartPoint(),
      dispose: (i) => i.disposeCartNumberStream());
  gh.factory<_i8.PurchasedProductModel>(() => _i8.PurchasedProductModel());
  await gh.factoryAsync<_i9.SharedPreferences>(
      () => moduleRegister.sharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i10.Dio>(() => moduleRegister.getDio(
      get<_i9.SharedPreferences>(), get<_i3.DioCacheManager>()));
  gh.lazySingleton<_i11.LoginAPI>(() => _i11.LoginAPI(get<_i10.Dio>()));
  gh.lazySingleton<_i12.LoginDataSource>(
      () => _i12.LoginDataSourceImpl(get<_i11.LoginAPI>()));
  gh.lazySingleton<_i13.MethodOrderApi>(
      () => _i13.MethodOrderApi(get<_i10.Dio>()));
  gh.factory<_i14.MyApp>(() => _i14.MyApp(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i15.OrderAPI>(() => _i15.OrderAPI(get<_i10.Dio>()));
  gh.lazySingleton<_i16.OrderDataSource>(
      () => _i16.OrderDataSourceImpl(get<_i15.OrderAPI>()));
  gh.lazySingleton<_i17.OrderUserCase>(
      () => _i17.OrderUserCase(get<_i16.OrderDataSource>()));
  gh.lazySingleton<_i18.ProductAPI>(() => _i18.ProductAPI(get<_i10.Dio>()));
  gh.lazySingleton<_i19.ProductDataSource>(
      () => _i19.ProductDataSourceImpl(get<_i18.ProductAPI>()));
  gh.lazySingleton<_i20.ProductUserCase>(
      () => _i20.ProductUserCase(get<_i19.ProductDataSource>()));
  gh.factory<_i21.SigninModel>(() => _i21.SigninModel(
      get<_i9.SharedPreferences>(), get<_i12.LoginDataSource>()));
  gh.lazySingleton<_i22.SplashsreenModel>(() =>
      _i22.SplashsreenModel(get<_i9.SharedPreferences>(), get<_i10.Dio>()));
  gh.lazySingleton<_i23.SubCategoryAPI>(
      () => _i23.SubCategoryAPI(get<_i10.Dio>()));
  gh.lazySingleton<_i24.SubCategoryDataSource>(
      () => _i24.SubCategoryDataSourceImpl(get<_i23.SubCategoryAPI>()));
  gh.lazySingleton<_i25.UserAddressApi>(
      () => _i25.UserAddressApi(get<_i10.Dio>()));
  gh.lazySingleton<_i26.UserAddressDataSource>(
      () => _i26.UserAddressDataSourceIpml(get<_i25.UserAddressApi>()));
  gh.lazySingleton<_i27.UserUserCase>(() => _i27.UserUserCase(
      get<_i12.LoginDataSource>(), get<_i26.UserAddressDataSource>()));
  gh.lazySingleton<_i28.AddAddreesAPI>(
      () => _i28.AddAddreesAPI(get<_i10.Dio>()));
  gh.lazySingleton<_i29.AddAddreesDataSource>(
      () => _i29.AddAddreesDataSourceImpl(get<_i28.AddAddreesAPI>()));
  gh.lazySingleton<_i30.AddAddreesUserCase>(
      () => _i30.AddAddreesUserCase(get<_i29.AddAddreesDataSource>()));
  gh.lazySingleton<_i31.CartAPI>(() => _i31.CartAPI(get<_i10.Dio>()));
  gh.lazySingleton<_i32.CartDataSource>(
      () => _i32.CartDataSourceImpl(get<_i31.CartAPI>()));
  gh.lazySingleton<_i33.CategoryAPI>(() => _i33.CategoryAPI(get<_i10.Dio>()));
  gh.lazySingleton<_i34.CategoryDataSource>(
      () => _i34.CategoryDataSourceImpl(get<_i33.CategoryAPI>()));
  gh.lazySingleton<_i35.CategoryUserCase>(
      () => _i35.CategoryUserCase(get<_i34.CategoryDataSource>()));
  gh.factory<_i36.ChangePasswordModel>(
      () => _i36.ChangePasswordModel(get<_i27.UserUserCase>()));
  gh.factory<_i37.ListProductModel>(
      () => _i37.ListProductModel(get<_i20.ProductUserCase>()));
  gh.lazySingleton<_i38.MethodDataSource>(
      () => _i38.MethodDataSourceImpl(get<_i13.MethodOrderApi>()));
  gh.factory<_i39.ProductDetailModel>(
      () => _i39.ProductDetailModel(get<_i20.ProductUserCase>()));
  gh.factory<_i40.ProductSellingModel>(
      () => _i40.ProductSellingModel(get<_i20.ProductUserCase>()));
  gh.lazySingleton<_i41.SearchModel>(() => _i41.SearchModel(
      get<_i20.ProductUserCase>(), get<_i35.CategoryUserCase>()));
  gh.factory<_i42.SettingProfileModel>(
      () => _i42.SettingProfileModel(get<_i27.UserUserCase>()));
  gh.lazySingleton<_i43.SubCateUserCase>(
      () => _i43.SubCateUserCase(get<_i24.SubCategoryDataSource>()));
  gh.factory<_i44.SubCategoryModel>(() => _i44.SubCategoryModel(
      get<_i20.ProductUserCase>(), get<_i43.SubCateUserCase>()));
  gh.lazySingleton<_i45.CartUserCase>(() => _i45.CartUserCase(
      get<_i32.CartDataSource>(),
      get<_i26.UserAddressDataSource>(),
      get<_i38.MethodDataSource>()));
  gh.factory<_i46.HomePageModel>(() => _i46.HomePageModel(
      get<_i35.CategoryUserCase>(),
      get<_i20.ProductUserCase>(),
      get<_i45.CartUserCase>()));
  gh.lazySingleton<_i47.MainPageModel>(
      () => _i47.MainPageModel(get<_i45.CartUserCase>()));
  gh.factory<_i48.ProductCartModel>(() => _i48.ProductCartModel(
      get<_i45.CartUserCase>(), get<_i47.MainPageModel>()));
  gh.factory<_i49.AddAddressModel>(() => _i49.AddAddressModel(
      get<_i30.AddAddreesUserCase>(), get<_i45.CartUserCase>()));
  gh.lazySingleton<_i50.CartModel>(() => _i50.CartModel(
      get<_i45.CartUserCase>(),
      get<_i47.MainPageModel>(),
      get<_i17.OrderUserCase>()));
  gh.factory<_i51.ProfileModel>(() => _i51.ProfileModel(
      get<_i9.SharedPreferences>(),
      get<_i50.CartModel>(),
      get<_i27.UserUserCase>()));
  return get;
}

class _$ModuleRegister extends _i7.ModuleRegister {}
