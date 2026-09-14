import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_cubit.dart';
class LoginScreen extends StatefulWidget {
const LoginScreen({super.key});

@override
State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
bool showPassword = false;
bool agreeToTerms = false;

final _formKey = GlobalKey<FormState>();

@override
Widget build(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
return Scaffold(
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,

body: SafeArea(
child: Container(
width: double.infinity,
height: double.infinity,

margin: EdgeInsets.zero,

padding: EdgeInsets.symmetric(
horizontal: 18,
vertical: 24,
),

decoration: BoxDecoration(
  color: isDark ? Colors.black : Colors.white,
  borderRadius: BorderRadius.circular(18),
),

child: Form(
key: _formKey,

child: Column(
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
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

 SizedBox(height: 10),
 Text(
"Hey, Hello 👋",
style: TextStyle(
  color: isDark ? Colors.white : Colors.black,
fontSize: 28,
fontWeight: FontWeight.bold,
),
),

 SizedBox(height: 6),

 Text(
"Enter your credentials to access\nyour account",
style: TextStyle(
  color: isDark ? Colors.white70 : Colors.black54,
),
),

 SizedBox(height: 20),

Row(
children: [
Expanded(
child: socialButton(
icon: FontAwesomeIcons.google,
text: "Google",
),
),

SizedBox(width: 10),

Expanded(
child: socialButton(
icon: FontAwesomeIcons.apple,
text: "Apple",
),
),
],
),

 SizedBox(height: 14),

 Center(
child: Text(
"or",
  style: TextStyle(
    color: isDark ? Colors.white : Colors.black,
fontSize: 18,
),
),
),

SizedBox(height: 14),


  label("Name"),

 SizedBox(height: 6),
textField(
validator: (value) {
if (value == null || value.trim().isEmpty) {
return "Please enter your name";
}

return null;
},
),
 SizedBox(height: 14),

label("Email address"),

 SizedBox(height: 6),

textField(
keyboardType: TextInputType.emailAddress,
validator: (value) {
if (value == null || value.trim().isEmpty) {
return "Please enter your email";
}

if (!value.contains('@') || !value.contains('.')) {
return "Please enter a valid email";
}

return null;
},
),

const SizedBox(height: 14),


Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
label("Password"),

const Text(
"Forgot password?",
style: TextStyle(
color: Colors.blue,
fontSize: 16,
),
),
],
),

const SizedBox(height: 6),

SizedBox(
height: 45,

child: TextFormField(
obscureText: !showPassword,

style:  TextStyle(
  color: isDark ? Colors.white : Colors.black,
),

// Password Validator
validator: (value) {
if (value == null || value.isEmpty) {
return "Please enter your password";
}

if (value.length < 6) {
return "Password must be at least 8 characters";
}

return null;
},

decoration: InputDecoration(
filled: true,
fillColor:isDark ?
const Color(0xff303030) :
const Color(0xffeeeeee),

suffixIcon: IconButton(
onPressed: () {
setState(() {
showPassword = !showPassword;
});
},

icon: Icon(
showPassword
? Icons.visibility
    : Icons.visibility_off,

color: Colors.grey,
size: 18,
),
),

border: OutlineInputBorder(
borderRadius: BorderRadius.circular(6),
borderSide: BorderSide.none,
),

errorStyle: const TextStyle(
color: Colors.red,
),
),
),
),

const SizedBox(height: 14),

Row(
  children: [
  Checkbox(
value: agreeToTerms,

onChanged: (value) {
setState(() {
agreeToTerms = value ?? false;
});
},

  side:  BorderSide(
    color: isDark ?
    Colors.white : Colors.black,
  ),
  ),
Text(
"I agree to the ",
style: TextStyle(
  color: isDark ? Colors.grey
      : Colors.black54,
  fontSize: 15,
),
),
 Text(
"Terms & Privacy",
style: TextStyle(
  color: isDark ?
  Colors.white : Colors.black,
fontSize: 15,
decoration: TextDecoration.underline,
),
),
],
),

const SizedBox(height: 16),

SizedBox(
width: double.infinity,
height: 45,

child: ElevatedButton(
onPressed: () {
if (_formKey.currentState!.validate()) {
if (!agreeToTerms) {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text(
"Please agree to the Terms & Privacy",
),
),
);

return;
}

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text(
"Login successful!",
),
),
);
}
},

style: ElevatedButton.styleFrom(
backgroundColor: Colors.blue,

shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(7),
),
),

child: const Text(
"Log In",
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
fontSize: 20,
),
),
),
),

const SizedBox(height: 18),

Row(
mainAxisAlignment: MainAxisAlignment.center,

children: [
 Text(
"Don't have an account? ",
  style: TextStyle( color: isDark ?
      Colors.white
      : Colors.black,
    fontSize: 18,
  ),
),
GestureDetector(
onTap: () {
Navigator.push(
context,

MaterialPageRoute(
builder: (context) =>
const SignUpScreen(),
),
);
},

child: const Text(
"Sign up",

style: TextStyle(
color: Colors.blue,
fontSize: 19,
fontWeight: FontWeight.bold,
),
),
),
],
),

const Spacer(),

 Center(
child: Text(
"© 2023 SO, All right Reserved",

style: TextStyle(
  color: isDark ?
  Colors.grey
      : Colors.black45,
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
Widget label(String text) {
final isDark =
Theme.of(context).brightness == Brightness.dark;

return Text(
text,
style: TextStyle(
color: isDark ? Colors.white : Colors.black,
fontSize: 18,
),
);
}
Widget textField({
TextInputType? keyboardType,
String? Function(String?)? validator,
}) {
final isDark =
Theme.of(context).brightness == Brightness.dark;

return SizedBox(
height: 45,

child: TextFormField(
keyboardType: keyboardType,

style: TextStyle(
color: isDark ? Colors.white : Colors.black,
),

validator: validator,

decoration: InputDecoration(
filled: true,

fillColor: isDark
? const Color(0xff303030)
: const Color(0xffeeeeee),

border: OutlineInputBorder(
borderRadius: BorderRadius.circular(6),
borderSide: BorderSide.none,
),

errorStyle: const TextStyle(
color: Colors.red,
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

  return Container(
    height: 42,

    decoration: BoxDecoration(
      color: isDark
          ? Colors.white
          : Colors.black,

      borderRadius: BorderRadius.circular(6),
    ),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        FaIcon(
          icon,
          size: 18,
          color: isDark
              ? Colors.black
              : Colors.white,
        ),

        const SizedBox(width: 7),

        Text(
          text,
          style: TextStyle(
            color: isDark
                ? Colors.black
                : Colors.white,

            fontSize: 15,
          ),
        ),
      ],
    ),
  );
}}