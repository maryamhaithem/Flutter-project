
import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
return Scaffold(
backgroundColor: Colors.black,

body: SafeArea(
child: Container(
width: double.infinity,
height: double.infinity,

margin: EdgeInsets.zero,

padding: const EdgeInsets.symmetric(
horizontal: 18,
vertical: 24,
),

decoration: BoxDecoration(
color: Colors.black,
borderRadius: BorderRadius.circular(18),
),

child: Form(
key: _formKey,

child: Column(
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
children: [

const Text(
"Hey, Hello 👋",
style: TextStyle(
color: Colors.white,
fontSize: 28,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 6),

const Text(
"Enter your credentials to access\nyour account",
style: TextStyle(
color: Colors.white70,
fontSize: 17,
),
),

const SizedBox(height: 20),

Row(
children: [
Expanded(
child: socialButton(
icon: FontAwesomeIcons.google,
text: "Google",
),
),

const SizedBox(width: 10),

Expanded(
child: socialButton(
icon: FontAwesomeIcons.apple,
text: "Apple",
),
),
],
),

const SizedBox(height: 14),

const Center(
child: Text(
"or",
  style: TextStyle(
color: Colors.white70,
fontSize: 18,
),
),
),

const SizedBox(height: 14),

// Name
label("Name"),

const SizedBox(height: 6),

textField(
validator: (value) {
if (value == null || value.trim().isEmpty) {
return "Please enter your name";
}

return null;
},
),

const SizedBox(height: 14),

// Email
label("Email address"),

const SizedBox(height: 6),

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

// Password
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

// Password field
SizedBox(
height: 45,

child: TextFormField(
obscureText: !showPassword,

style: const TextStyle(
color: Colors.white,
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
fillColor: const Color(0xff303030),

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

// Terms
Row(
children: [
Checkbox(
value: agreeToTerms,

onChanged: (value) {
setState(() {
agreeToTerms = value ?? false;
});
},

side: const BorderSide(
color: Colors.white,
),
),

const Text(
"I agree to the ",
style: TextStyle(
color: Colors.grey,
fontSize: 15,
),
),

const Text(
"Terms & Privacy",
style: TextStyle(
color: Colors.white,
fontSize: 15,
decoration: TextDecoration.underline,
),
),
],
),

const SizedBox(height: 16),

// Login Button
SizedBox(
width: double.infinity,
height: 45,

child: ElevatedButton(
onPressed: () {

// Check all validators
if (_formKey.currentState!.validate()) {

// Check Terms
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

// Everything is valid
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
const Text(
"Don't have an account? ",

style: TextStyle(
color: Colors.white70,
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

const Center(
child: Text(
"© 2023 SO, All right Reserved",

style: TextStyle(
color: Colors.grey,
fontSize: 13,
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

// Label
Widget label(String text) {
return Text(
text,

style: const TextStyle(
color: Colors.white,
fontSize: 18,
),
);
}

// Text Field with Validator
Widget textField({
TextInputType? keyboardType,
String? Function(String?)? validator,
}) {
return SizedBox(
height: 45,

child: TextFormField(
keyboardType: keyboardType,

style: const TextStyle(
color: Colors.white,
),

validator: validator,

decoration: InputDecoration(
filled: true,
fillColor: const Color(0xff303030),

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

// Social Button
Widget socialButton({
required FaIconData icon,
required String text,
}) {
return Container(
height: 42,

decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(6),
),

child: Row(
mainAxisAlignment: MainAxisAlignment.center,

children: [
FaIcon(
icon,
size: 18,
color: Colors.black,
),

const SizedBox(width: 7),

Text(
text,
style: const TextStyle(
color: Colors.black,
fontSize: 15,
),
),
],
),
);
}
}
