import 'package:flutter/material.dart';
import 'package:splitbill/splitbill.dart';
import 'dart:math';

class Result extends StatelessWidget {
  // const Result({super.key});

  final String result,bill,friends,tax,tip;


  Result({ required this.result, required this.bill, required this.friends, required this.tax, required this.tip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
        Padding(
          padding: const EdgeInsets.all(20.0),
          child:
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 500,
                    height:150,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text("Equaly Devided",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                                Text("\$${bill}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                              ],
                            ),
                            SizedBox(width: 100,),
                            Column(
                              children: [
                                Text("Friends",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                                Text("Tax",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                                Text("Tip",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                              ],
                            ),
                            SizedBox(width: 50,),
                            Column(
                              children: [
                                Text(friends,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                                Text("$tax%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                                Text("\$${tip}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                              ],
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Everybody should pay \$${result}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                  SizedBox(height: 50,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SplitBill()));
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow, // Background color
                      padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text("Calculate Again?",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                  ),


                ]
            ),
          ),

        )

    );

  }
}
