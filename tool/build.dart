import 'package:build/build.dart';
import 'package:jaguar_generator/phase/import.dart';

const String library = "jaguar_spa";
const List<String> jaguar_files = const ['lib/src/jaguar_spa.dart'];

PhaseGroup getPhaseGroup() {
  return new PhaseGroup()
    ..addPhase(apisPhase(library, jaguar_files));
}

main() async {
  build(getPhaseGroup(), deleteFilesByDefault: true);
}
