// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/core/di/injector_container.dart' as di;
import 'package:movie_app/env/config.dart';
import 'package:movie_app/env/flavor.dart';

/// [isInDebugMode] check or get in debug mode or not
bool get isInDebugMode {
  var inDebugMode = false;
  // ignore: prefer_asserts_with_message
  assert(inDebugMode = true);
  return inDebugMode;
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
    FutureOr<Widget> Function() builder, FlavorSetting flavor) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // ignore: unnecessary_statements
      flavor;
      await di.init();
      await disableLandscape();

      await BlocOverrides.runZoned(
        () async => runApp(await builder()),
        blocObserver: AppBlocObserver(),
      );

      ///console flavor running
      if (!kReleaseMode) {
        final settings = await Config.getInstance();
        log('🚀 APP FLAVOR NAME      : ${settings.flavorName}', name: 'ENV');
        log('🚀 APP API_BASE_URL     : ${settings.apiBaseUrl}', name: 'ENV');
      }
    },
    (e, s) {
      if (isInDebugMode) {
        print('🔴 In dev mode. Not sending report.');
        print('ERROR :$e');
        print('STACKTRACE :$s');
      } else {
        print('🔴 OTHER_ERROR   :$e');
        print('🔴 STACKTRACE    :$s');
      }
    },
  );
}

/// disable landscape mode
Future<void> disableLandscape() async {
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
