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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Login'.toUpperCase(),style: tabTextStyle,),
                        Text('Sign Up'.toUpperCase(),style: tabTextStyle),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}