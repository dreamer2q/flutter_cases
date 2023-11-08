import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cases/config/firebase_options.dart';
import 'package:flutter_cases/providers/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

BuildContext? globalContext;

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ));

      runApp(
        const ProviderScope(
          child: MyApp(),
        ),
      );
    },
    (error, stackTrace) {
      if (kReleaseMode) {
        // TODO 上报错误
      } else {
        debugPrint('$error');
        debugPrintStack(stackTrace: stackTrace);
      }
    },
    zoneSpecification: ZoneSpecification(
      print: (self, parent, zone, line) {
        // TODO 日志收集
        return parent.print(zone, line);
      },
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Cases',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        globalContext ??= context;
        return child!;
      },
    );
  }
}
