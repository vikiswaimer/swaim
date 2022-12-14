import 'dart:convert';

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
    String? labels = 'er7SZTHrkAdI2E1WBERe',
    String? createdAt = '',
    String? updatedAt = '',
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
    "label": {
      "referenceValue": "projects/swaim-test-2/databases/(default)/documents/labels/${labels}"
    },
    "swaimRef": {
      "referenceValue": "projects/swaim-test-2/databases/(default)/documents/aggregations/n1IGSXe0ioF24SRWBLK8"
    },
    "description": {
      "stringValue": "${description}"
    },
    "createdAt": {
      "timestampValue": "${createdAt}"
    },
    "updatedAt": {
      "timestampValue": "${updatedAt}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addNote',
      apiUrl:
          'https://firestore.googleapis.com/v1/projects/swaim-test-2/databases/(default)/documents/notes',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class UpdateNoteCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    String? user = '',
    String? noteId = '',
    double? latitude,
    double? longitude,
    String? label = '',
    String? swaimRef = '',
    String? createdAt = '',
    String? updatedAt = '',
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
    "label": {
      "referenceValue": "projects/swaim-test-2/databases/(default)/documents/labels/${label}"
    },
    "swaimRef": {
      "referenceValue": "projects/swaim-test-2/databases/(default)/documents/aggregations/${swaimRef}"
    },
    "description": {
      "stringValue": "${description}"
    },
    "createdAt": {
      "timestampValue": "${createdAt}"
    },
    "updatedAt": {
      "timestampValue": "${updatedAt}"
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
      cache: false,
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
      cache: false,
    );
  }
}

class AddAggregationToFavesCall {
  static Future<ApiCallResponse> call({
    String? aggregationId = '',
    String? userId = '',
  }) {
    final body = '''
{
  "fields": {
    "aggregation": {
      "referenceValue": "projects/swaim-test-2/databases/(default)/documents/aggregations/${aggregationId}"
    },
    "userId": {
      "referenceValue": "projects/swaim-test-2/databases/(default)/documents/users/${userId}"
    },
    "labelRef": {
      "referenceValue": "projects/swaim-test-2/databases/(default)/documents/labels/er7SZTHrkAdI2E1WBERe"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addAggregationToFaves',
      apiUrl:
          'https://firestore.googleapis.com/v1/projects/swaim-test-2/databases/(default)/documents/favorite_aggregations',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class RemoveAggregationFromFavesCall {
  static Future<ApiCallResponse> call({
    String? favAggregationId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'removeAggregationFromFaves',
      apiUrl:
          'https://firestore.googleapis.com/v1/projects/swaim-test-2/databases/(default)/documents/favorite_aggregations/${favAggregationId}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      cache: false,
    );
  }
}

class SetLabelForSwaimCall {
  static Future<ApiCallResponse> call({
    String? swaimId = '',
    String? labelId = '',
    String? userId = '',
    String? aggregationId = '',
  }) {
    final body = '''
{
  "fields": {
    "labelRef": {
      "referenceValue": "projects/swaim-test-2/databases/(default)/documents/labels/${labelId}"
    },
    "userId": {
      "referenceValue": "projects/swaim-test-2/databases/(default)/documents/users/${userId}"
    },
    "aggregation": {
      "referenceValue": "projects/swaim-test-2/databases/(default)/documents/aggregations/${aggregationId}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'setLabelForSwaim',
      apiUrl:
          'https://firestore.googleapis.com/v1/projects/swaim-test-2/databases/(default)/documents/favorite_aggregations/${swaimId}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class AddLabelCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? title = '',
  }) {
    final body = '''
{
  "fields": {
    "name": {
      "stringValue": "${title}"
    },
    "userId": {
      "referenceValue": "projects/swaim-test-2/databases/(default)/documents/users/${userId}"
    },
    "is_base": {
      "booleanValue": false
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addLabel',
      apiUrl:
          'https://firestore.googleapis.com/v1/projects/swaim-test-2/databases/(default)/documents/labels',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class RemoveLabelCall {
  static Future<ApiCallResponse> call({
    String? labelId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'removeLabel',
      apiUrl:
          'https://firestore.googleapis.com/v1/projects/swaim-test-2/databases/(default)/documents/labels/${labelId}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      cache: false,
    );
  }
}

class AddNoteWithAttachedSwaimCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    double? latitude,
    double? longitude,
    String? user = '',
    String? labels = '',
    String? swaimRef = '',
    String? createdAt = '',
    String? updatedAt = '',
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
    "label": {
      "referenceValue": "projects/swaim-test-2/databases/(default)/documents/labels/${labels}"
    },
    "swaimRef": {
      "referenceValue": "projects/swaim-test-2/databases/(default)/documents/aggregations/${swaimRef}"
    },
    "description": {
      "stringValue": "${description}"
    },
    "createdAt": {
      "timestampValue": "${createdAt}"
    },
    "updatedAt": {
      "timestampValue": "${updatedAt}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addNoteWithAttachedSwaim',
      apiUrl:
          'https://firestore.googleapis.com/v1/projects/swaim-test-2/databases/(default)/documents/notes',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
