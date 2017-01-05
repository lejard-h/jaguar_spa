// GENERATED CODE - DO NOT MODIFY BY HAND

part of static_file.src;

// **************************************************************************
// Generator: ApiGenerator
// Target: class JaguarSpa
// **************************************************************************

abstract class _$JaguarJaguarSpa implements RequestHandler {
  static const List<RouteBase> routes = const <RouteBase>[
    const Route(path: '/:path*', methods: const ["GET"])
  ];

  Future<JaguarFile> redirect(String path);

  Future<bool> handleRequest(HttpRequest request, {String prefix: ''}) async {
    PathParams pathParams = new PathParams();
    bool match = false;

//Handler for redirect
    match =
        routes[0].match(request.uri.path, request.method, prefix, pathParams);
    if (match) {
      Response<JaguarFile> rRouteResponse0 = new Response(null);
      StaticFile iStaticFile;
      try {
        iStaticFile = new WrapStaticFile().createInterceptor();
        rRouteResponse0.statusCode = 200;
        rRouteResponse0.value = await redirect(
          (pathParams.getField('path')),
        );
        Response<dynamic> rRouteResponse1 = await iStaticFile.post(
          rRouteResponse0,
        );
        await rRouteResponse1.writeResponse(request.response);
      } catch (e) {
        await iStaticFile?.onException();
        rethrow;
      }
      return true;
    }

    return false;
  }
}
