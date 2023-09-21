import 'package:flutter/material.dart';
import 'dart:math';

import 'package:splitbill/result.dart';

class SplitBill extends StatefulWidget {
  const SplitBill({super.key});

  @override
  State<SplitBill> createState() => _SplitBillState();
}

class _SplitBillState extends State<SplitBill> {
  int tip =5;
  String tax ="0";
  int friends=180;
  String bill="";
  // double result=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Split Bill",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,)),
          backgroundColor: Colors.white,),
        backgroundColor: Colors.white,
        body:
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
            Column(
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
                              Text("Total",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                              Text(bill,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                            ],
                          ),
                          SizedBox(width: 200,),
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
                              Text(friends.round().toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                              Text("$tax%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                              Text("\$${tip.round().toString()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                            ],
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text("How many Friends?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                Slider(
                  value: friends.toDouble(),
                  activeColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      friends = value.round();
                    });
                  },
                  min: 0,
                  max: 200,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: 100,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text("Tip",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black,)),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width:40,
                                height: 40,
                                child: FloatingActionButton(
                                  backgroundColor: Colors.grey,
                                  onPressed: () {
                                    setState(() {
                                      tip ++;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(tip.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                              Container(
                                width:40,
                                height: 40,
                                child: FloatingActionButton(
                                  backgroundColor: Colors.grey,
                                  onPressed: () {
                                    setState(() {
                                      tip --;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                            ],
                          )


                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      height: 100,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              labelText: 'tax in %',
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value){
                              setState(() {
                                tax=value;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    buildOutlinedButton("1"),
                    buildOutlinedButton("2"),
                    buildOutlinedButton("3"),

                  ],
                ),
                Row(
                  children: [
                    buildOutlinedButton("4"),
                    buildOutlinedButton("5"),
                    buildOutlinedButton("6"),
                  ],
                ),
                Row(
                  children: [
                    buildOutlinedButton("7"),
                    buildOutlinedButton("8"),
                    buildOutlinedButton("9"),
                  ],
                ),
                Row(
                  children: [
                    buildOutlinedButton("."),
                    buildOutlinedButton("0"),
                    buildOutlinedButton("CLR"),
                  ],
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left:3,right:3),
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(bill: bill, friends: friends.round().toString(), tax: tax, tip: tip.toString())));

                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Background color
                      padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text("Split Bill",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                  ),
                ),
              ],),
          ),
        )
    );

  }

  OutlinedButton buildOutlinedButton(String text) {
    return OutlinedButton(

                  style: OutlinedButton.styleFrom(
                    fixedSize: Size.fromWidth(150),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),
                  onPressed: () {
                    if(text== "CLR"){
                      setState(() {
                        bill ="";
                      });
                    }else{
                      setState(() {
                        bill += text;
                      });
                    }
                  },
                  child:Text(text, style: TextStyle(fontSize: 40,color: Colors.black),
                  ),
                );
  }
}
// class SplitLogic {
//   late final int tip, friends;
//   late final String bill, tax;
//   late double taxAmount;
//   late double result;
//
//   SplitLogic({required this.tip, required this.friends, required this.tax, required this.bill, required this.result,});
//
//   String splitCalculation() {
//     double billAmount = double.parse(bill) ;
//     double taxPercentage = double.parse(tax) ;
//
//     taxAmount = (billAmount * taxPercentage) / 100;
//
//     result = (billAmount + taxAmount + tip) / friends;
//     return result.toStringAsFixed(1);
//   }
// }


