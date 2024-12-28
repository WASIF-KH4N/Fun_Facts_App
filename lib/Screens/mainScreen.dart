import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:funfacts_app/Screens/settings.dart';
import 'package:dio/dio.dart';

class Mainscreen extends StatefulWidget {
   const Mainscreen({super.key});

   @override
   State<Mainscreen> createState() => _MainscreenState();
 }

 class _MainscreenState extends State<Mainscreen> {
  List<dynamic> facts=[];
  bool isLoading=true;

  void getdata()async{
    try{
  Response response= await Dio().get("https://raw.githubusercontent.com/WASIF-KH4N/flutter_dummy_api/refs/heads/main/fun_facts.json");
  facts= jsonDecode(response.data);
  isLoading=false;
  setState(() {

  });
  }
  catch(e){
      print(e);
      isLoading=false;
    }
  }
  @override
  void initState() {
    getdata();
    super.initState();
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         actions: [
           InkWell(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context){
                 return Settings();
               }));
             },
             child: Padding(
               padding: const EdgeInsets.all(15.0),
               child: Icon(
                   Icons.settings),
             ),
           )
         ],
         title: Center(child: Text("Fun Facts App",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'Rubik Vinyl'),)),
       ),
       body: Column(
         children: [
           Expanded(
             child:isLoading
                 ? Center(child: CircularProgressIndicator()): PageView.builder(
               //scrollDirection: Axis.vertical,
               scrollDirection: Axis.horizontal,
                 itemCount:facts.length,
                 itemBuilder: (BuildContext context,int index){
               return Container(
                   padding:EdgeInsets.all(10),
                   child: Center(child: Text(facts[index],textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,fontFamily: 'Ga Maamli'),)));
             }),

           ),
           Container(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("Swipe left for more",style: TextStyle(fontSize: 20,),),
             ),
           )


         ],
       ),
     );
   }
 }
