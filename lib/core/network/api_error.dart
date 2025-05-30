// ignore_for_file: public_member_api_docs, sort_constructors_first

// 🎯 Dart imports:
import 'dart:developer';

// 📦 Package imports:
import 'package:dio/dio.dart';

class ApiError {
  final String errorCode;
  final String errorMessage;
  ApiError({
    required this.errorCode,
    required this.errorMessage,
  });

  factory ApiError.fromDioError(Object error) {
    dynamic errorMessage = '';
    dynamic errorCode = '';
    if (error is DioException) {
      var dioError = error;
      switch (dioError.type) {
        case DioExceptionType.cancel:
          errorMessage = 'Request was cancelled';
          errorCode = 400;
          break;
        case DioExceptionType.connectionTimeout:
          errorMessage = 'Connection timeout';
          errorCode = 'CONNECTION_TIMEOUT';
          break;
        case DioExceptionType.unknown:
          errorMessage = 'Checks! your connection';
          errorCode = 'NETWORK_ERROR';
          break;
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Receive timeout in connection';
          errorCode = 'RECEIVE_TIMEOUT';
          break;
        case DioExceptionType.badResponse:
          if (dioError.response!.statusCode == 300) {
            errorMessage = 'Session timeout';
            errorCode = 'SESSION_TIMEOUT';
          } else if (dioError.response!.statusCode == 500) {
            errorMessage = 'A Server Error Occurred';
            errorCode = 'SERVER_FAILURE';
          } else {
            final errorData = extractDataFromResponse(error.response);
            errorCode = errorData['code'] ?? '';
            errorMessage = errorData['message'] ?? '';
          }
          break;
        case DioExceptionType.sendTimeout:
          errorMessage = 'Send timeout in connection';
          errorCode = 'SEND_TIMEOUT';
          break;
        case DioExceptionType.badCertificate:
          errorMessage = 'Send timeout in connection';
          errorCode = 'CERTIFICATE_ISSUE';
          break;
        case DioExceptionType.connectionError:
          errorMessage = 'Unable to connect server';
          errorCode = 'CONNECTION_ERROR';
          break;
      }
    } else {
      errorMessage = _handleException(error);
    }
    log('errorCode: $errorCode, errorMessage: $errorMessage');
    return ApiError(
      errorCode: errorCode.toString(),
      errorMessage: errorMessage.toString(),
    );
  }

  static String _handleException(dynamic exception) {
    if (exception is String) {
      return exception;
    } else {
      return 'An unexpected error occurred, please try again';
    }
  }

  static Map<String, String> extractDataFromResponse(Response? response) {
    dynamic message = '';
    dynamic errorCode = '';

    var decodeResponse = response!.data;

    if (response.data != null) {
      if (decodeResponse['message'] != null) {
        message = decodeResponse['message'];
      } else if (decodeResponse['error'] != null) {
        message = decodeResponse['error'];
      } else {
        message = 'An unexpected error occurred, please try again';
      }
      errorCode = decodeResponse['code'] ?? 'UNEXPECTED_ERROR';
    } else {
      message = response.statusMessage ?? '';
    }

    return {'message': message.toString(), 'code': errorCode.toString()};
  }

  @override
  String toString() =>
      'ApiError(errorCode: $errorCode, errorMessage: $errorMessage)';
}
