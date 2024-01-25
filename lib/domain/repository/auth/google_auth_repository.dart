import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/domain/entity/auth/auth.dart';
import 'package:praise_app_flutter/domain/factory/auth/google_auth_factory.dart';
import 'package:praise_app_flutter/infrastructure/datasource/auth/google_auth_datasource.dart';
import 'package:praise_app_flutter/infrastructure/repository/auth/google_auth_repository_impl.dart';

final googleAuthRepositoryProvider = Provider<GoogleAuthRepository>(
  (ref) => GoogleAuthRepositoryImpl(
    googleAuthDatasource: ref.watch(googleAuthDatasourceProvider), 
    googleAuthFactory: ref.watch(googleAuthFactoryProvider))
);

abstract class GoogleAuthRepository {
  Future<Auth> execute();
}