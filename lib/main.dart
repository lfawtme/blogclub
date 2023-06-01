import 'package:blogclub/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFontFamily = 'Avenir';
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff0D253C);
    final secondTextColor = Color(0xff2D4379);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            subtitle1: TextStyle(
              fontFamily: defaultFontFamily,
              color: secondTextColor,
              fontSize: 14,
            ),
            headline6: TextStyle(
                fontFamily: defaultFontFamily,
                fontWeight: FontWeight.bold,
                color: primaryTextColor),
            bodyText2: TextStyle(
                fontFamily: defaultFontFamily,
                color: secondTextColor,
                fontSize: 14)),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Fateme!',
                      style: themeData.textTheme.subtitle1,
                    ),
                    Image.asset(
                      'assets/img/icons/notification.png',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 24),
                child: Text(
                  'Explore today’s',
                  style: themeData.textTheme.headline6,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: ListView.builder(
                    itemCount: stories.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                    itemBuilder: (context, index) {
                      final story = stories[index];

                      return Container(
                        margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: Column(
                          children: [
                            Container(
                              width: 68,
                              height: 68,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    colors: [
                                      Color(0xff376AED),
                                      Color(0xff49B0E2),
                                      Color(0xff9CECFB),
                                    ]),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(story.name),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
