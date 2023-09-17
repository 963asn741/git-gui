import 'package:flutter/material.dart';
import 'package:git_gui/context_holders/tab_context_holder.dart';
import 'package:git_gui/vo/tab_context.dart';

import '../../constants/application_constants.dart';

class HeaderTabBar extends StatefulWidget {
  const HeaderTabBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HeaderTabBarState();
}


class HeaderTabBarState extends State<HeaderTabBar> {
  late List<TabContext> tabInfos;

  Widget fromTabContext(TabContext tabContext) {
    var tab;
    Color tabBackgroundColor =
        tabContext.isActive ? Colors.black : Colors.transparent;
    Color textColor = tabContext.isActive ? Colors.white : Colors.white70;

    if (tabContext.tabType == HOME_TAB_TYPE) {
      tab = Container(decoration: const BoxDecoration(border: Border(right: BorderSide(width: 2,color: Colors.black38))),child: MaterialButton(
        onPressed: () {
          TabContextHolder.setActiveTab(tabContext.contextId);
          setState(() {
            tabInfos = TabContextHolder.getAllTabInfo();
          });
        },
        color: tabBackgroundColor,
        elevation: 0,
        minWidth: 50,
        padding: EdgeInsets.all(20),
        child: Icon(
          Icons.home_filled,
          color: tabContext.isActive ? Colors.white : Colors.grey,
        ),
      ),);
    } else if (tabContext.tabType == REPO_TAB_TYPE ||
        tabContext.tabType == WORKSPACE_TAB_TYPE) {
      tab = Container(
        decoration: const BoxDecoration(border: Border(
          left: BorderSide(
          color: Colors.black38,
          width: 1,
        ),
        right: BorderSide(
          color: Colors.black38,
          width: 1,
        ))),
        constraints: BoxConstraints(maxWidth: 200),
        child: MaterialButton(
            color: tabBackgroundColor,
            elevation: 0,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            onPressed: () {
              TabContextHolder.setActiveTab(tabContext.contextId);
              setState(() {
                tabInfos = TabContextHolder.getAllTabInfo();
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Icon(
                    tabContext.tabType==REPO_TAB_TYPE?Icons.call_split:Icons.workspaces,
                    color: textColor,
                    size: 20,
                  ),
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      tabContext.tabTitle!,
                      style: TextStyle(color: textColor, fontWeight: FontWeight.normal),
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    )),
                CloseButton(
                  style: ButtonStyle(
                    iconSize: MaterialStateProperty.all(5),
                  ),
                  onPressed: () {
                    TabContextHolder.closeTab(tabContext.contextId);
                    setState(() {
                      tabInfos = TabContextHolder.getAllTabInfo();
                    });
                  },
                  color: textColor,
                ),
              ],
            )),
      );
    } else {
      tab = MaterialButton(
        onPressed: () {},
        minWidth: 50,
        padding: EdgeInsets.all(20),
        color: tabBackgroundColor,
        elevation: 0,
        child: Icon(
          Icons.add,
          color: tabContext.isActive ? Colors.white : Colors.grey,
        ),
      );
    }
    return tab;
  }

  @override
  void initState() {
    tabInfos = TabContextHolder.getAllTabInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black26,
        height: 50,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: tabInfos.map((e) => fromTabContext(e)).toList(),
          ),
        ));
  }
}
