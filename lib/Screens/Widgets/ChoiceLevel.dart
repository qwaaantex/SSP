import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
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
                showModalBottomSheet(
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
                      (context) => Column(
                        children: [
                          SizedBox(height: 16),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.006,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48),
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48),
                            ),
                            child: SingleChildScrollView(child: Usage()),
                          ),
                        ],
                      ),
                );
              },
              icon: Icons.keyboard_arrow_right,
            ),
          ],
      buttonBuilder:
          (context, showMenu) => TextButton(
            style: TextButton.styleFrom(overlayColor: Colors.transparent),
            onPressed: showMenu,
            child: Icon(
              Ionicons.hardware_chip,
              color: Colors.white70,
              size: 30,
            ),
          ),
    );
  }
}
