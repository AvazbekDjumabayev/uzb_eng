import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uzbeng/pages/translator_page.dart';
//import 'package:convex_bottom_bar/convex_bottom_bar.dart';
class HomePage extends StatefulWidget {
  static final String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("English-Uzbek-English",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: Icon(Icons.home,color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
          child: Column(
            children: <Widget>[
              // #Header
//              Stack(
//                children: <Widget>[
//                  Container(
//                    margin: EdgeInsets.symmetric(horizontal: 25),
//                    padding: EdgeInsets.only(bottom: 20),
//                    height: 75,
//                    decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.circular(10),
//                        boxShadow: [
//                          BoxShadow(
//                              color: Colors.grey,
//                              blurRadius: 2,
//                              offset: Offset(0,3)
//                          )
//                        ]
//                    ),
//                    child: Padding(
//                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Icon(CupertinoIcons.home,color: Colors.black,size: 30,),
//                          Text("English-Uzbek-English",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
//                          Icon(Icons.favorite,color: Colors.black,size: 30,)
//                        ],
//                      ),
//                    ),
//                  ),
//                  Container(
//                    margin: EdgeInsets.only(top:50),
//                    decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.circular(10),
//                        boxShadow: [
//                          BoxShadow(
//                              color: Colors.grey,
//                              blurRadius: 1,
//                              offset: Offset(0,1)
//                          )
//                        ]
//                    ),
//                    child: Container(
//                      height: 50,
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Padding(
//                            padding: const EdgeInsets.only(left: 5.0),
//                            child: Text("search",style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic,letterSpacing: 2),),
//                          ),
//                          Center(
//                            child: Icon(Icons.search,color: Colors.black,size: 26,),
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
//                ],
//              ),

//                    Stack(
//                      children: <Widget>[
//                        Container(
//                          height: 50,
//                          color: Colors.red,
//                        )
//                      ],
//                    ),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0,0),
                      blurRadius: 2
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 280,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "search",
                          hintStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey),
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    Icon(Icons.search,color: Colors.black,)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              // #wordsofList,
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(0,0)
                      )
                    ]
                  ),
                  width: double.infinity,
                  child: Scrollbar(
                    child: ListView.builder(
                      itemBuilder: (context, index,){
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Google $index",style: TextStyle(fontSize: 17),),
                            GestureDetector(
                                onTap: (){
                                  showAlertDialog(context);
                                },
                                child: Icon(Icons.keyboard_arrow_right,color: Colors.black,))
                          ]
                        ),
                      );
                    }),
                  ),
                ),
              ),
              /*ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  AspectRatio(
                    aspectRatio: 1.4/1.4,
                    child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.red
                    ),
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                    ),
                ),
                  ),]
              )*/
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.greenAccent,
          child: Icon(Icons.translate,color: Colors.black,),
          onPressed: (){
            Navigator.pushReplacementNamed(context, TranslatorPage.id);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          color: Colors.greenAccent,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home,color: Colors.black,size: 35,),
                  onPressed: (){},
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text("Translator"),
                ),
                IconButton(
                  icon: Icon(Icons.favorite,color: Colors.black,size: 35,),
                )
              ],
            ),
          ),
        ),
    );
  }
  void showAlertDialog(BuildContext context){
    showDialog<void>(
        context: context,
      builder: (BuildContext context){
          return AlertDialog(
            title: Text("tanlangan so'z",style: TextStyle(color: Colors.black),),
            content: Text("bu yerda tarjima chiqadi"),
            actions: <Widget>[
              FlatButton(
                child: Text("cancel"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              Icon(Icons.favorite_border)
            ],
          );
      }
    );
  }
}