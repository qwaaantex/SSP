import 'package:flutter/material.dart';
import 'package:stonescrissorpaper/Screens/Game.dart';
import 'package:stonescrissorpaper/Screens/Widgets/Created.dart';

class GameInfo extends StatefulWidget {
  const GameInfo({super.key});

  @override
  State<GameInfo> createState() => _GameInfoState();
}

class _GameInfoState extends State<GameInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData.dark().canvasColor,

      body: Stack(
        children: [
          NestedScrollView(
            floatHeaderSlivers: false,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  scrolledUnderElevation: 0,
                  pinned: true,
                  title: Text(
                    "О игре",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: ThemeData.dark().canvasColor,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 300),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  GameScreen(),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
                  ),
                ),
              ];
            },
            body: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Что собрано в этой статье?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "Прежде всего история создания данной игры, что она означает, а также кто её придумал и по какому принципу в неё играть",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Что такое камень, ножницы, бумага?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        softWrap: true,
                      ),
                      Text(
                        "«Камень, ножницы, бумага» – гениальная и простая игра, знакомая каждому. Вам потребуется минута, чтобы понять правила, и вечность, чтобы стать мастером. Еще этот социальный ритуал позволяет разрешать споры и находить того, кто спустится встретить курьера, когда всем в компании лень. Великая вещь. Вы явно знаете ее с детства. Но есть и то, о чем почти никто не задумывается. Что такое «цуефа»? Чтобы сыграть в «камень, ножницы, бумагу» вам необязательно произносить странное ритуальное заклинание при сотрясании кулака – можно обойтись официально-деловым «раз, два, три!» Но это ведь скучно! А «цуефа» говорят почти везде, за исключением немногочисленного лагеря последователей «чи-чи-ко», но в эту сторону мы точно не пойдем. Что же такое «цуефа»? В контексте русского языка этот выкрик звучит странно и неестественно, но все почему-то спокойно принимают его на веру. На самом деле объяснение есть. Правда, велик шанс, что оно вас не устроит. Дело в том, что «камень, ножницы, бумага» – по сути, китайская игра XVII века, заменившая предыдущие древние аналоги системы «трое, которые боятся друг друга». В Японии тоже есть популярные аналоги. Но «цуефа» точно пришла из Китая и на самом деле это именно «цу-е-фа», через дефис. Вот как это выглядит на китайском: 取悦發. А звучит даже в версии онлайн-переводчика действительно как «цу-е-фа». Означать это должно «пожалуйста, начинайте», что как будто логично для предварения игры. Впрочем, те же онлайн-переводчики утверждают, что «цу-е-фа» на самом деле означает «пожалуйста, волосы». Странно, но допустим. Гораздо большая проблема в том, что никто на самом деле не знает, когда и почему при игре в «камень-ножницы-бумага» стали говорить «цу-е-фа». Изначально игра пришла с обыкновенным счетом «раз-два-три», и многие люди старшего поколения помнят ее именно в таком виде. Но «цу-е-фа» – самый распространенный универсальный вариант. Хотя, конечно, существуют и другие региональные разновидности. На Дальнем Востоке, например, вместо «цу-е-фа» говорили «эн-ден-цо». Судя по всему, китайский вариант распространился и закрепился только в 1990-х и 2000-х, но что стало катализатором, непонятно. Однако все равно приятно знать, что у этого ритуала есть какое-то значение на другом языке, а не думать, что это просто хаотичный набор звуков. Даже если онлайн-переводчик говорит, что каждый раз, играя в «камень, ножницы, бумага», вы произносите «пожалуйста, волосы».",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Как в неё играть?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        softWrap: true,
                      ),
                      Text(
                        "В классическом варианте в игру играют вдвоём, однако возможно большее количество участников. « Камень, ножницы, бумага» часто используется как способ жеребьёвки для определения очерёдности хода или ведущего в других играх, для разрешения спора или принятия беспристрастного группового решения.",

                        style: TextStyle(color: Colors.grey, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Как её придумали?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        softWrap: true,
                      ),
                      Text(
                        "Считается, что игру придумали в Китае. Первое упоминание об игре «шоушилин», что можно перевести как «команды рукой», датируется III веком нашей эры. Изначальный вариант был описан в книге «Уцзацзу» в позднюю эпоху Мин. В ней указывалось, что так развлекались военачальники эпохи династии Лю. Так они учились просчитывать стратегию и тактику партнера. Со временем «шоушилин» добрался до Японии, где его назвали «дзян-кэн». Затем игра распространилась по всему миру, делая остановки в разных странах. В Великобритании и США ее называют Rock paper scissors, или «Рошамбо». Также она известна в англоязычных странах под псевдонимами Bato Bato Pik, Jak-en-poy и Quartz, Parchment, Shears. Особую популярность игра приобрела, когда ее начали использовать для розыгрыша подач в крикете. В Германии «камень, ножницы, бумага» называют Schnick, Schnack, Schnuck. Изменилось название и в самом Китае. Теперь это Jiandao Shítou Bu.",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Created(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
