import 'package:git_gui/constants/application_constants.dart';
import 'package:git_gui/vo/tab_context.dart';

class TabContextHolder{
  static bool _didLoad = false;
  static late List<TabContext> _allTabs = [];
  static init(){
    _allTabs.add(TabContext(tabType: HOME_TAB_TYPE, contextId: 0, tabTitle: null));
    _allTabs.add(TabContext(tabType: REPO_TAB_TYPE, contextId: 1, tabTitle: "short title"));
    _allTabs.add(TabContext(tabType: WORKSPACE_TAB_TYPE, contextId: 2, tabTitle: "a very very long title"));
    _allTabs.add(TabContext(tabType: WORKSPACE_TAB_TYPE, contextId: 3, tabTitle: "short title"));
    _allTabs.add(TabContext(tabType: REPO_TAB_TYPE, contextId: 4, tabTitle: "a very very long title"));
    _allTabs.add(TabContext(tabType: WORKSPACE_TAB_TYPE, contextId: 5, tabTitle: "short title"));
    _allTabs.add(TabContext(tabType: REPO_TAB_TYPE, contextId: 6, tabTitle: "short title"));
    _allTabs.add(TabContext(tabType: REPO_TAB_TYPE, contextId: 7, tabTitle: "a very very long title"));
    _allTabs.add(TabContext(tabType: WORKSPACE_TAB_TYPE, contextId: 8, tabTitle: "a very very long title"));
    _allTabs.add(TabContext(tabType: NEW_TAB_TYPE, contextId: null, tabTitle: null));
    setActiveTab(0);
  }

  static getAllTabInfo(){
    if(!_didLoad){
      init();
      _didLoad = true;
    }
    return _allTabs;
  }

  static addTab(){

  }

  static closeTab(int? contextId){
    if(contextId!=0 && contextId!=null){
      TabContext context = _allTabs.firstWhere((element) => (element.contextId!=null && element.contextId?.compareTo(contextId)==0));
      _allTabs.remove(context);
      if(_allTabs.length>=2)
      setActiveTab(_allTabs.elementAt(_allTabs.length-2).contextId);
      else setActiveTab(0);
    }
  }

  static void setActiveTab(int? contextId){
    for(TabContext entry in _allTabs){
      if(entry.contextId == contextId){
        entry.isActive = true;
      }
      else entry.isActive = false;
    }
  }
}