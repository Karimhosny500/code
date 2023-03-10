// import 'package:final_skate/views/admin_dashboard/Client.dart';
import 'package:final_skate/views/auth/login.dart';
import 'package:final_skate/views/home.dart';

// import 'package:final_skate/views/main/main_screen_admin.dart';
// import 'package:final_skate/views/main/main_screen_user.dart';
import 'package:final_skate/views/not_found.dart';
import 'package:final_skate/views/splash.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static final Handler splashHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const Splash());

  static final Handler loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const Login());

  static Handler mainHandlerAdmin = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return homepage(
      index: 0,
    );
  });
  // static Handler ClientHandler = Handler(
  //     handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  //   return const ViewClient();
  // });
  // static Handler addhandler = Handler(
  //     handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  //   return addClient();
  // });
  // static Handler edithandler = Handler(
  //     handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  //   return editClient();
  // });

  // static Handler mainHandlerUser = Handler(
  //     handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  //   return MainScreenUser(page: params['name'][0]);
  // });

  static Handler notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const NotFound();
  });

  static void setupRouter() {
    router.define(
      '/',
      handler: splashHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/skate/login',
      handler: loginHandler,
      transitionType: TransitionType.inFromRight,
    );

    router.define(
      '/skate/admin/home',
      handler: mainHandlerAdmin,
      transitionType: TransitionType.inFromRight,
    );
    // router.define(
    //   '/skate/admin/dashboard/Client',
    //   handler: ClientHandler,
    //   transitionType: TransitionType.inFromRight,
    // );
    // router.define(
    //   '/skate/admin/dashboard/Client/add',
    //   handler: addhandler,
    //   transitionType: TransitionType.inFromRight,
    // );
    // router.define(
    //   '/ems/admin/client',
    //   handler: ClientHandler,
    //   transitionType: TransitionType.inFromRight,
    // );

    // router.define(
    //   '/ems/user/:name',
    //   handler: mainHandlerUser,
    //   transitionType: TransitionType.inFromRight,
    // );

    router.notFoundHandler = notFoundHandler;
  }
}
