import 'package:flutter_riverpod/flutter_riverpod.dart';

// button active
final isButtonActive = StateProvider.autoDispose<bool>((ref) => true);

// button loading
final isButtonLoading = StateProvider.autoDispose<bool>((ref) => false);