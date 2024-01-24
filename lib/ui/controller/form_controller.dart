import 'package:flutter_riverpod/flutter_riverpod.dart';

final isFormEdit = StateProvider.autoDispose<bool>((ref) => true);

// password visible
final hidePassword = StateProvider.autoDispose<bool>((ref) => true);