import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:stonescrissorpaper/Screens/GameInfo.dart';
import 'package:stonescrissorpaper/Screens/Widgets/Usage.dart';

class ChoiceLevel extends StatefulWidget {
  const ChoiceLevel({super.key});

  @override
  State<ChoiceLevel> createState() => _ChoiceLevelState();
}

class _ChoiceLevelState extends State<ChoiceLevel> {
  @override
  Widget build(BuildContext context) {
    return PullDownButton(
      position: PullDownMenuPosition.automatic,

      routeTheme: PullDownMenuRouteTheme(
        backgroundColor: ThemeData.dark().disabledColor,
      ),

      itemBuilder:
          (context) => [
            const PullDownMenuTitle(title: Text('Выбор страницы')),
            PullDownMenuHeader(
              leading: Icon(Icons.gamepad),
              title: 'О игре',
              subtitle: 'Выбрать..',
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 300),
                    pageBuilder:
                        (context, animation, secondaryAnimation) => GameInfo(),
                    transitionsBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              },

              icon: Icons.keyboard_arrow_right,
            ),
            PullDownMenuHeader(
              leading: Icon(Icons.data_usage),
              title: 'Использование',
              subtitle: 'Выбрать..',
              onTap: () {
                showBarModalBottomSheet(
                  animationCurve: Curves.easeIn,
                  backgroundColor: ThemeData.dark().canvasColor,
                  context: context,
                  barrierColor: Colors.black.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(48),
                    ),
                  ),
                  isDismissible: true,
                  builder:
                      (context) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48),
                        ),
                        child: SingleChildScrollView(child: Usage()),
                      ),
                );
              },
              icon: Icons.keyboard_arrow_right,
            ),
          ],
      buttonBuilder:
          (context, showMenu) => CupertinoButton(
            onPressed: showMenu,
            child: const Icon(
              Ionicons.hardware_chip,
              color: Colors.white70,
              size: 24,
            ),
          ),
    );
  }
}
