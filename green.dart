 import 'package:ashu_app/secondpage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
 class MyApp extends StatefulWidget {
   const MyApp({super.key});

   @override
   State<MyApp> createState() => _MyAppState();
 }

 class _MyAppState extends State<MyApp> {

   @override
   Widget build(BuildContext context) {
     return  MaterialApp(
       home: Hellopage(),
     );
   }
 }
 class Hellopage extends StatefulWidget {
   const Hellopage({super.key});

   @override
   State<Hellopage> createState() => _HellopageState();
 }

 class _HellopageState extends State<Hellopage> {
   bool hidden = false;
   TextEditingController emailcontroller = TextEditingController();
   TextEditingController passcontroller = TextEditingController();
   @override
   Widget build(BuildContext context) {
     return Scaffold( body: Padding(
       padding: const EdgeInsets.all(30.0),
       child: Center(
         child: Container(
           height: 500,
           width: double.infinity,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               TextField(
                 decoration: InputDecoration(
                     hintText: 'Enter the Email',
                     enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                       borderSide:
                       BorderSide(width: 2, color: Colors.purpleAccent),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                       borderSide: BorderSide(width: 2, color: Colors.blue),
                     )),
                 controller: emailcontroller,
               ),
               TextField(
                 obscureText: hidden,
                 controller: passcontroller,
                 decoration: InputDecoration(
                     hintText: 'Enter the Password',
                     suffixIcon: InkWell(
                         onTap: () {
                           tooglepass();
                         },
                         child: Icon(hidden
                             ? Icons.visibility_off
                             : Icons.visibility)),
                     enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                       borderSide:
                       BorderSide(width: 2, color: Colors.purpleAccent),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                       borderSide: BorderSide(width: 2, color: Colors.blue),
                     )),
               ),
               ElevatedButton(
                   onPressed: () {
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (contex) => fifthpage(email: emailcontroller.text, password: passcontroller.text)
                         ));
                   },
                   child: Text(
                     'Log In ',
                     style: TextStyle(
                       fontFamily: 'Ashu',
                       fontSize: 25,
                     ),
                   ))
             ],
           ),
         ),
       ),
     ),
     );

   }

   void tooglepass() {
     setState(() {
       hidden = !hidden;
     });

   }
 }




