import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramxflutter/redux/model/app_state_model.dart';
import 'package:instagramxflutter/redux/store.dart';
import 'package:instagramxflutter/widgets/splash.dart';

void main() async {
  Store<AppState> _store = await createStore();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([]).then((_) {
    runApp(MyApp(store: _store));
  });
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({Key key, this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: DevicePreview(
        builder: (BuildContext context) {
          return MaterialApp(
            builder: DevicePreview.appBuilder,
            theme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
