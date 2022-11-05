import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:on_messenger/common/utils/colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
 final emailController = TextEditingController();

 @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
     showDialog(
        context: context,
         builder: (context) {
          return AlertDialog(
            content: Text('Link de redefinição de senha enviado! Verifique seu e-mail'),
          );
         },
         );
    } on FirebaseException catch (e) {
      print(e);
      showDialog(
        context: context,
         builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
         },
         );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
         backgroundColor: backgroundColor,
         elevation:0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Digite seu e-mail e nós lhe enviaremos um link de redefinição de senha',
            textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
           Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Color.fromARGB(255, 237, 224, 224)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                        ),
                        ),
                     ),
                    ),
                    SizedBox(height: 10),

                   MaterialButton(
                    onPressed: passwordReset,
                    child: 
                    Text(
                      'Redefinir senha'
                    ),
                    color: Colors.blue,
                    ),
        ],
        ),
    );
    
  }
}