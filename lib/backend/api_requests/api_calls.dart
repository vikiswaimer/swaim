import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AddNoteCall {
  static Future<ApiCallResponse> call({
    String? description = '',
    String? name = '',
    String? user = '',
    double? longitude,
    double? latitude,
  }) {
    final body = '''
{
  "fields": {
    "name": {
      "stringValue": "${name}"
    },
    "location": {
      "geoPointValue": {
        "latitude": ${latitude},
        "longitude": ${longitude}
      }
    },
    "user": {
      "referenceValue": "projects/swaim-test-2/databases/(default)/documents/users/${user}"
    },
    "labels": {
      "arrayValue": {
        "values": []
      }
    },
    "description": {
      "stringValue": "${description}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addNote',
      apiUrl:
          'https://firestore.googleapis.com/v1/projects/swaim-test-2/databases/(default)/documents/notes',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class UpdateNoteCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    String? location = '',
    String? user = '',
    String? noteId = '',
  }) {
    final body = '''
{
  "fields": {
    "name": {
      "stringValue": "${name}"
    },
    "location": {
      "geoPointValue": {
        "latitude": 53.85845,
        "longitude": 27.474881
      }
    },
    "user": {
      "referenceValue": "projects/swaim-test-2/databases/(default)/documents/users/${user}"
    },
    "labels": {
      "arrayValue": {
        "values": []
      }
    },
    "description": {
      "stringValue": "${description}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateNote',
      apiUrl:
          'https://firestore.googleapis.com/v1/projects/swaim-test-2/databases/(default)/documents/notes/${noteId}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic noteId(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
}

class DeleteNoteCall {
  static Future<ApiCallResponse> call({
    String? noteId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteNote',
      apiUrl:
          'https://firestore.googleapis.com/v1/projects/swaim-test-2/databases/(default)/documents/notes/${noteId}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}
