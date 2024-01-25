import 'dart:async';
import 'dart:io';

import 'package:praise_app_flutter/core/exception/auth/login_error_exception.dart';
import 'package:praise_app_flutter/core/exception/auth/register_error_exception.dart';
import 'package:praise_app_flutter/core/exception/network_error_exception.dart';
import 'package:praise_app_flutter/infrastructure/datasource/auth/login_account_datasource.dart';
import 'package:praise_app_flutter/infrastructure/model/auth/auth_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginAccountDatasourceImpl implements LoginAccountDatasource {
  @override
  Future<AuthResponseModel> login(String email, String password) async {
    final supabase = Supabase.instance.client;
    
    try {
      await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return AuthResponseModel.fromResponse(true, null);
    } on AuthException catch (e) {
      print(e.statusCode);
      print(e.message);
      throw LoginErrorException(e.statusCode);
    } on SocketException catch (e) {
      throw NetworkErrorException();
    } on TimeoutException catch (e) {
      throw NetworkErrorException();
    }
  }
}