import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {

  @EnviedField(varName: 'OPEN_AI_API_KEY', obfuscate: true)
  static final key = _Env.key;
}