# jaguar_spa

## Usage

```dart

import 'package:jaguar/jaguar.dart';
import 'package:jaguar_spa/jaguar_spa.dart';

main(List<String> args) async {
  bool isProd = false;
  if (args.isNotEmpty == true && args.first == "prod") {
    isProd = true;
  }
  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 8080 : int.parse(portEnv);
  jaguar.Configuration configuration = new jaguar.Configuration(multiThread: false, port: port);
  configuration.addApi(new MyApi1());
  configuration.addApi(new MyApi2());
  ...
  configuration.addApi(new JaguarSPA(isProd: isProd));

  await jaguar.serve(configuration);
}
```