// import 'package:flutter/material.dart';
// import 'package:sports/utils/coloers.dart';

// class LoginScreen extends StatelessWidget {
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController otpController = TextEditingController();

//   LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: primaryColor,
//       appBar: AppBar(
//         title: const Text(
//           'Login',
//           style: TextStyle(
//               color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: primaryColor,
//       ),
//       body: GestureDetector(
//         onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//         child: Container(
//           padding: const EdgeInsets.all(50.0),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//               primaryColor,
//               primaryColor,
//               primaryColor,
//               Colors.black
//             ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
//           ),
//           child: Column(
//             children: [
//               Spacer(),
//               SizedBox(
//                 width: 350,
//                 height: 50,
//                 child: TextField(
//                   controller: phoneController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(50),
//                       ),
//                     ),
//                     suffixIcon: Icon(Icons.email),
//                     labelText: 'Enter your Email',
//                   ),
//                   keyboardType: TextInputType.text,
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               SizedBox(
//                 width: 350,
//                 height: 50,
//                 child: TextField(
//                   controller: otpController,
//                   decoration: const InputDecoration(
//                     suffixIcon: Icon(Icons.lock),
//                     labelText: 'password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(50),
//                       ),
//                     ),
//                   ),
//                   keyboardType: TextInputType.text,
//                 ),
//               ),
//               Spacer(
//                 flex: 2,
//               ),
//               SizedBox(
//                 width: 250,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Login with Google',
//                         style: TextStyle(
//                           color: Colors.black,
//                         ),
//                       ),
//                       Image.asset('assets/images/google.png',
//                           height: 30, width: 30),
//                     ],
//                   ),
//                 ),
//               ),
//               Spacer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/presentation/cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: BlocProvider(
        create: (_) => LoginCubit(),
        child: const LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          const TextField(
            decoration: InputDecoration(labelText: 'Phone Number'),
          ),
          const TextField(
            decoration: InputDecoration(labelText: 'OTP'),
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return const CircularProgressIndicator();
              } else if (state is LoginSuccess) {
                Navigator.pushReplacementNamed(context, '/home');
                return Container();
              } else {
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<LoginCubit>().loginWithOTP('1234');
                      },
                      child: const Text('Verify OTP'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<LoginCubit>().loginWithGoogle();
                      },
                      child: const Text('Login with Google'),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
