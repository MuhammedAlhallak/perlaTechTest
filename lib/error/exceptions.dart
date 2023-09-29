

import '../core/network/error_massage_model.dart';

class ServerException implements Exception {
  final ErrorMassageModel errorMassageModel;

  const ServerException(this.errorMassageModel);
}

class DataBaseException implements Exception {
  final String massage;

  DataBaseException({ required this.massage});
}
