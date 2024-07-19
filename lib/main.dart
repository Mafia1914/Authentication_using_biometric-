import 'package:dio/dio.dart';
import 'package:ecommerce_app/xapp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'app/data/auth/auth_provider.dart';
import 'app/data/comments/comments_network_services.dart';
import 'app/data/comments/comments_repositry.dart';
import 'app/data/pts/pts_network_services.dart';
import 'app/data/pts/pts_repositry.dart';
import 'app/data/user/user_provider.dart';
import 'app/modules/splash/controllers/splash_controller.dart';
import 'app/utils/logout_helper.dart';


void main() {
  final authProvider = AuthProvider();
  final dio = Dio(BaseOptions(
    // baseUrl: Config.baseUrl,
    headers: {
      'Content-Type': 'application/json',
      'Accept-Charset': 'utf-8',
    },
  ));
  final userProvider = UserProvider(
    authProvider: authProvider,

  );
  Get
    ..put(SplashController())
    ..put(userProvider)
    ..put(authProvider)
    ..put(LogoutHelper(
      authProvider: authProvider,
      userProvider: userProvider,
    ))
    ..put(PtsRepository(ptsNetworkService: PtsNetworkService(dio: dio)))
    ..put(CommentsRepository(commentsNetworkService: CommentsNetworkService(dio: dio)));
  runApp(
    const XApp(),
  );
}
