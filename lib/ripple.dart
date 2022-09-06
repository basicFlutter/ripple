import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class Ripple extends StatefulWidget {
  const Ripple({Key? key}) : super(key: key);

  @override
  State<Ripple> createState() => _RippleState();
}

class _RippleState extends State<Ripple> {
  Key? _key;
  bool repeat = false;


  @override
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(

      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: screenWidth * 0.042,
              height: screenHeight * 0.042,
              child: SvgPicture.asset("assets/images/insta.svg",
                  color: Colors.grey),
            ),
            SizedBox(
              width:screenWidth*0.02,
            ),
            const Text("basic_flutter",style: TextStyle(color: Colors.grey),),
          ],
        ),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(
            width: screenWidth,
            height: screenHeight*0.6,
            child: RippleAnimation(
                repeat: repeat,
                key: _key,
                color: Colors.red,
                minRadius: 60,
                duration: const Duration(milliseconds: 2500),
                ripplesCount: 5,
                child: Container()
            ),
          ),


          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: screenWidth*0.05,
                ),
                TextButton(onPressed: (){
                  setState(() {
                    _key = UniqueKey();
                    repeat = true;
                  });
                }, child: const Text(
                  "Repeat",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                  ),)
                ),
                SizedBox(
                  width: screenWidth*0.1,
                ),
                TextButton(
                    onPressed: (){
                      setState(() {
                        _key = UniqueKey();
                        repeat = false;
                      });
                    }, child: const Text(
                  "Touch",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20
                  ),)
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight*0.02,
          )

        ],
      ),
    );
  }
}
