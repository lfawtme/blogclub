import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/material.dart';


class AuthScreen extends StatelessWidget{
 const AuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
        final ThemeData themeData = Theme.of(context);
        final tabTextStyle = TextStyle(
          color: themeData.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20 , top: 25),
              child: Assets.img.icons.logo.svg(width: 120),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  color:themeData.colorScheme.primary, 
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Login'.toUpperCase(),style: tabTextStyle,),
                          Text('Sign Up'.toUpperCase(),style: tabTextStyle),
                        ],
                      ),
                    ),
                    Expanded(child: Container(
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text('Welcome Back',style: themeData.textTheme.headline4,),
                           const SizedBox(height: 8,),
                           Text('Sign in with your account',
                           style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),),
                           const SizedBox(height: 16,),
                           TextField(
                            decoration: InputDecoration(label: const Text('Username'),
                            labelStyle: TextStyle(
                              color: themeData.colorScheme.onSurface,
                            )),
                          ),
                          TextField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                            label: const Text('Password'),labelStyle: TextStyle(
                              color: themeData.colorScheme.onSurface,
                            )),),
                          ElevatedButton(onPressed: (){}
                          , child: Text('Login'.toLowerCase())),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           const Text('Forgert your Password ?'),
                           TextButton(onPressed: (){ }, child:const Text('Reset here'),),
                      ],),
                      const Center(
                        child: Text('OR SIGN IN WITH'),
                      ),
                      Row(
                        children: [
                          Assets.img.icons.google.image(),
                          Assets.img.icons.facebook.image(),
                          Assets.img.icons.twitter.image(),
                        ],
                      )
                                      ]),
                    ),
                    )
                    )
          ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}