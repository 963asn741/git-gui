import 'package:git_gui/utils/app_config.dart';

late double SCREEN_MIN_RES_HEIGHT;
late double SCREEN_MIN_RES_WIDTH;

initConstants(){
  SCREEN_MIN_RES_HEIGHT = AppConfig.get('minimumResolution')['height'];
  SCREEN_MIN_RES_WIDTH = AppConfig.get('minimumResolution')['width'];
}

const String REPO_TAB_TYPE = "REPOSITORY";
const String WORKSPACE_TAB_TYPE = "WORKSPACE";
const String HOME_TAB_TYPE = "HOME";
const String NEW_TAB_TYPE = "NEW TAB";