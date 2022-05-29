import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'Home.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  var email=TextEditingController();

  var password=TextEditingController();
  var formKey=GlobalKey<FormState>();
  bool visible=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: email,
                    keyboardType:TextInputType.emailAddress ,
                    decoration:InputDecoration(
                      labelText: "Email Address",
                      prefixIcon:Icon (
                          Icons.email
                      ) ,
                      border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(20)
                      ),
                    ),
                    onFieldSubmitted: (String value)
                    {
                      print(value);
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) return 'Email can\'t be empty';
                      if (!EmailValidator.validate(text))
                        return 'Enter Valid Email';
                      return null;
                    },
                  ),
                  SizedBox(height:20 ,),
                  TextFormField(

                    controller: password,
                    keyboardType:TextInputType.visiblePassword ,
                    obscureText: visible,
                    decoration:InputDecoration(
                      labelText: "Password",
                      prefixIcon:Icon(
                          Icons.vpn_key
                      ),

                      suffixIcon:IconButton(

                        icon:
                        visible ?  Icon(Icons.visibility): Icon(Icons.visibility_off),
                        onPressed: ShowPassword,
                      )
                      ,
                      border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(20)
                      ),
                    ),

                    onFieldSubmitted: (String value)
                    {
                      print(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password must not be Empty";
                      }
                      else if(value.length <8){
                        return "Password must be at least 8 character";
                      }
                      return null;
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: (){},child: Text("Forget Password?"),),
                    ],
                  ),
                  //SizedBox(height:20 ,),
             Container( height: 50,
               width: MediaQuery.of(context).size.width,
               child: ElevatedButton(onPressed: (){
                 LoginButton();
               }, child: Text("Login"),
                 style: ButtonStyle(
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                     RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(12.0),
                     ),
                   ),
                   backgroundColor:
                   MaterialStateProperty.all<Color>(Colors.blue),
                 ),
               ),
             ),
                  SizedBox(height:10 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ?",
                        style:
                        TextStyle(
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      TextButton(onPressed: (

                          ){

                      },
                          child:
                          Text("Register Now",
                            style:
                            TextStyle(
                              fontWeight:FontWeight.bold,


                            ),
                          )
                      )
                    ],

                  )
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }

  void ShowPassword(){
    setState(() {
      visible=!visible;
      print(visible);
    });


  }

  void LoginButton() {
    print(email.text);
    print(password.text);
    if(password.text!=null &&EmailValidator.validate(email.text)&&!password.text.isEmpty &&password.text.length>=8){
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }), (route) => false);
    }
    else if(formKey.currentState!.validate())
      print("login");
  }
}
