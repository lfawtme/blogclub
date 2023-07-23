import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget{
 const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int logintap=0;
  static const int signuptap=1;
  int selectedTapIndex=logintap;
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
              padding: const EdgeInsets.only(bottom: 32 , top: 32),
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
                          TextButton(onPressed: () {
                            setState(() {
                              selectedTapIndex=logintap;
                            });
                          },
                            child:Text('Login'.toUpperCase(),
                            style: tabTextStyle.apply(
                              color: selectedTapIndex==logintap
                              ?Colors.white
                              :Colors.white54
                            ),),),
                          TextButton(onPressed: () {
                            setState(() {
                              selectedTapIndex=signuptap;
                            });
                          },
                            child: Text('Sign Up'.toUpperCase(),
                            style: tabTextStyle.apply(
                              color: selectedTapIndex==signuptap
                              ?Colors.white
                              :Colors.white54),),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                           topLeft: Radius.circular(32),
                           topRight: Radius.circular(32),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(32,48,32,32),
                      child: selectedTapIndex==logintap
                      ? _Login(themeData: themeData)
                      :_SignUp(themeData: themeData),
                  ),
                 ),),
              ],),
             ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text('Welcome Back',
         style: themeData.textTheme.headlineMedium,),
         const SizedBox(height: 8,),
         Text('Sign in with your account',
         style: themeData.textTheme.titleMedium!.apply(
          fontSizeFactor: 0.8),),
         const SizedBox(height: 16,),
         TextField(
          decoration: InputDecoration(
            label: const Text('Username'),
            labelStyle: TextStyle(
            color: themeData.colorScheme.onSurface,
          ),
         ),
        ),
        _PasswordTextField(themeData: themeData),
        const SizedBox(height: 24,),
        ElevatedButton(
          onPressed: (){}, 
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
             Size(
              MediaQuery.of(context).size.width,60),
            ),
          shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(12))
          ),
         ),
          child: Text('Login'.toUpperCase())),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text('Forgert your Password ?',style: TextStyle(color: themeData.colorScheme.onSurface),),
          const SizedBox(width: 8,),
          TextButton(
            onPressed: (){},
            child:const Text('Reset here'),),
         ],),
         Center(
         child: Text('OR SIGN IN WITH',style: TextStyle(
         color: themeData.colorScheme.onSurface,letterSpacing: 2),),),
        const SizedBox(height: 16,),
        Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Assets.img.icons.google.image(
            width:36,height: 36, ),
          const SizedBox(width: 24,),
           Assets.img.icons.facebook.image(
            width:36,height: 36,),
          const SizedBox(width: 24,),
           Assets.img.icons.twitter.image(
            width:36,height: 36,),
                  ],
            ),
                  ],);
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text('Welcome to blog club',
         style: themeData.textTheme.headlineMedium,),
         const SizedBox(height: 8,),
         Text('Please enter information',
         style: themeData.textTheme.titleMedium!.apply(
          fontSizeFactor: 0.8),),
         const SizedBox(height: 16,),
         TextField(
          decoration: InputDecoration(
            label: const Text('Fullname'),
            labelStyle: TextStyle(
            color: themeData.colorScheme.onSurface,
             ),),),
         TextField(
          decoration: InputDecoration(
            label: const Text('Username'),
            labelStyle: TextStyle(
            color: themeData.colorScheme.onSurface,
          ),
         ),
        ),
        _PasswordTextField(themeData: themeData),
        const SizedBox(height: 24,),
        ElevatedButton(
          onPressed: (){}, 
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
             Size(
              MediaQuery.of(context).size.width,60),
            ),
          shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(12))
          ),
         ),
          child: Text('Sign up'.toUpperCase())),
        const SizedBox(height: 24,),
        Center(
         child: Text('OR SIGN UP WITH',style: TextStyle(
         color: themeData.colorScheme.onSurface,letterSpacing: 2),),),
        const SizedBox(height: 16,),
        Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Assets.img.icons.google.image(
            width:36,height: 36, ),
          const SizedBox(width: 24,),
           Assets.img.icons.facebook.image(
            width:36,height: 36,),
          const SizedBox(width: 24,),
           Assets.img.icons.twitter.image(
            width:36,height: 36,),
                  ],
            ),
                  ],);
  }
}

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool obscureText=true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
      label: Text('Password',style: TextStyle(
        color: widget.themeData.colorScheme.onSurface),),
      suffix: InkWell(
        onTap: (){
          setState(() {
            obscureText=!obscureText;
          });
        },
        
        child: Text(obscureText?'Show':'Hide',
        style:TextStyle(
          fontSize: 14,color: Theme.of(context).colorScheme.primary),
         ),
      ),
      ),
      );
  }
}