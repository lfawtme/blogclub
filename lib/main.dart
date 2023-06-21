import 'package:blogclub/carousel/carousel_slider.dart';
import 'package:blogclub/data.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

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
              fontWeight: FontWeight.w200,
              fontSize: 18,
            ),
            headline6: TextStyle(
                fontFamily: defaultFontFamily,
                fontWeight: FontWeight.bold,
                color: primaryTextColor),
            headline4: TextStyle(
                fontFamily: defaultFontFamily,
                fontSize: 24,
                fontWeight: FontWeight.w700,
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
                      width: 32,
                      height: 32,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 16),
                child: Text(
                  'Explore today’s',
                  style: themeData.textTheme.headline4,
                ),
              ),
              _StoryList(stories: stories),
              _CategoryList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (context, index, readIndex) {
          return _CategoryItem(
            category: categories[readIndex],
          );
        },
        options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            aspectRatio: 1.2,
            initialPage: 0,
            disableCenter: true,
            enableInfiniteScroll: false));
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;
  const _CategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              'assets/img/posts/large/${category.imageFileName}',
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [
                  Color(0xff0D253C),
                  Colors.transparent,
                ]),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        Positioned(
          bottom: 48,
          left: 48,
          child: Text(category.title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .apply(color: Colors.white)),
        )
      ],
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    super.key,
    required this.stories,
  });

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
          itemCount: stories.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          itemBuilder: (context, index) {
            final story = stories[index];

            return _Story(story: story);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    super.key,
    required this.story,
  });

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed
                  ? _profileImageViewed(context)
                  : _profileImageNormal(),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/img/icons/${story.iconFileName}',
                  height: 24,
                  width: 24,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(story.name),
        ],
      ),
    );
  }

  Container _profileImageNormal() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
          Color(0xff376AED),
          Color(0xff49B0E2),
          Color(0xff9CECFB),
        ]),
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(22)),
        padding: const EdgeInsets.all(5),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageViewed(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        radius: Radius.circular(24),
        color: const Color(0xff7B8BB2),
        dashPattern: const [8, 3],
        padding: EdgeInsets.all(7),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Image.asset('assets/img/stories/${story.imageFileName}'),
    );
  }
}
