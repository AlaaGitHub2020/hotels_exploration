import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hotels_exploration/domain/api/i_api_repository.dart';
import 'package:hotels_exploration/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hotels_exploration/injection.dart';
import 'package:hotels_exploration/views/core/hotels_exploration_app_widget.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'domain/core/utilities/config.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      FlutterNativeSplash.preserve(
        widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
      );
      await appConfiguration();
      runApp(const HotelsExplorationAppWidget());
    },
    (Object error, StackTrace stack) {
      getLogger().e('‍⛔[CrashEvent] [DEBUG] $error\n$stack');
    },
  );
}

///app Configuration
Future<void> appConfiguration() async {
  try {
    getLogger().i('appConfiguration Started');
    prepareTheLogger();
    await Config().load();
    configureInjection(Environment.prod);
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: <SystemUiOverlay>[
        SystemUiOverlay.top,
        SystemUiOverlay.bottom,
      ],
    );
    await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp],
    );
    await getIt<IAPIRepository>().init();
    FlutterNativeSplash.remove();
  } on Exception catch (e) {
    getLogger().e('Exception Error : $e');
  }
}

///prepare The Logger
void prepareTheLogger() {
  try {
    getLogger().i('prepareTheLogger Started');
    if (kReleaseMode) {
      Logger.level = Level.info;
    } else {
      Logger.level = Level.debug;
    }
  } on Exception catch (error) {
    getLogger().e('Exception Error: $error');
  }
}
