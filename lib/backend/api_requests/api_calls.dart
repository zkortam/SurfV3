import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetipaddrCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getipaddr',
      apiUrl: 'https://api.ipify.org?format=json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? ipaddr(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ip''',
      ));
}

class GetrecommendationsCall {
  static Future<ApiCallResponse> call({
    String? userId = '0',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getrecommendations',
      apiUrl:
          'https://09f94cc5-2981-489c-9db1-2488f2d33596-00-3s26qv4iyg0xc.kirk.replit.dev',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? postids(dynamic response) => getJsonField(
        response,
        r'''$.posts''',
        true,
      ) as List?;
  static int? code(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List<String>? authors(dynamic response) => (getJsonField(
        response,
        r'''$.posts[:].Author''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? captions(dynamic response) => (getJsonField(
        response,
        r'''$.posts[:].Caption''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? timeposteds(dynamic response) => getJsonField(
        response,
        r'''$.posts[:].TimePosted''',
        true,
      ) as List?;
  static List? voters(dynamic response) => getJsonField(
        response,
        r'''$.posts[:].Voters''',
        true,
      ) as List?;
  static List<String>? voteruserrefereces(dynamic response) => (getJsonField(
        response,
        r'''$.posts[:].Voters[:].UserReference''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? votevotevaleus(dynamic response) => (getJsonField(
        response,
        r'''$.posts[:].Voters[:].VoteValue''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? spoilerclickers(dynamic response) => getJsonField(
        response,
        r'''$.posts[:].SpoilerClickers''',
        true,
      ) as List?;
  static List? hashtags(dynamic response) => getJsonField(
        response,
        r'''$.posts[:].hashtags''',
        true,
      ) as List?;
  static List<String>? ids(dynamic response) => (getJsonField(
        response,
        r'''$.posts[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? informativevalues(dynamic response) => (getJsonField(
        response,
        r'''$.posts[:].informative_value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? isshorts(dynamic response) => (getJsonField(
        response,
        r'''$.posts[:].isShort''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? isspoilers(dynamic response) => (getJsonField(
        response,
        r'''$.posts[:].isSpoiler''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? isstealhs(dynamic response) => (getJsonField(
        response,
        r'''$.posts[:].isStealth''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? medias(dynamic response) => getJsonField(
        response,
        r'''$.posts[:].media''',
        true,
      ) as List?;
  static List<String>? politicalvalues(dynamic response) => (getJsonField(
        response,
        r'''$.posts[:].political_value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? toxicvalues(dynamic response) => (getJsonField(
        response,
        r'''$.posts[:].toxic_value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? vulgarvalues(dynamic response) => (getJsonField(
        response,
        r'''$.posts[:].vulgar_value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
