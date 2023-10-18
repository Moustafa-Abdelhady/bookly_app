// import 'dart:io';
// import 'dart:math';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  // ServerFailure(super.errMessage);
  ServerFailure(String errMessage) : super(errMessage);

  // ignore: deprecated_member_use
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection Timeout with ApiServer');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send Timeout with ApiServer');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive Timeout with ApiServer');

      case DioErrorType.badCertificate:
        return ServerFailure('Receive Timeout with ApiServer');

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);

      case DioErrorType.cancel:
        return ServerFailure(
            'Request with ApiServer was canceled , please try again later');

      case DioErrorType.connectionError:
        return ServerFailure('Connection Error , please try again later');

      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure("No Internet Connection");
        }
        return ServerFailure('Unexpected Error , please try again later');
        
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found , try again later !');
    } else if (statusCode == 500) {
      return ServerFailure('Intarnal server error , please try again later');
    } else {
      return ServerFailure('Opps there was an Eror , please try again');
    }
  }
}
