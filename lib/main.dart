import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/core/constants/custom_color.dart';
import 'package:praise_app_flutter/core/constants/sharedPreference/shared_preference_instance.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:praise_app_flutter/ui/view/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_ANON_KEY'),
  );
  final session = Supabase.instance.client.auth.currentSession;
  await SharedPreferencesInstance.initialize();
  final prefs = SharedPreferencesInstance().prefs;
  if(session != null) {
    prefs.setString('session', session.toString());
  } else {
    prefs.remove('session');
  }

  runApp(
    const ProviderScope(child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(CustomColor.mainColor)),
        useMaterial3: true,
      ),
    );
  }
}
