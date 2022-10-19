import 'dart:io';

import 'package:dio/dio.dart';

import '../helpers/main.dart';

abstract class IClientAPI {
  Dio client;

  IClientAPI(this.client, String baseUrl) {
    client.options.baseUrl = baseUrl;
    client.options.connectTimeout = 5000;
  }
}

class ClientAPI extends IClientAPI {
  ClientAPI(Dio client, String baseUrl) : super(client, baseUrl);

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    if (await checkInternetConnection()) {
      return await client.get(path, queryParameters: queryParameters);
    } else {
      throw InternetConnectionFailure(message: 'Error Connection');
    }
  }

  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {}
    return false;
  }
}
