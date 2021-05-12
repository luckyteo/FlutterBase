import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_base_clean_architecture/core/http/api_config.dart'
    as ApiConfig;
import 'package:flutter_base_clean_architecture/core/util/log_mixin.dart';
import 'package:flutter_base_clean_architecture/core/localstotage/pref_helper.dart';

import 'app_exception.dart';

class AppHttpClient with LogMixin {
  static final Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static String _createUrl(String controller) {
    return '${ApiConfig.base_url}$controller';
  }

  static Future<http.Response?> doGet(String endpoint,
      {Map<String, String>? headers,
      Map<String, String>? queryParams,
      bool ignoreAuth = false}) async {
    var responseJson;
    try {
      if (headers != null) {
        headers.addAll(defaultHeaders);
      } else {
        headers = defaultHeaders;
      }

      if (!ignoreAuth) {
        String token = await PrefHelper.getTokenApp();
        headers.addAll({HttpHeaders.authorizationHeader: "Bearer $token"});
      }
      String url;
      if (queryParams != null && queryParams.length > 0) {
        url = "$endpoint?";
        queryParams.forEach((key, value) {
          url += "$key=$value&";
        });
        url = url.substring(0, url.length - 1);
      } else {
        url = endpoint;
      }
      url = Uri.encodeFull(url);
      url = _createUrl(url);

      log('Start GET Request ==>> $url');
      log('Headers');
      headers.forEach((key, value) {
        log('$key: $value');
      });

      final response = await http.get(Uri.parse(url), headers: headers);
      responseJson = response;
      //write log
      log('<== -----END Get $url');
      _writeLog(response);
    } on SocketException {
      throw FetchDataException('Connect failed');
    } catch (e, stackTrace) {
      log('[Error] ===> $e', stackTrace: stackTrace);
    }

    return responseJson;
  }

  static Future<http.Response?> doPost(String controller,
      {Map<String, String>? params,
      Map<String, String>? headers,
      bool ignoreAuth = false}) async {
    var responseJson;
    try {
      if (headers != null) {
        headers.addAll(defaultHeaders);
      } else {
        headers = defaultHeaders;
      }
      if (!ignoreAuth) {
        String token = await PrefHelper.getTokenApp();
        headers.addAll({HttpHeaders.authorizationHeader: "Bearer $token"});
      }
      String url = _createUrl(controller);
      _writeRequest(url, headers, '', "POST");
      final response =
          await http.post(Uri.parse(url), body: jsonEncode(params), headers: headers);

      // responseJson = _returnResponse(response);
      responseJson = response;

      log('<== -------END Post  $url');
      //write log
      _writeLog(response);
    } catch (error) {
      print(error);
      //throw FetchDataException('Connect failed');
    }

    return responseJson;
  }

  static Future<http.Response?> doPostStringJson(String controller,
      {String? params,
      Map<String, String>? headers,
      bool ignoreAuth = false}) async {
    var responseJson;
    try {
      if (headers != null) {
        headers.addAll(defaultHeaders);
      } else {
        headers = defaultHeaders;
      }
      if (!ignoreAuth) {
        String token = await PrefHelper.getTokenApp();
        headers.addAll({HttpHeaders.authorizationHeader: "Bearer $token"});
      }
      String url = _createUrl(controller);
      _writeRequest(url, headers, params, "POST");
      final response = await http.post(Uri.parse(url), body: params, headers: headers);

      // responseJson = _returnResponse(response);
      responseJson = response;

      log('<== -----END Get $url');
      //write log
//      _writelog(response);
    } catch (error) {
      print(error);
      //throw FetchDataException('Connect failed');
    }

    return responseJson;
  }

  static Future<http.Response?> doPut(String controller,
      {Map<String, dynamic>? params,
      Map<String, String>? headers,
      bool ignoreAuth = false}) async {
    var responseJson;
    try {
      if (headers != null) {
        headers.addAll(defaultHeaders);
      } else {
        headers = defaultHeaders;
      }
      if (!ignoreAuth) {
        String token = await PrefHelper.getTokenApp();
        headers.addAll({HttpHeaders.authorizationHeader: "Bearer $token"});
      }
      String url = _createUrl(controller);
      String body = jsonEncode(params);
      _writeRequest(url, headers, body, "PUT");

      final response = await http.put(Uri.parse(url), body: body, headers: headers);

      // responseJson = _returnResponse(response);
      responseJson = response;

      log('<== -----END PUT $url');
      //write log
      _writeLog(response);
    } catch (error) {
      print(error);
      //throw FetchDataException('Connect failed');
    }

    return responseJson;
  }

  static void _writeRequest(
      String url, Map<String, String> headers, String? body, String method) {
    //write log
    if (!ApiConfig.isWriteLog) {
      return;
    }
    log('Start $method Request ==>> $url');
    log('Headers');
    headers.forEach((key, value) {
      log('$key: $value');
    });
    log('request body: $body');
  }

  static void _writeLog(http.Response response) {
    //write log
    if (!ApiConfig.isWriteLog) {
      return;
    }
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String prettyHeaders = encoder.convert(response.request!.headers);
    log(prettyHeaders);
    log('response ${response.body}');
  }
}
