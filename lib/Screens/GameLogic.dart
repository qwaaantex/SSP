import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stonescrissorpaper/Provider/Provider.dart';
import 'package:stonescrissorpaper/Screens/Widgets/ChoiceLevel.dart';
import 'package:stonescrissorpaper/Screens/Widgets/ListDotsVariants.dart';

class GameLogic extends StatefulWidget {
  const GameLogic({super.key});

  @override
  State<GameLogic> createState() => _GameLogicState();
}

class _GameLogicState extends State<GameLogic> {
  @override
  Widget build(BuildContext context) {
    ProviderGame _provider = Provider.of<ProviderGame>(context);
    bool isPlaying = _provider.isPlaying;
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child:
          isPlaying
              ? _provider.isChosenStep
                  ? Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.bottomCenter,
                        child: ListDotsVariants(),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: PageView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index) {
                            _provider.toggleVariants(index);
                          },
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                transitionBuilder: (child, animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                child:
                                    !_provider.isChosensStep
                                        ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${_provider.GetAnswerTimer}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 50,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              "Генерируем ответ..",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        )
                                        : !_provider.isStepEnd
                                        ? Center(
                                          child: Text(
                                            !_provider.isRightAnswer
                                                ? "Верно"
                                                : "Неверно",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                        : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Ваш выбор:",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24,
                                              ),
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                overlayColor:
                                                    Colors.transparent,
                                              ),
                                              onPressed: () {
                                                _provider.getAnswer(index);
                                              },
                                              child: AnimatedSwitcher(
                                                duration: Duration(
                                                  milliseconds: 300,
                                                ),
                                                transitionBuilder: (
                                                  child,
                                                  animation,
                                                ) {
                                                  return FadeTransition(
                                                    opacity: animation,
                                                    child: child,
                                                  );
                                                },
                                                child: Image.asset(
                                                  index == 0
                                                      ? "assets/images/Stone.png"
                                                      : index == 1
                                                      ? "assets/images/Scissor.png"
                                                      : "assets/images/Paper.png",
                                                  scale: 1.7,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                              ),
                            );
                          },
                          itemCount: _provider.AnswersVariants.length,
                        ),
                      ),
                    ],
                  )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${_provider.StartGame}",
                        style: TextStyle(color: Colors.white, fontSize: 50),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Игра начнется через..",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
              : Stack(
                children: [
                  Align(alignment: Alignment.topRight, child: ChoiceLevel()),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/SSP_icon.png", scale: 4),

                        Text(
                          "Для начала игры,\nнажмите кнопку ниже.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
