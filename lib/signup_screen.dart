import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_cubit.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override Widget build(BuildContext context) { final isDark = Theme.of(context)
      .brightness == Brightness.dark;
    return Scaffold( backgroundColor:
  Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Switch(
                  value: context.watch<ThemeCubit>().state.isDark,
                  onChanged: (value) {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                ),

              ],
            ),

            SizedBox(
              width: double.infinity,
              height: 220,
              child: Image.asset(
                'assets/images/images.jpg',
                fit: BoxFit.cover,
              ),
            ),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),

                child: Form(
                  key: formKey,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: 30),

                       Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Text(
                          "Let’s Connect With Us!",
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      textField(
                        "Email Address",
                        emailController,
                        isEmail: true,
                        isDark: isDark,
                      ),

                      const SizedBox(height: 21),

                      textField(
                        "Password",
                        passwordController,
                        isPassword: true,
                        isDark: isDark,
                      ),

                      const SizedBox(height: 10),
                       Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        height: 34,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.pop(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),
                      Row(
                        children: [ Expanded( child: Divider( color: isDark ?
                        const Color(0xff181818) : Colors.grey, thickness: 1,
                        ),
                        ),
                          Padding( padding: const EdgeInsets.symmetric(
                            horizontal: 10, )
                            , child: Text( "or", style: TextStyle(
                              color: isDark ? Colors.white :
                              Colors.black, fontSize: 19,
                            ),
                            ),
                          ),
                          Expanded( child: Divider( color: isDark ?
                          const Color(0xff181818) :
                        Colors.grey, thickness: 1,
                          ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      socialButton(
                        icon: FontAwesomeIcons.apple,
                        text: "Sign up with Apple",
                      ),

                      const SizedBox(height: 10),
                      socialButton(
                        icon: FontAwesomeIcons.google,
                        text: "Sign up with Google",
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Text( "Don't have an account? ",
                          style: TextStyle( color: isDark ? Colors.white70
                              : Colors.black54,
                            fontSize: 12,
                          ), ),
                            GestureDetector( onTap: () {
                              Navigator.push( context, MaterialPageRoute(
                                builder: (context) => const LoginScreen()
                                ,
                              ),
                              );
                              }, child: const Text( "Sign up",
                              style: TextStyle(
                                color: Colors.blue,
                        fontSize: 12,
                              ),
                            ),
                            ),
                          ]
                        ),
                      ),

                      const SizedBox(height: 17),
                    ],
                  ),
                ),
              ),

          ],
        ),
      ),
      ));
  }

  Widget textField(
      String hint,
      TextEditingController controller, {
        bool isEmail = false,
        bool isPassword = false,
        required bool isDark,
      }) {
    return SizedBox(
      width: double.infinity,
      height: 65,

      child: TextFormField(
        controller: controller,


        keyboardType:
        isEmail ? TextInputType.emailAddress : TextInputType.text,
        obscureText: isPassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        style:
        TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 15,
        ),



        validator: (value) {

          final text = value?.trim() ?? "";
          if (text.isEmpty) {
            return "Please enter $hint";
          }
          if (isEmail) {
            final emailRegex = RegExp(
              r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
            );

            if (!emailRegex.hasMatch(text)) {
              return "Please enter a valid email";
            }
          }

          if (isPassword) {

            if (text.length < 6) {
              return "Password must be at least 6 characters";
            }

            if (!RegExp(r'[A-Za-z]').hasMatch(text)) {
              return "Password must contain a letter";
            }
          }

          return null;
        },



        decoration: InputDecoration(
          hintText: hint,

          hintStyle:
          TextStyle(
            color: isDark ? Colors.grey : Colors.grey.shade600,
            fontSize: 14,
          ),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Color(0xff736f6f),
              width: 1,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1,
            ),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),

          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 9,
          ),
        ),
      ),
    );
  }

Widget socialButton({
required FaIconData icon,
required String text,
}) {
final isDark =
Theme.of(context).brightness == Brightness.dark;

return SizedBox(
width: double.infinity,
height: 34,

child: Container(
decoration: BoxDecoration(
color: isDark
? Colors.white
: Colors.black,

borderRadius: BorderRadius.circular(20),
),

child: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [

FaIcon(
icon,
color: isDark
? Colors.black
: Colors.white,
size: 16,
),

const SizedBox(width: 9),

Text(
text,
style: TextStyle(
color: isDark
? Colors.black
: Colors.white,

fontSize: 18,
fontWeight: FontWeight.w500,
),
),

],
),
),
);
} }