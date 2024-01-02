import 'dart:io' show Platform;

import 'package:smart_home_bl/common_libs.dart';

import 'logic/app_logic.dart';
import 'router.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

void main() async {

  // Start app
  registerSingletons();
  runApp(const SmartHomeBlApp());
  await appLogic.bootstrap();
}


class SmartHomeBlApp extends StatelessWidget {
  const SmartHomeBlApp({super.key});

  @override
  Widget build(BuildContext context) {

    bool kisweb;
try{
    if(Platform.isAndroid||Platform.isIOS) {
        kisweb=false;
    } else {
        kisweb=true;
    }
} catch(e){
    kisweb=true;
}
  if (kisweb) {
    sqfliteFfiInit();
     databaseFactory = databaseFactoryFfiWeb;

  }

    return MaterialApp.router(
          title: 'Smart Home BL',
          debugShowCheckedModeBanner: false,
          routerDelegate: appRouter.routerDelegate,
          routeInformationProvider: appRouter.routeInformationProvider,
          routeInformationParser: appRouter.routeInformationParser,
        );
  }
}

void registerSingletons() {
  GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());
}

AppLogic get appLogic => GetIt.I.get<AppLogic>();
