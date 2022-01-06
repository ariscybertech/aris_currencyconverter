import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  final MediaQueryData mediaQuery;
  Background({this.mediaQuery});

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  TextEditingController txtController= TextEditingController();
  convertedValue (){
    if(txtController.text == ""){
      return '0';
    }
    var x = 0.8;
    var y = double.parse(txtController.text);
    var z =  x*y;
    return z.toStringAsFixed(2);
  }
  Widget build(BuildContext context) {
    var height = widget.mediaQuery.size.height ;
    var width = widget.mediaQuery.size.width;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
         children: <Widget>[
           Container(
             padding: EdgeInsets.only(top: 30),
             width: double.infinity,
             height: height*.5,
             decoration: BoxDecoration(
               color: Colors.white
             ),
             child: Column(
               children: <Widget>[
                 Container(
                   margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                   child: FittedBox(
                     child: Text('UNITED STATES DOLLAR',
                       style: TextStyle(
                           color: Color(0xFFFFBD59),
                           fontSize:1000,
                           fontFamily: 'LeagueGothic'),
                     ),
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Container(
                       margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                        padding: EdgeInsets.all(0),
                        width: width*.5,
//                   padding: EdgeInsets.only(bottom: 1),
                       decoration: BoxDecoration(
                         border: Border(
                           bottom: BorderSide(width: 5, color: Color(0xFFFFBD59))
                         )
                       ),
                       child: TextField(
                         onEditingComplete: (){
                           print(txtController.text);
                           FocusScope.of(context).requestFocus(FocusNode());
                         },
                         textAlign: TextAlign.center,
                         decoration: InputDecoration(
                           hintText: '\$\$\$\$',
                            hintStyle: TextStyle(fontSize: 40,fontFamily: 'LeagueGothic',color: Colors.grey),
                            border: new OutlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                           labelStyle: TextStyle(
                               fontSize: 30
                           ),
                         ),
                         style: TextStyle(
                           fontSize: 60,fontFamily: 'LeagueGothic',color: Color(0xFFFFBD59)
                         ),
                         keyboardType: TextInputType.numberWithOptions(),
                         controller: txtController,
                       ),
                     ),
                     Container(
                       margin: EdgeInsets.only(top: 56),
                         child: Text('\$', style: TextStyle(fontSize: 60,fontFamily: 'LeagueGothic',color: Color(0xFFFFBD59)),
                         ),
                     )
                   ],
                 )
               ],
             ),
           ),
           Container(
             padding: EdgeInsets.only(top: 50),
             height: height*.5,
             decoration: BoxDecoration(
               color: Color(0xFFFFBD59),
             ),
             width: double.infinity,
             child: Column(
               children: <Widget>[
                 Container(
                   margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                   child: FittedBox(
                     child: Text('GREAT BRITIAN POUND',
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: 1000,
                           fontFamily: 'LeagueGothic',
                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                   height: 30,
                 ),
                 Text( convertedValue().toString() + '   £',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 60,
                     fontFamily: 'LeagueGothic',
                   ),
                 ),
               ],
             ),
           ),
         ],
        ),
          Positioned(
            top: height * .45,
            width: width,
            height: height*.1,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFF5757),
              ),
              child: Icon(Icons.arrow_downward, color: Colors.white, size: 70, ),
            ),
          )
      ],
      ),
    );
  }
}
