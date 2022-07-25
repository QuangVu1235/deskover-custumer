// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'method_order_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _MethodOrderApi implements MethodOrderApi {
  _MethodOrderApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://10.0.2.2:8080';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Payment>?> doGetAllPayment() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Payment>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/v1/api/custumer/payment',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data
        ?.map((dynamic i) => Payment.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Payment> doGetByIdPayment(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Payment>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/v1/api/custumer/payment/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Payment.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<Payment>?> doGetAllShipping() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Payment>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/v1/api/custumer/shipping',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data
        ?.map((dynamic i) => Payment.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Payment> doGetByIdShipping(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Payment>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/v1/api/custumer/shipping/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Payment.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
