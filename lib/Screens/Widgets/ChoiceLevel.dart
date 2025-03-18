import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pull_down_button/pull_down_button.dart';

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
      routeTheme: PullDownMenuRouteTheme(backgroundColor: Colors.white70),

      itemBuilder:
          (context) => [
            const PullDownMenuTitle(title: Text('Сложность')),
            PullDownMenuHeader(
              leading: Icon(Icons.stream_outlined),
              title: 'Легкий',
              subtitle: 'Выбрать..',
              onTap: () {},
              icon: Icons.star_border,
            ),
            PullDownMenuHeader(
              leading: Icon(Icons.medical_services_rounded),
              title: 'Средний',
              subtitle: 'Выбрать..',
              onTap: () {},
              icon: Icons.star_half,
            ),
            PullDownMenuHeader(
              leading: Icon(Icons.handshake_rounded),
              title: 'Сложный',
              subtitle: 'Выбрать..',
              onTap: () {},
              icon: Icons.star,
            ),
          ],
      buttonBuilder:
          (context, showMenu) => CupertinoButton(
            onPressed: showMenu,
            child: const Icon(
              Ionicons.hardware_chip,
              color: Colors.white,
              size: 24,
            ),
          ),
    );
  }
}
