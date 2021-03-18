import 'dart:math';

import 'package:cammera_package_exmaple/screeen/call_screen.dart';
import 'package:cammera_package_exmaple/styles/styles_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List <String> img = [ "img/aa.jpg" ,"img/ambani.jpg" , "img/selfi1.jpeg"  ,"img/bot1.jpg" ,"img/bot.jpg" ,"img/rc.jpg" ,"img/bot5.jpg", "img/kajal.jpg" ,"img/rc.jpg" ,"img/bot5.jpg", "img/kajal.jpg"] ;
  List <String> title = [ "Allu Arjun" ,"Ambani" ,"lakshmi prasad_kota lakshmi prasad lakshmi prasadlakshmi prasad" ,"pawan Kalayan" , "raj ram" ,"ram krishna " , "Raj krishna" ,"krishna","ram krishna " , "Raj krishna" ,"krishna"];
  List <String> date = ["june 18 2021 , 9:40 pm" ,"june 17 2021 , 9:40 pm" ,"june 16 2021 , 9:40 pm" ,"june 15 2021 , 9:40 pm" ,"june 14 2021 , 9:40 pm" ,
    "june 14 2021 , 9:40 pm" ,"june 13 2021 , 9:40 pm" ,"june 12 2021 , 9:40 pm" ,"june 14 2021 , 9:40 pm" ,"june 13 2021 , 9:40 pm" ,"june 12 2021 , 9:40 pm" ];
  String tabColor = "1";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Center(

            child: Text(
                "Edit",
                style: editStyle),),),

        centerTitle: true,
        title: Text(
            "Calls",
            style: mainTitleStyle),
        actions: [
          Icon(
            Icons.more_vert,
            color: Colors.purple,
            size: 25,
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 350,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              tabColor = "1";
                            });
                          },
                          child: Container(

                            height: 50,
                            width: 175,
                            decoration: BoxDecoration(
                                color: tabColor == "1" ?  Colors.white : null,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(child: Text("All" , style: TextStyle(color: tabColor == "1" ?  Colors.purple : Colors.grey ,fontSize: 12),)),
                          ),
                        ),
                      ),
                      Positioned(
                        right:0,
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              tabColor = "2";
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 185,

                            decoration: BoxDecoration(
                                color : tabColor == "2" ?  Colors.white : null,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(child: Text("Missed" ,style: TextStyle(color:  tabColor == "2" ?  Colors.purple : Colors.grey  , fontSize: 12),)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xfff8f8fa),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300],
                        offset: const Offset(
                          1.0,
                          1.0,
                        ),
                        blurRadius: 1,

                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 10,),
                Expanded(
                  child: ListView.separated(
                    primary: false,
                    itemCount: title.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return AllCalls(name: title[index],
                        img: img[index],
                        date: date[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                  ),
                ),
              ],
            ),

          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.only(topRight: Radius.circular(25) , topLeft: Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(-1, -3),
                          blurRadius: 3)
                    ]),


                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.phone , color: Colors.purple, size: 20,),
                    Icon(Icons.message , color: Colors.black54,size: 20,),
                    CircleAvatar(
                      radius: 23,
                      backgroundImage: AssetImage("img/dail2.png" ),
                    ),
                    Icon(Icons.person ,color: Colors.black54, size: 20,),
                    Icon(Icons.more_horiz ,color: Colors.black54,size: 20,),
                  ],
                )
            ),
          ),

        ],
      ),


    );
// bottomNavigationBar: BottomNavigationBar(
//   items: [
//     BottomNavigationBarItem(icon: Icon(Icons.phone), title: Text("")),
//     BottomNavigationBarItem(icon: Icon(Icons.message) ,title: Text("")),
//     BottomNavigationBarItem(icon: Icon(Icons.person),title: Text("")),
//     BottomNavigationBarItem(icon: Icon(Icons.more_horiz),title: Text(""))
//   ],
// ),

  }
}

class AllCalls extends StatefulWidget {

  AllCalls({ this.name , this.date , this.img});
  final String img ;
  final String date ;
  final String name ;

  @override
  _AllCallsState createState() => _AllCallsState();
}

class _AllCallsState extends State<AllCalls> {


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(top: 20, left: 7, right: 7),

      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(widget.img,),
                  fit: BoxFit.cover
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name ,style: titleStyle , softWrap: false , overflow: TextOverflow.fade, maxLines: 1,),
                SizedBox(height: 2,),
                Row(
                  children: [
                    Icon(
                      Icons.call_missed,
                      color: Colors.red,
                      size: 16,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(widget.date , style: subTitleStyle,),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10,),
          Row(

            children: [
              Image.asset("img/phone.png" ,height: 19,width: 20, color: Colors.purple,),
              SizedBox(
                width: 18,
              ),
              InkWell
                (
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Call(
                            img: widget.img,name: widget.name,)),
                    );
                  }, splashColor:Colors.primaries[Random().nextInt(Colors.primaries.length)] ,
                  child: Image.asset("img/video.png" ,height: 19, width: 20, color: Colors.purple,)),


            ],
          ),
        ],
      ),




    );
    //   return ListTile(
    //     leading: CircleAvatar(
    //       backgroundColor: Colors.green,
    //       radius: 30,
    //
    //     ),
    //     title: Text(widget.name),
    //     subtitle: Row(
    //       children: [
    //         Icon(Icons.call),
    //         Text(widget.date)
    //
    //       ],
    //     ),
    //     trailing: trall(),
    //   );
    // }
    // Widget trall (){
    //   Row(
    //     children: [
    //       Icon(Icons.call , size: 100,), InkWell(
    //           onTap: (){
    //             Navigator.push(context, MaterialPageRoute(builder: (Context) => CallPage(role: _role, channelName: "lpk",)));
    //           },
    //           child: Icon(Icons.call , size: 10,)),
    //     ],
    //   );
  }
}
