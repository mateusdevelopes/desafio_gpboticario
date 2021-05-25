import 'package:desafio_gpboticario/shared/interfaces/i_auth_repository.dart';
import 'package:desafio_gpboticario/shared/models/auth_user_model.dart';
import 'package:desafio_gpboticario/shared/services/rest_client.dart';
import 'package:desafio_gpboticario/shared/services/rest_exception.dart';
import 'package:dio/dio.dart';

class AuthRepository extends IAuthRepository {
  final Dio _dio = Dio(restClient.options);

  @override
  Future<AuthUserModel> registerUser(
      String createdAt, String userName, String email, String password) async {
    var body = {
      "createdAt": createdAt,
      "name": userName,
      "email": email,
      "supposedlyEncryptedPassword": password
    };
    try {
      var response = await _dio.post('users', data: body);
      return AuthUserModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 500) {
        print('Houve um problema no servidor!');
        throw RestException(
            message: 'Houve um problema no servidor!',
            statusCode: e.response?.statusCode ?? 0);
      }
      throw RestException(
          message: e.error, statusCode: e.response?.statusCode ?? 0);
    }
  }

  @override
  Future<AuthUserModel> fakeLogin(String email, String password) async {
    // var body = {"email": email, "password": password};
    try {
      /**
       * TODO: ESSA REQUISÇÃO DE LOGIN ERA PRA SER UM POST:
       * =>> var response = await _dio.post('users', data: body); <==
       * MAS COMO ESTOU USANDO MOCKAPI DEFINI PARA SER UMA REQUEST DE GET - 
       * QUE TRARÁ UM USUÁRIO FAKE. DECISÃO TOMADA PARA MOSTRAR O 
       * FUNCIONAMENTO DO REQUISITO DE LOGIN.
       **/
      var response = await _dio.get('users');
      return AuthUserModel.fromJson(response.data[0]);
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        print('Usuário informado não tem cadastro!');
        throw RestException(
            message: 'Houve um problema no servidor!',
            statusCode: e.response?.statusCode ?? 0);
      }
      if (e.response?.statusCode == 500) {
        print('Houve um problema no servidor!');
        throw RestException(
            message: 'Houve um problema no servidor!',
            statusCode: e.response?.statusCode ?? 0);
      }
      throw RestException(
          message: e.error, statusCode: e.response?.statusCode ?? 0);
    }
  }
}
