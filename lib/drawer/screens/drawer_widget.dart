import 'package:dollar/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dollar Today',
                    style: TextStyle(
                        color: Theme.of(context)
                            .appBarTheme
                            .titleTextStyle!
                            .color),
                  ),
                  ThemeSwitcher(
                    clipper: const ThemeSwitcherCircleClipper(),
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: Icon(!Get.isDarkMode
                            ? Icons.brightness_2
                            : Icons.wb_sunny), //wb_sunny
                        onPressed: () {
                          var brightness =
                              ThemeModelInheritedNotifier.of(context)
                                  .theme
                                  .brightness;
                          ThemeSwitcher.of(context).changeTheme(

                              theme: Get.isDarkMode
                                  ? Themes.lightTheme
                                  : Themes.darkTheme,
                              isReversed:  brightness == Brightness.dark ? true : false,
                              
                              );
                          Get.changeThemeMode(Get.isDarkMode
                              ? ThemeMode.light
                              : ThemeMode.dark);
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Calculator'),
            //tileColor: Get.currentRoute == '/home' ? Colors.grey[300] : null,
            onTap: () {
              // print(Get.currentRoute);
              // Get.back();
              // Get.offNamed('/home');
            },
          ),
          // ListTile(
          //   title: const Text('Item 1'),
          //   tileColor: Get.currentRoute == '/page1' ? Colors.grey[300] : null,
          //   onTap: () {
          //     Get.back();
          //     Get.offNamed('/page1');
          //   },
          // ),
          // ListTile(
          //   title: const Text('Item 2'),
          //   tileColor: Get.currentRoute == '/page2' ? Colors.grey[300] : null,
          //   onTap: () {
          //     Get.back();
          //     Get.offNamed('/page2');
          //   },
          // ),
        ],
      ),
    );
  }
}
