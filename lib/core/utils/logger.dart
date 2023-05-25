import 'package:movdb/core/utils/snackbar_util.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'dart:developer' as dev;

class Logger {
  static LogMode _logMode = LogMode.debug;

  static void init(LogMode mode) {
    Logger._logMode = mode;
  }

  static void log(dynamic data, {StackTrace? stackTrace}) async {
    if (_logMode == LogMode.debug) {
      dev.log("Error: $data$stackTrace");
    } else {
      await Sentry.captureException(
        data,
        stackTrace: stackTrace,
      );
    }

    SnackBarUtil.showSnackBar(
      title: 'Opppsss',
      message: 'Something went wrong.',
    );
  }
}

enum LogMode { debug, live }
