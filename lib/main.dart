import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:flutter_4_statefull/helpers/custom_colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: ThemeColors.themeColor,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  double fontSize = 14;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Stateful Widget Vs. Stateless Widget"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 40,
                      child: FloatingActionButton(
                        onPressed: () {
                          fontSize--; // Ваш код тут ------------------------------------
                          setState(() {});
                        },
                        child: const Text(
                          '-',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      child: TextField(
                        enableInteractiveSelection: false,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: ThemeColors.themeColor),
                        controller: TextEditingController()
                          ..text = fontSize.toString(),
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: ThemeColors.themeColor, width: 3.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3.0),
                            ),
                            labelText: "Размер шрифта",
                            labelStyle: TextStyle(color: Color(0xFF01F909))),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered
                        onSubmitted: (String font) {
                          double newFont = double.parse(font);
                          setState(() {
                            fontSize =
                                newFont; // Ваш код тут ------------------------------------
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: FloatingActionButton(
                        onPressed: () {
                          if (fontSize >= 40) {
                            fontSize = 40;
                          } else {
                            fontSize++;
                          }
                          setState(() {});
                        },
                        child: const Text(
                          '+',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                _buildSpacer(20),
                Expanded(
                  child: Text(
                    "Винни-пух и пятачок отдыхали на веточке дуба. Пух сказал: ”Интересно, как долго мы ещё будем здесь торчать?” Пятачок ответил: ” Я думаю, ещё лет десять.",
                    style: TextStyle(
                      foreground: Paint()
                        ..shader = ui.Gradient.linear(
                          const Offset(20, 75),
                          const Offset(150, 20),
                          <Color>[
                            const Color.fromARGB(255, 3, 250, 3),
                            const Color(0xFFFEFE00),
                          ],
                        ),
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildSpacer(double space) {
  return SizedBox(
    height: space,
  );
}
