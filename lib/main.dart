import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'core/app_export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) async {
    await dotenv.load(fileName: 'assets/.env');
    final deviceInfoPlugin = DeviceInfoPlugin();
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);

    if (kReleaseMode) {
      Future<SentryEvent> beforeSend(SentryEvent event, {dynamic hint}) async {
        var extraData = <String, String>{};
        if (GetPlatform.isAndroid) {
          var d = await deviceInfoPlugin.androidInfo;
          extraData.addAll({
            'OS version': d.version.release,
            'Model': d.model,
            'Manufacturer': d.manufacturer,
          });
        } //ios
        else {
          var d = await deviceInfoPlugin.iosInfo;
          extraData.addAll({
            'OS version': d.systemVersion,
            'Model': d.model,
            'Manufacturer': d.name,
          });
        }
        event = event.copyWith(tags: extraData);

        return event;
      }

      await SentryFlutter.init(
        (options) {
          options.beforeSend = beforeSend;
          options.dsn = dotenv.env['SENTRY_DSN'];
          options.tracesSampleRate = 1.0;
        },
        appRunner: () => runApp(MyApp()),
      );
    } else {
      runApp(MyApp());
    }
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        visualDensity: VisualDensity.standard,
        useMaterial3: true,
        appBarTheme: AppBarTheme(foregroundColor: Colors.white),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.white),
        ),
      ),
      title: 'MovDB',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
