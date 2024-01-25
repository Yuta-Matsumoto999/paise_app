import 'package:praise_app_flutter/domain/entity/auth/auth.dart';
import 'package:praise_app_flutter/domain/factory/auth/google_auth_factory.dart';
import 'package:praise_app_flutter/domain/repository/auth/google_auth_repository.dart';
import 'package:praise_app_flutter/infrastructure/datasource/auth/google_auth_datasource.dart';

class GoogleAuthRepositoryImpl implements GoogleAuthRepository {
  final GoogleAuthDatasource _googleAuthDatasource;
  final GoogleAuthFactory _googleAuthFactory;

  GoogleAuthRepositoryImpl({
    required GoogleAuthDatasource googleAuthDatasource,
    required GoogleAuthFactory googleAuthFactory
  }) : _googleAuthDatasource = googleAuthDatasource,
  _googleAuthFactory = googleAuthFactory;

  @override
  Future<Auth> execute() async {
    final res = await _googleAuthDatasource.execute();
    return _googleAuthFactory.createFromModel(res);
  }
}