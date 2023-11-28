import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Auth Group Code

class AuthGroup {
  static String baseUrl =
      'https://e4a0-2806-105e-24-813-41d0-292d-cde-3697.ngrok-free.app/session/auth';
  static Map<String, String> headers = {};
  static LoginCall loginCall = LoginCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? loginEmail = '',
    String? loginPassword = '',
  }) async {
    final ffApiRequestBody = '''
{
  "login": "${loginEmail}",
  "password": "${loginPassword}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${AuthGroup.baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic userName(dynamic response) => getJsonField(
        response,
        r'''$.username''',
      );
  dynamic userId(dynamic response) => getJsonField(
        response,
        r'''$.uid''',
      );
  dynamic sessionToken(dynamic response) => getJsonField(
        response,
        r'''$.session.sid''',
      );
  dynamic codeResponse(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
}

/// End Auth Group Code

/// Start Tareas Group Code

class TareasGroup {
  static String baseUrl =
      'https://e4a0-2806-105e-24-813-41d0-292d-cde-3697.ngrok-free.app/api';
  static Map<String, String> headers = {};
  static TareasCall tareasCall = TareasCall();
}

class TareasCall {
  Future<ApiCallResponse> call({
    String? sessionId = '',
  }) async {
    final ffApiRequestBody = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Tareas',
      apiUrl: '${TareasGroup.baseUrl}/get_all_tareas',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'X-Openerp-Session-Id': '${sessionId}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic totalTareas(dynamic response) => getJsonField(
        response,
        r'''$.result.total_tareas''',
      );
  dynamic tareas(dynamic response) => getJsonField(
        response,
        r'''$.result.tareas''',
        true,
      );
}

/// End Tareas Group Code

class SwapiCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'SWAPI',
      apiUrl: 'https://swapi.dev/api/people',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TestCall {
  static Future<ApiCallResponse> call({
    String? sessionId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TEST',
      apiUrl:
          'https://e4a0-2806-105e-24-813-41d0-292d-cde-3697.ngrok-free.app/stp/prueba',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class HolamundoCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'holamundo',
      apiUrl:
          'https://e4a0-2806-105e-24-813-41d0-292d-cde-3697.ngrok-free.app/hola_mundo',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-Openerp-Session-Id': '3ff6ee4f9f901245e49e4592749217e46f0b195c',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
