// core/errors/failures.dart
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException exception) {
    String userFriendlyMessage = "Gözlənilməz bir server xətası baş verdi.";

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        userFriendlyMessage =
            "Serverlə bağlantı vaxtı bitdi. İnternetinizi yoxlayın.";
        break;

      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode;
        if (statusCode == 401) {
          userFriendlyMessage =
              "Sessiyanızın vaxtı bitib. Zəhmət olmasa yenidən daxil olun.";
        } else if (statusCode == 404) {
          userFriendlyMessage = "İstədiyiniz məlumat tapılmadı (404).";
        } else if (statusCode! >= 500) {
          userFriendlyMessage =
              "Serverdə problem var. Xahiş edirik, az sonra yenidən yoxlayın.";
        }
        break;

      case DioExceptionType.connectionError:
        userFriendlyMessage = "İnternet bağlantısı yoxdur.";
        break;

      default:
        userFriendlyMessage = "Sistem xətası baş verdi. Yenidən cəhd edin.";
        break;
    }

    return ServerFailure(userFriendlyMessage);
  }
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}
