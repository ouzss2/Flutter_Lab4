import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab4_glsib/db/DatabaseHelper.dart';

class Registerscreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> HomeR();
  }


class HomeR extends State<Registerscreen>{
  final key =GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool showpass = true;
DatabaseHelper db = DatabaseHelper();
  Future<void> register() async{
    
    if(!key.currentState!.validate()) return;

try{

await db.insertUser(email.text, password.text);
 ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Registration Success !"),
    backgroundColor: Colors.green,));
}catch(e){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Registration failed !"),
    backgroundColor: Colors.red,)
  );
}

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Register"),),
      body: Center(child: SingleChildScrollView(
     padding: EdgeInsets.all(10),
     child: Form(key: key,
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
       Icon(Icons.car_rental,
       size: 85,
       color: Colors.green,),
       
SizedBox(height: 25,),

TextFormField(controller: email,
keyboardType: TextInputType.emailAddress,
decoration: InputDecoration(
  labelText: "Email",
  prefixIcon: Icon(Icons.email_outlined),
  border: OutlineInputBorder()
),
validator: (value){
  if(value == null || value.trim().isEmpty){
    return "Please Enter your mail";
  }
   if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                    ).hasMatch(value.trim())) {
                      return 'Enter a valid email';
                    }

                    return null;
},
),
SizedBox(height: 25,),
TextFormField(controller: password,
obscureText: showpass,
decoration: InputDecoration(
  labelText: "Password ",
  prefixIcon: Icon(Icons.lock),
  border: OutlineInputBorder(),
  suffix: IconButton(onPressed: (){
  setState(() {
    showpass = !showpass;
  });
  }, icon: Icon(showpass ? Icons.visibility: Icons.visibility_off))
),
validator: (value){
   if(value == null || value.trim().isEmpty){
    return "Please Enter your Password";
  }
  return null;
},),

SizedBox(height: 25,),

ElevatedButton(onPressed: register,style: ElevatedButton.styleFrom(
  padding: EdgeInsets.all(10),
  backgroundColor: Colors.green
), 
child: Text("Register",style: TextStyle(
  fontSize: 19
),)),


      ],
     )),

      ),),
    );
  }
}