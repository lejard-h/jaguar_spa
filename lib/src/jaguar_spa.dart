library static_file.src;

import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:jaguar/jaguar.dart';
import 'package:jaguar_static_file/jaguar_static_file.dart';
import 'package:package_resolver/package_resolver.dart';

part 'jaguar_spa.g.dart';

@Api()
class JaguarSpa extends _$JaguarJaguarSpa {
  final bool isProd;

  JaguarSpa({this.isProd: false});

  @Route(path: '/:path*', methods: const ["GET"])
  @WrapStaticFile()
  Future<JaguarFile> redirect(String path) async {
    bool isPackage = false;

    if (path.startsWith("packages/") && !isProd) {
      SyncPackageResolver resolver = await SyncPackageResolver.loadConfig("${Directory.current.uri}.packages");
      String toResolve = path.replaceFirst("packages/", "package:");
      Uri uri = await resolver.resolveUri(toResolve);
      path = "/${uri.path}";
      isPackage = true;
    }

    String prefix = "${Directory.current.path}/build/web";
    if (!isProd) {
      if (isPackage) {
        prefix = "";
      } else {
        prefix = "${Directory.current.path}/web";
      }
    }

    if (!path.startsWith("/")) {
      path = "/$path";
    }

    if (path == null || path.isEmpty || path == "/" || !(new File("$prefix$path")).existsSync()) {
      path = "/index.html";
    }
    return new JaguarFile("$prefix$path");
  }
}
