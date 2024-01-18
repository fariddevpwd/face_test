import 'package:face_test/qr.dart';
import 'package:flutter/material.dart';
//https://pub.dev/packages/sms_autofill/example

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey=GlobalKey<FormState>();
  final _mobController=TextEditingController();

  @override
  void dispose(){
    _mobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext c){
    print('******************');
    if(ModalRoute.of(context)!=null)
    print(ModalRoute.of(context)!.settings.arguments);
    return Form(key: _formKey,
    child: Scaffold(
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                SizedBox(width: 200,
                    child: TextFormField(
                      controller: _mobController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter mobile ',
                      ),)

                ),
                ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {

                  },
                  child: Text('Submit',style: TextStyle(color: Colors.white),),

                ),
              ],
            ),

            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: ()  {
                Navigator.pushNamed(c, '/x',arguments: {'mno':_mobController.text});
              },
              child: Text('Skip',style: TextStyle(color: Colors.white),),

            )

          ],
        ),
      ),
    ))

      ;
  }
}

