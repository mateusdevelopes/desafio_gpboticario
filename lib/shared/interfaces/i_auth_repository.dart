import 'package:desafio_gpboticario/shared/models/auth_user_model.dart';

abstract class IAuthRepository {
  Future<AuthUserModel> registerUser(
      String createdAt, String userName, String email, String password);

  Future<AuthUserModel> fakeLogin(String email, String password);
}
