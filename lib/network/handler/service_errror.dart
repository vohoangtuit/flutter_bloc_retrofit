import 'package:dio/dio.dart' hide Headers;

class ServerError implements Exception {
  int? _errorCode;
  String errorMessage = "";
  ServerError();
  ServerError.withError({required DioError error}) {
    _handleError(error);
  }

  String getError(DioError error){
   return errorMessage =_handleError(error).toString();
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return errorMessage;
  }

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        errorMessage = "Request was cancelled";
        break;
      case DioErrorType.connectTimeout:
        errorMessage = "Connection timeout";
        break;
      case DioErrorType.other:
        errorMessage =
        "Please check internet connection";
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = "Receive timeout in connection";
        break;
      case DioErrorType.response:
        errorMessage =
        "Received invalid status code: ${error.response!.statusCode}";
        break;
      case DioErrorType.sendTimeout:
        errorMessage = "Receive timeout in send request";
        break;
    }
    return errorMessage;
  }
}