import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// This file does not exist yet,
// it will be generated in the next step
import 'main.directories.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // The [directories] variable does not exist yet,
      // it will be generated in the next step
      directories: directories,
      addons: <WidgetbookAddon>[
        MaterialThemeAddon(
          themes: <WidgetbookTheme<ThemeData>>[
            WidgetbookTheme<ThemeData>(
              name: 'Dark',
              data: ThemeData(
                textTheme: const TextTheme(
                  bodyMedium: TextStyle(color: Colors.white),
                ),
                scaffoldBackgroundColor:
                    const Color.fromARGB(255, 191, 137, 96), // 背景色を指定
              ),
            ),
            WidgetbookTheme<ThemeData>(
              name: 'Light',
              data: ThemeData.light(),
            ),
          ],
        ),
        DeviceFrameAddon(
          devices: <DeviceInfo>[
            Devices.ios.iPhone13,
            Devices.android.samsungGalaxyS20,
          ],
        ),
      ],
    );
  }
}
