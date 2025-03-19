import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stonescrissorpaper/Provider/Provider.dart';
import 'package:stonescrissorpaper/Screens/Widgets/ChoiceLevel.dart';
import 'package:stonescrissorpaper/Screens/Widgets/Created.dart';
import 'package:stonescrissorpaper/Screens/Widgets/FeedBacks.dart';
import 'package:stonescrissorpaper/Screens/Widgets/ListDotsVariants.dart';
import 'package:stonescrissorpaper/Screens/Widgets/SubTittle.dart';
import 'package:stonescrissorpaper/Screens/Widgets/Tittle.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  List levels = List.generate(3, (i) => i);

  @override
  Widget build(BuildContext context) {
    var widght = MediaQuery.of(context).size.width * 0.9;
    ProviderGame _provider = Provider.of<ProviderGame>(context);
    bool isPlaying = _provider.isPlaying;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: ThemeData.dark().canvasColor),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,

                child: Column(
                  children: [
                    SubTittle(),
                    SizedBox(height: 10),
                    Tittle(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.5,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          colors: [Colors.grey.shade600, Colors.grey],
                        ),
                      ),
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                            1,
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.5,
                                        child: PageView.builder(
                                          physics:
                                              AlwaysScrollableScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          onPageChanged: (index) {
                                            _provider.toggleVariants(index);
                                          },
                                          itemBuilder: (context, index) {
                                            return SizedBox(
                                              width:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  1,
                                              height:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.height *
                                                  0.5,
                                              child:
                                                  !_provider.isChosensStep
                                                      ? Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${_provider.GetAnswerTimer}",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 50,
                                                            ),
                                                            textAlign:
                                                                TextAlign
                                                                    .center,
                                                          ),
                                                          Text(
                                                            "Генерируем ответ..",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                      : !_provider.isStepEnd
                                                      ? Center(
                                                        child: Text(
                                                          !_provider
                                                                  .isRightAnswer
                                                              ? "Верно"
                                                              : "Неверно",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      )
                                                      : TextButton(
                                                        style: TextButton.styleFrom(
                                                          overlayColor:
                                                              Colors
                                                                  .transparent,
                                                        ),
                                                        onPressed: () {
                                                          _provider.getAnswer(
                                                            index,
                                                          );
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "Ваш выбор:",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors
                                                                        .white70,
                                                                fontSize: 30,
                                                              ),
                                                            ),
                                                            Text(
                                                              _provider
                                                                  .AnswersVariants[index],
                                                              style: TextStyle(
                                                                color:
                                                                    Colors
                                                                        .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 26,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),

                                                            SizedBox(
                                                              height: 10,
                                                            ),

                                                            Image.asset(
                                                              index == 0
                                                                  ? "assets/images/Stone.png"
                                                                  : index == 1
                                                                  ? "assets/images/Scissor.png"
                                                                  : "assets/images/Paper.png",
                                                              scale: 1.7,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                            );
                                          },
                                          itemCount:
                                              _provider.AnswersVariants.length,
                                        ),
                                      ),
                                    ],
                                  )
                                  : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${_provider.StartGame}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 50,
                                        ),
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
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: ChoiceLevel(),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Для начала игры,\nнажмите кнопку ниже.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                    ),

                    SizedBox(height: 10),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 450),
                      width: widght,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: isPlaying ? Colors.redAccent : Colors.green,
                      ),

                      child: TextButton(
                        onPressed: () {
                          _provider.toggleIsPlaying();
                          _provider.startGame();
                        },
                        child: Text(
                          isPlaying ? "Прекратить играть" : "Играть",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    FeedBack(),
                    SizedBox(height: 10),
                    Created(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
