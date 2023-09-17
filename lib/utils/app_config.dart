import 'dart:io';
import 'package:yaml/yaml.dart';

class AppConfig{
  static late YamlMap config;

   static load() async {
    final file = File('assets/config.yaml');
    final yamlString = file.readAsStringSync();
    config = loadYaml(yamlString);
  }

  static get(String key) {
    return config[key];
  }

  static getConfig(){
     return config;
  }
}