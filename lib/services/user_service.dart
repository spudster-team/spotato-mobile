import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotato/constants.dart';
import 'package:spotato/models/http_response.dart';

import '../models/user_model.dart';
import '../models/user_type_enum.dart';

final userServiceProvider = Provider((ref) {
  return UserService();
});

class UserService {
  Uri? _url;

  void _setUrl(String url) {
    _url = Uri.http(baseUrl, url);
  }

  Future<Either<HttpResponse, HttpResponse>> register(
    UserModel user,
    UserType userType,
  ) async {
    _setUrl(
      '/api/' + (userType == UserType.client ? 'client' : 'spotter'),
    );
    try {
      var response = await http.post(
        _url!,
        body: user.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(HttpResponse(
            statusCode: response.statusCode, message: 'Inscription réussie'));
      } else {
        return Left(
          HttpResponse(statusCode: response.statusCode, message: response.body),
        );
      }
    } on SocketException catch (e) {
      return Left(
        HttpResponse(
            statusCode: 0,
            message: 'Veuillez vérifier votre connexion internet'),
      );
    }
  }

  Future<Either<HttpResponse, HttpResponse>> login(
    String username,
    String password,
    UserType userType,
  ) async {
    _setUrl(
      '/api/' + (userType == UserType.client ? 'client' : 'spotter') + '/login',
    );

    try {
      final res = await http.post(
        _url!,
        body: {
          'username': username,
          'password': password,
        },
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final prefs = await SharedPreferences.getInstance();

        prefs.setBool('isConnected', true);
        prefs.setString(
          'userType',
          userType == UserType.client ? 'client' : 'spotter',
        );

        return Right(
          HttpResponse(
            statusCode: res.statusCode,
            message: 'Connexion réussie',
          ),
        );
      } else {
        return Left(
          HttpResponse(
            statusCode: res.statusCode,
            message: res.body,
          ),
        );
      }
    } on SocketException catch (e) {
      return Left(
        HttpResponse(
            statusCode: 0,
            message: 'Veuillez vérifier votre connexion internet'),
      );
    }
  }
}
