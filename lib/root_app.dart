import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {

  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: SvgPicture.asset("assets/images/burger_icon.svg"), onPressed: (){
              }),
            Row(
              children: <Widget>[
                IconButton(icon: SvgPicture.asset("assets/images/search_icon.svg"), onPressed: (){
                }),
                IconButton(icon: SvgPicture.asset("assets/images/filter_icon.svg"), onPressed: (){
                }),
              ],
            )
          ],
        ),
      ),
      body: getBody(),
      bottomNavigationBar: getBottomNavbar(),
    );
  }
  Widget getBody()
  {
    return IndexedStack(
      index: activeTab,
      children: <Widget>[
        HomePage(),
        Center(
          child: Text('Home', style: TextStyle(fontSize: 35),),
        ),
        Center(
          child: Text('Product List', style: TextStyle(fontSize: 35),),
        ),
        Center(
          child: Text('Chat', style: TextStyle(fontSize: 35),),
        ),
        Center(
          child: Text('Account', style: TextStyle(fontSize: 35),),
        ),
      ],
    );
  }

  Widget getBottomNavbar() {

    var size = MediaQuery.of(context).size;
    List items = [LineIcons.home, LineIcons.barcode, LineIcons.comment, LineIcons.user];

    return Container(

      width: size.width,
      height: 90,
      decoration: BoxDecoration(
        color: white,
      ),
      child: Padding(padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15), child:
             Container(
               decoration: BoxDecoration(
                 color: black,
                 borderRadius: BorderRadius.circular(30)
               ),
               child: Padding(
                 padding: const EdgeInsets.only(left: 20, right: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(items.length, (index){
                      return IconButton(icon: Icon(items[index], color: white,size: 28,), onPressed: (){
                        setState(() {
                          activeTab = index;
                        });
                      });
                    })
                 ),
               ),
             ),),
    );
  }
}

