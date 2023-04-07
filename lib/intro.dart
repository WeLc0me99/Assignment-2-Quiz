import 'package:flutter/material.dart';
import 'package:quiz_assignment/process.dart';


class LogIn extends StatefulWidget {

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Quiz"),
          backgroundColor: Colors.cyan,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "images/quiz.png",
                            height: 200,
                            width: 600,
                          ),
                          SizedBox(height: 70),
                          TextFormField(
                              decoration:InputDecoration(

                                labelText: "UserName",

                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.person),

                              ),

                              validator: (value){
                                if(value!.isEmpty){
                                  return "Enter Your Name";
                                }
                              }
                          ),

                          const SizedBox(height: 30),

                          ElevatedButton(


                              child: const Text('Enter The Quiz'),
                              style: ElevatedButton.styleFrom(
                                padding:
                                const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                                backgroundColor: Colors.cyan,
                                shape: const StadiumBorder(),

                              ),
                              onPressed: (){
                                final isValidForm = formKey.currentState!.validate();
                                if(isValidForm){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MainScreen()
                                  ));
                                }
                              }
                          ),




                        ]
                    )
                )

            )
        )
    );
  }


}
