import 'package:flutter/material.dart';
import 'package:lab4_glsib/Screens/RegisterScreen.dart';
import 'package:lab4_glsib/db/DatabaseHelper.dart';

class Loginscreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> Home();
  }


class Home extends State<Loginscreen>{
  final key =GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool showpass = true;
DatabaseHelper db = DatabaseHelper();
  Future<void> login()async{
      
    if(!key.currentState!.validate()) return;

try{

final user = await db.getUser(email.text);
 if(user != null){
 ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Login Success !"),
    backgroundColor: Colors.green,));}else{
      ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Login failed !"),
    backgroundColor: Colors.red,)
  ); 
    }
}catch(e){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Login failed !"),
    backgroundColor: Colors.red,)
  );
}

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
       Text("Welcome Back !",textAlign: TextAlign.center
       ,style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.green
       ),),
SizedBox(height: 15,),
Text("Login To your Account !",
textAlign: TextAlign.center,
style: TextStyle(color: Colors.grey),),

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

ElevatedButton(onPressed: login,style: ElevatedButton.styleFrom(
  padding: EdgeInsets.all(10),
  backgroundColor: Colors.green
), 
child: Text("Login",style: TextStyle(
  fontSize: 19
),)),

TextButton(onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>Registerscreen()));
}, child: Text("Dont have An Account ! Register"))
      ],
     )),

      ),),
    );
  }
}