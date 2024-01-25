import 'package:flutter_riverpod/flutter_riverpod.dart';

final hidePassword = StateProvider.autoDispose<bool>((ref) => true);