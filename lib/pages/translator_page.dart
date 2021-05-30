import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:uzbeng/pages/homepage.dart';

class TranslatorPage extends StatefulWidget {
  static final String id = 'tranlator_page';
  @override
  _TranslatorPageState createState() => _TranslatorPageState();
}
class _TranslatorPageState extends State<TranslatorPage> {
  //
  GoogleTranslator translator = new GoogleTranslator();
  //
  int selectedRadio;
  bool _checked;
  @override
  void initState(){
    super.initState();
    selectedRadio = 0;
  }
  setselectedRadio(int val){
    setState(() {
      selectedRadio = val;
    });
  }
  //
  @override
  String out;
  final  lang = TextEditingController();
  void translate(){
    translator.translate(lang.text, to: "uz").then((output){
      setState(() {
        out = output.text;
      });
      print(output);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.greenAccent,
        title: Text("Translator",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
//      body: Container(
//        child: Center(
//          child: Column(
//            children: <Widget>[
//              SizedBox(height: 120,),
//              TextField(
//                controller: lang,
//              ),
//              SizedBox(
//                height: 20,
//              ),
//              RaisedButton(
//                color: Colors.amberAccent,
//                child: Text("translate",style: TextStyle(fontSize: 25),),
//                onPressed: (){
//                  translate();
//                },
//              ),
//              SizedBox(height: 20,),
//              Text(out.toString(),style: TextStyle(fontSize: 35),),
//            ],
//          ),
//        ),
        body: SingleChildScrollView (
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Color.fromRGBO(171, 171, 100, 1),blurRadius: 10,offset: Offset(0,0)),
                      ]
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          TextField(
                            maxLength: 200,
                            maxLines: 7,
                            controller: lang,
                            decoration: InputDecoration(
                              hintText: "type something",
                            ),
                          )
                        ],
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ButtonBar(
                          children: <Widget>[
                            Container(
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  Text("uzb"),
                                  Radio(
                                    value: 1,
                                    groupValue: selectedRadio,
                                    activeColor: Colors.blue,
                                    onChanged: (val){
                                      setselectedRadio(val);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  Text("eng"),
                                  Radio(
                                    value: 2,
                                    groupValue: selectedRadio,
                                    activeColor: Colors.blue,
                                    onChanged: ( val){
                                      setselectedRadio(val);
                                                                          },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        RaisedButton(
                          color: Colors.greenAccent,
                          padding: EdgeInsets.only(left: 50,right: 50,top: 15,bottom: 15),
                          onPressed: (){
                            translate();
                          },

                          child: Text("translate",style: TextStyle(color: Colors.grey[800],fontSize: 25),),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  margin: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 30),
                  decoration: BoxDecoration(
                  boxShadow: [ BoxShadow(
                  color: Color.fromRGBO(171, 171, 100, 9),blurRadius: 10,offset: Offset(0,0)),
                    ]
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.white,
                    child: Text(out.toString(),
                    style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.white,
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  },
                  child: Text("back to home_page"),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
    );
  }
}