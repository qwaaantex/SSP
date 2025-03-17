import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stonescrissorpaper/Provider/Provider.dart';
import 'package:stonescrissorpaper/Screens/Widgets/ListDotsVariants.dart';
import 'package:stonescrissorpaper/Screens/Widgets/SubTittle.dart';
import 'package:url_launcher/url_launcher.dart';

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
    Uri _uri = Uri.parse(_provider.link);
    bool isPlaying = _provider.isPlaying;
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(color: Colors.black87)),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,

                child: Column(
                  children: [
                    SubTittle(),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Игра",

                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 2),
                        Container(
                          alignment: Alignment.topRight,
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.green,
                          ),

                          child: Center(
                            child: Text(
                              "AI",
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.65,

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
                                                      ? Center(
                                                        child: Text(
                                                          "${_provider.GetAnswerTimer}",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 50,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      )
                                                      : !_provider.isStepEnd
                                                      ? Center(
                                                        child: Text(
                                                          !_provider
                                                                  .isRightAnswer
                                                              ? "Верно"
                                                              : "Неверно",
                                                        ),
                                                      )
                                                      : TextButton(
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
                                                              _provider
                                                                  .AnswersVariants[index],
                                                              style: TextStyle(
                                                                color:
                                                                    Colors
                                                                        .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            Image.asset(
                                                              index == 0
                                                                  ? "assets/images/Stone.png"
                                                                  : index == 1
                                                                  ? "assets/images/Scissor.png"
                                                                  : "assets/images/Paper.png",
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
                                  : Text(
                                    "${_provider.StartGame}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 50,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                              : Stack(
                                children: [
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
                        borderRadius: BorderRadius.circular(48),
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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.blueAccent],
                        ),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          if (!await launchUrl(_uri)) {
                            print("Ошибка");
                          }
                        },
                        child: Text(
                          "Оставить отзыв",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
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
