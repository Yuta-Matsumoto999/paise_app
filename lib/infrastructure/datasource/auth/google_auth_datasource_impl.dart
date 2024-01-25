import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:praise_app_flutter/core/exception/auth/google_auth_error_exception.dart';
import 'package:praise_app_flutter/infrastructure/datasource/auth/google_auth_datasource.dart';
import 'package:praise_app_flutter/infrastructure/model/auth/auth_response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GoogleAuthDatasourceImpl implements GoogleAuthDatasource {
  @override
  Future<AuthResponseModel> execute() async {
    final supabase = Supabase.instance.client;

    String generateRandomString() {
      final random = Random.secure();
      return base64Url.encode(List<int>.generate(16, (_) => random.nextInt(256)));
    }

    const appAuth = FlutterAppAuth();

    final rawNonce = generateRandomString();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    final clientId = Platform.isIOS ? dotenv.get("IOS_CLIENT_ID") : dotenv.get("ANDROID_CLIENT_ID");

    final redirectUrl = '${clientId.split('.').reversed.join('.')}:/';

    const discoveryUrl ='https://accounts.google.com/.well-known/openid-configuration';
    
    try {
      // authorize the user by opening the concent page
      final result = await appAuth.authorize(
        AuthorizationRequest(
          clientId,
          redirectUrl,
          discoveryUrl: discoveryUrl,
          nonce: hashedNonce,
          scopes: [
            'openid',
            'email',
            'profile',
          ],
        ),
      );

      if (result == null) {
        throw Exception();
      }

      // Request the access and id token to google
      final tokenResult = await appAuth.token(
        TokenRequest(
          clientId,
          redirectUrl,
          authorizationCode: result.authorizationCode,
          discoveryUrl: discoveryUrl,
          codeVerifier: result.codeVerifier,
          nonce: result.nonce,
          scopes: [
            'openid',
            'email',
          ],
        ),
      );

      final idToken = tokenResult?.idToken;

      if (idToken == null) {
        throw Exception();
      }

      await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google, 
        idToken: idToken,
        nonce: rawNonce
      );

      return AuthResponseModel(isAuth: true, message: null);
    } catch(err) {
      throw GoogleAuthErrorException();
    }
  }
}