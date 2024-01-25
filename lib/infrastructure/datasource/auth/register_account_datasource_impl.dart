import 'dart:async';
import 'dart:io';
import 'package:praise_app_flutter/core/exception/auth/register_error_exception.dart';
import 'package:praise_app_flutter/core/exception/network_error_exception.dart';
import 'package:praise_app_flutter/infrastructure/datasource/auth/register_account_datesource.dart';
import 'package:praise_app_flutter/infrastructure/model/auth/auth_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterAccountDatasourceImpl implements RegisterAccountDatasource {
  final supabase = Supabase.instance.client;

  @override
  Future<AuthResponseModel> register(String name, String email, String password) async {
    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          "full_name": name
        }
      );

      return AuthResponseModel.fromResponse(true, null);
    } on AuthException catch (e) {
      throw RegisterErrorException(e.statusCode);
    } on SocketException catch (e) {
      throw NetworkErrorException();
    } on TimeoutException catch (e) {
      throw NetworkErrorException();
    }
  }
}