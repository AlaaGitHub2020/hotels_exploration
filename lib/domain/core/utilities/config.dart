import 'package:flutter/services.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:yaml/yaml.dart';

class Config {
  static YamlMap? _config;

  Future<void> load() async {
    getLogger().i('load Started');
    if (_config == null) {
      getLogger().i('load _config reStarted');
      final data = await rootBundle.loadString(DomainConstants.apiConfigFile);
      Config._config = loadYaml(data);
    }
  }

  String get(String key) {
    getLogger().i('get Started key:$key');
    return Config._config?.value[key];
  }
}
