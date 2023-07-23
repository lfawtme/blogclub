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
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text('Welcome Back',style: themeData.textTheme.headlineMedium,),
                           const SizedBox(height: 8,),
                           Text('Sign in with your account',
                           style: themeData.textTheme.titleMedium!.apply(fontSizeFactor: 0.8),),
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
                            label: const Text('Password'),
                            suffixIcon: TextButton(style: const ButtonStyle(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                              onPressed: (){},
                              child: const Text('Show'),
                            ),),
                            ),
                            const SizedBox(height: 24,),
                          ElevatedButton(onPressed: (){}, 
                          style: ButtonStyle(minimumSize:
                           MaterialStateProperty.all(Size(MediaQuery.of(context).size.width,60),
                           ),
                           shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(borderRadius:BorderRadius.circular(12) ),)
                           ),
                           child: Text('Login'.toUpperCase())),
                          Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                            const Text('Forgert your Password ?'),
                            const SizedBox(width: 8,),
                            TextButton(onPressed: (){}, child:const Text('Reset here'),),
                           ],),
                      const Center(
                        child: Text('OR SIGN IN WITH',style: TextStyle(letterSpacing: 2),),
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.img.icons.google.image(width:36,height: 36, ),
                          const SizedBox(width: 24,),
                          Assets.img.icons.facebook.image(width:36,height: 36,),
                          const SizedBox(width: 24,),
                          Assets.img.icons.twitter.image(width:36,height: 36,),
                        ],
                      )
                   ], ),
                    ),
                    ),)
          ],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}