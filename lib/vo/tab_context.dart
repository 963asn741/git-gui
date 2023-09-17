import 'dart:collection';

class TabContext{
  TabContext({required this.tabType, required this.contextId, required this.tabTitle });

  TabContext.withIsActive({required this.tabType, required this.contextId, required this.tabTitle, required this.isActive});

  String tabType;
  int? contextId;
  String? tabTitle;
  late bool isActive;


  @override
  String toString() {
    // TODO: implement toString
    return '{tabType: $tabType, contextId: $contextId, tabTitle: $tabTitle, isActive: $isActive}';
  }


 }