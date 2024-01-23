import 'package:get_it/get_it.dart';
import 'package:hotels_exploration/injection.config.dart';
import 'package:injectable/injectable.dart';

///getIt
final GetIt getIt = GetIt.instance;

///configure Injection
@injectableInit
GetIt configureInjection(String env) => getIt.init(environment: env);
