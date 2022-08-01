// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../../main.dart' as _i15;
import '../apis/addrees/add_addrees_datasource.dart' as _i30;
import '../apis/addrees/service/add_addrees_api.dart' as _i29;
import '../apis/cart/cart_datasource.dart' as _i33;
import '../apis/cart/service/cart_api.dart' as _i32;
import '../apis/category/category_datasource.dart' as _i35;
import '../apis/category/service/category_api.dart' as _i34;
import '../apis/login/login_datasource.dart' as _i13;
import '../apis/login/service/login_api.dart' as _i12;
import '../apis/order/order_datasource.dart' as _i17;
import '../apis/order/service/order_api.dart' as _i16;
import '../apis/product/product_datasoure.dart' as _i20;
import '../apis/product/service/product_api.dart' as _i19;
import '../apis/shipping_payment_status/method_datasource.dart' as _i38;
import '../apis/shipping_payment_status/service/method_order_api.dart' as _i14;
import '../apis/subcategory/service/subcategory_api.dart' as _i24;
import '../apis/subcategory/subcategory_datasource.dart' as _i25;
import '../apis/user_addrees/service/user_address_api.dart' as _i26;
import '../apis/user_addrees/user_address_datasource.dart' as _i27;
import '../core/dio_cache/dio_cache_manager.dart' as _i4;
import '../modules/action/search/search_model.dart' as _i41;
import '../modules/address/add_addrees/add_address_model.dart' as _i49;
import '../modules/address/address_model.dart' as _i7;
import '../modules/cart/cart_model.dart' as _i50;
import '../modules/homepage/homepage_model.dart' as _i46;
import '../modules/homepage/widgets/list_product_model.dart' as _i37;
import '../modules/main_page_model.dart' as _i47;
import '../modules/product_widget/product_detail_model.dart' as _i39;
import '../modules/product_widget/product_model.dart' as _i48;
import '../modules/product_widget/product_selling/product_selling_model.dart'
    as _i40;
import '../modules/profile/managerorder/manager_model.dart' as _i6;
import '../modules/profile/product/pur_product_model.dart' as _i9;
import '../modules/profile/profile_model.dart' as _i51;
import '../modules/profile/setting/password/change_password_model.dart' as _i3;
import '../modules/profile/setting/setting_profile_model.dart' as _i42;
import '../modules/signin_signup/app/form_pass/form_pass_model.dart' as _i5;
import '../modules/signin_signup/app/signin/app/signin_model.dart' as _i22;
import '../modules/splashsreen/splashsreen_model.dart' as _i23;
import '../modules/subcategory/subcategory_model.dart' as _i44;
import '../usecases/add_addrees_usercase/add_addrees_usercase.dart' as _i31;
import '../usecases/cart_usercase/cart_usercase.dart' as _i45;
import '../usecases/category_usercase/category_usercase.dart' as _i36;
import '../usecases/category_usercase/product_usercase.dart' as _i21;
import '../usecases/order/order_usercase.dart' as _i18;
import '../usecases/subcategory_usercase/subcategory_usercase.dart' as _i43;
import '../usecases/user_usercase.dart' as _i28;
import 'injection_config.dart' as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final moduleRegister = _$ModuleRegister();
  gh.factory<_i3.ChangepasswordModel>(() => _i3.ChangepasswordModel());
  gh.lazySingleton<_i4.DioCacheManager>(() => moduleRegister.getDioCache());
  gh.factory<_i5.FormPassModel>(() => _i5.FormPassModel());
  gh.factory<_i6.ManagerOrderModel>(() => _i6.ManagerOrderModel());
  gh.factory<_i7.NotAddressModel>(() => _i7.NotAddressModel());
  gh.singleton<_i8.NumCartDetail>(_i8.NumCartDetail(),
      dispose: (i) => i.disposeCartNumberStream());
  gh.singleton<_i8.NumCartPoint>(_i8.NumCartPoint(),
      dispose: (i) => i.disposeCartNumberStream());
  gh.factory<_i9.PurchasedProductModel>(() => _i9.PurchasedProductModel());
  await gh.factoryAsync<_i10.SharedPreferences>(
      () => moduleRegister.sharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i11.Dio>(() => moduleRegister.getDio(
      get<_i10.SharedPreferences>(), get<_i4.DioCacheManager>()));
  gh.lazySingleton<_i12.LoginAPI>(() => _i12.LoginAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i13.LoginDataSource>(
      () => _i13.LoginDataSourceImpl(get<_i12.LoginAPI>()));
  gh.lazySingleton<_i14.MethodOrderApi>(
      () => _i14.MethodOrderApi(get<_i11.Dio>()));
  gh.factory<_i15.MyApp>(() => _i15.MyApp(get<_i10.SharedPreferences>()));
  gh.lazySingleton<_i16.OrderAPI>(() => _i16.OrderAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i17.OrderDataSource>(
      () => _i17.OrderDataSourceImpl(get<_i16.OrderAPI>()));
  gh.lazySingleton<_i18.OrderUserCase>(
      () => _i18.OrderUserCase(get<_i17.OrderDataSource>()));
  gh.lazySingleton<_i19.ProductAPI>(() => _i19.ProductAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i20.ProductDataSource>(
      () => _i20.ProductDataSourceImpl(get<_i19.ProductAPI>()));
  gh.lazySingleton<_i21.ProductUserCase>(
      () => _i21.ProductUserCase(get<_i20.ProductDataSource>()));
  gh.factory<_i22.SigninModel>(() => _i22.SigninModel(
      get<_i10.SharedPreferences>(), get<_i13.LoginDataSource>()));
  gh.lazySingleton<_i23.SplashsreenModel>(() =>
      _i23.SplashsreenModel(get<_i10.SharedPreferences>(), get<_i11.Dio>()));
  gh.lazySingleton<_i24.SubCategoryAPI>(
      () => _i24.SubCategoryAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i25.SubCategoryDataSource>(
      () => _i25.SubCategoryDataSourceImpl(get<_i24.SubCategoryAPI>()));
  gh.lazySingleton<_i26.UserAddressApi>(
      () => _i26.UserAddressApi(get<_i11.Dio>()));
  gh.lazySingleton<_i27.UserAddressDataSource>(
      () => _i27.UserAddressDataSourceIpml(get<_i26.UserAddressApi>()));
  gh.lazySingleton<_i28.UserUserCase>(
      () => _i28.UserUserCase(get<_i13.LoginDataSource>()));
  gh.lazySingleton<_i29.AddAddreesAPI>(
      () => _i29.AddAddreesAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i30.AddAddreesDataSource>(
      () => _i30.AddAddreesDataSourceImpl(get<_i29.AddAddreesAPI>()));
  gh.lazySingleton<_i31.AddAddreesUserCase>(
      () => _i31.AddAddreesUserCase(get<_i30.AddAddreesDataSource>()));
  gh.lazySingleton<_i32.CartAPI>(() => _i32.CartAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i33.CartDataSource>(
      () => _i33.CartDataSourceImpl(get<_i32.CartAPI>()));
  gh.lazySingleton<_i34.CategoryAPI>(() => _i34.CategoryAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i35.CategoryDataSource>(
      () => _i35.CategoryDataSourceImpl(get<_i34.CategoryAPI>()));
  gh.lazySingleton<_i36.CategoryUserCase>(
      () => _i36.CategoryUserCase(get<_i35.CategoryDataSource>()));
  gh.factory<_i37.ListProductModel>(
      () => _i37.ListProductModel(get<_i21.ProductUserCase>()));
  gh.lazySingleton<_i38.MethodDataSource>(
      () => _i38.MethodDataSourceImpl(get<_i14.MethodOrderApi>()));
  gh.factory<_i39.ProductDetailModel>(
      () => _i39.ProductDetailModel(get<_i21.ProductUserCase>()));
  gh.factory<_i40.ProductSellingModel>(
      () => _i40.ProductSellingModel(get<_i21.ProductUserCase>()));
  gh.lazySingleton<_i41.SearchModel>(() => _i41.SearchModel(
      get<_i21.ProductUserCase>(), get<_i36.CategoryUserCase>()));
  gh.factory<_i42.SettingProfileModel>(
      () => _i42.SettingProfileModel(get<_i28.UserUserCase>()));
  gh.lazySingleton<_i43.SubCateUserCase>(
      () => _i43.SubCateUserCase(get<_i25.SubCategoryDataSource>()));
  gh.factory<_i44.SubCategoryModel>(() => _i44.SubCategoryModel(
      get<_i21.ProductUserCase>(), get<_i43.SubCateUserCase>()));
  gh.lazySingleton<_i45.CartUserCase>(() => _i45.CartUserCase(
      get<_i33.CartDataSource>(),
      get<_i27.UserAddressDataSource>(),
      get<_i38.MethodDataSource>()));
  gh.factory<_i46.HomePageModel>(() => _i46.HomePageModel(
      get<_i36.CategoryUserCase>(),
      get<_i21.ProductUserCase>(),
      get<_i45.CartUserCase>()));
  gh.lazySingleton<_i47.MainPageModel>(
      () => _i47.MainPageModel(get<_i45.CartUserCase>()));
  gh.factory<_i48.ProductCartModel>(() => _i48.ProductCartModel(
      get<_i45.CartUserCase>(), get<_i47.MainPageModel>()));
  gh.factory<_i49.AddAddressModel>(() => _i49.AddAddressModel(
      get<_i31.AddAddreesUserCase>(), get<_i45.CartUserCase>()));
  gh.lazySingleton<_i50.CartModel>(() => _i50.CartModel(
      get<_i45.CartUserCase>(),
      get<_i47.MainPageModel>(),
      get<_i18.OrderUserCase>()));
  gh.factory<_i51.ProfileModel>(() => _i51.ProfileModel(
      get<_i10.SharedPreferences>(),
      get<_i50.CartModel>(),
      get<_i28.UserUserCase>()));
  return get;
}

class _$ModuleRegister extends _i8.ModuleRegister {}
