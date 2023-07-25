import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget{
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themedata=Theme.of(context);
    return Scaffold(
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
          color: themedata.colorScheme.primary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: themedata.colorScheme.primary,
              blurRadius: 12,
            ),
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: InkWell(
            onTap: () {
              showSnackBar(context, 'Like Button is clicked');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.img.icons.thumbs.svg(height: 24,width: 24),
                const SizedBox(width: 8,),
                Text('2.1k',style: themedata.textTheme.titleSmall!.copyWith(
                  color: Colors.white,fontSize: 15,
                ),),
              ],
            ),
          ),
        ),
        
      ),
      backgroundColor: themedata.colorScheme.surface,
      appBar: AppBar(title: const Text('Article'),
      actions: [
        IconButton(
          onPressed: (){

          }, 
          icon: const Icon(Icons.more_horiz_rounded)),
          const SizedBox(width: 20,)
           ],
        ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
               padding: const EdgeInsets.fromLTRB(32,16,32,16),
               child: Text('Four Things Every Woman Needs To Know',
                style:themedata.textTheme.headlineMedium,
                ),
             ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32,0,32,32),
                child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Assets.img.stories.story10.image(
                          width: 48,height: 48,fit: BoxFit.cover)
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                         Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Richard Gervain',
                              style: themedata.textTheme.titleSmall!.copyWith
                              (fontWeight: FontWeight.w500)),
                              const SizedBox(height: 4,),
                              Text('2m ago',style: TextStyle(color: themedata.colorScheme.primary),),
                            ],
                          ),
                        ),
                         IconButton(
                          onPressed: (){
      
                          },
                          icon: Icon(CupertinoIcons.bookmark,
                          color: themedata.colorScheme.primary,
                          )),
                         IconButton(
                          onPressed: () {
                            
                          },
                          icon: Icon(CupertinoIcons.share,
                          color: themedata.colorScheme.primary,
                          )),
                    ],
                       ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  ),
                child: Assets.img.background.singlePost.image(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32,32,32,16),
                  child: Text('A man’s sexuality is never your mind responsibility.',
                  style: themedata.textTheme.titleLarge,),
                ),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(32,0,32,32),
                  child: Text(
                    'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex. This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex. This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
                    style: themedata.textTheme.bodyMedium,),
                 ),
          ],
        ),
      ),
      );
   }
}

void showSnackBar (BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}