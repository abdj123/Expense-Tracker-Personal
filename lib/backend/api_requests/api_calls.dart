import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start transactions Group Code

class TransactionsGroup {
  static String getBaseUrl() => 'https://gc-financial-analysis-2.onrender.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static BankAccountsCall bankAccountsCall = BankAccountsCall();
  static ConnectWalletCall connectWalletCall = ConnectWalletCall();
  static ConnectAccountsCall connectAccountsCall = ConnectAccountsCall();
}

class BankAccountsCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
    String? name = '',
    String? apiKey = '',
    String? accessToken = '',
  }) async {
    final baseUrl = TransactionsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "bank": {
    "name": "${escapeStringForJson(name)}",
    "apiKey": "${escapeStringForJson(apiKey)}",
    "accessToken": "${escapeStringForJson(accessToken)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'bank accounts',
      apiUrl: '${baseUrl}/api/integrations',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ConnectWalletCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
    String? coin = '',
    String? address = '',
  }) async {
    final baseUrl = TransactionsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "wallet": {
    "coin": "${escapeStringForJson(coin)}",
    "address": "${escapeStringForJson(address)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'connect wallet',
      apiUrl: '${baseUrl}/api/integrations',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ConnectAccountsCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
    String? apiKey = '',
    String? accessToken = '',
    String? name = '',
  }) async {
    final baseUrl = TransactionsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "${escapeStringForJson(name)}": {
    "apiKey": "${escapeStringForJson(apiKey)}",
    "accessToken": "${escapeStringForJson(accessToken)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'connect accounts',
      apiUrl: '${baseUrl}/api/integrations',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End transactions Group Code

/// Start Get Report Group Code

class GetReportGroup {
  static String getBaseUrl() => 'https://gc-financial-analysis-2.onrender.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static UserReportsCall userReportsCall = UserReportsCall();
  static SyncAccountsCall syncAccountsCall = SyncAccountsCall();
  static CbeTransactionsCall cbeTransactionsCall = CbeTransactionsCall();
  static GetAnalaysisCall getAnalaysisCall = GetAnalaysisCall();
}

class UserReportsCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
    String? range = '',
    String? uid = '',
  }) async {
    final baseUrl = GetReportGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "uid": "${escapeStringForJson(uid)}",
  "range": "${escapeStringForJson(range)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'user reports',
      apiUrl: '${baseUrl}/api/export/transactions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }
}

class SyncAccountsCall {
  Future<ApiCallResponse> call({
    String? uid = '',
    String? jwt = '',
  }) async {
    final baseUrl = GetReportGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "userId": "${escapeStringForJson(uid)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sync accounts',
      apiUrl: '${baseUrl}/api/integrations/initialize',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CbeTransactionsCall {
  Future<ApiCallResponse> call({
    String? uid = '',
    String? displayName = '',
    String? fileUrl = '',
    String? jwt = '',
  }) async {
    final baseUrl = GetReportGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "uid": "${escapeStringForJson(uid)}",
  "fileUrl": "${escapeStringForJson(fileUrl)}",
  "display_name": "${escapeStringForJson(displayName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Cbe transactions',
      apiUrl: '${baseUrl}/api/transactions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAnalaysisCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = GetReportGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Analaysis',
      apiUrl: '${baseUrl}/api/analysis',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Get Report Group Code

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

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
