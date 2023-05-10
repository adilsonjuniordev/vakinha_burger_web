import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/exceptions/unauthorized_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/auth_model.dart';
import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio _dio;

  AuthRepositoryImpl(this._dio);

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await _dio.unAuth().post('/auth', data: {
        'email': email,
        'password': password,
        'admin': true,
      });

      return AuthModel.fromJson(result.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 403) {
        log('Email ou senha inválidos', error: e, stackTrace: e.stackTrace);
        throw UnauthorizedException(message: 'Email ou senha inválidos');
      }
      log('Erro ao realizar login', error: e, stackTrace: e.stackTrace);
      throw RepositoryException(message: 'Erro ao realizar login');
    }
  }
}
