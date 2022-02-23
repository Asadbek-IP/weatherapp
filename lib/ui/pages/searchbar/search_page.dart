import 'package:flutter/material.dart';
import 'package:weatherapp/config/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              kPrimary,
              kPrimaryLight,
            ],
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          iconSize: 30,
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        height: 50,
                        width: double.infinity,
                        child: TextField(
                         decoration: InputDecoration(
                           filled: true,
                           border: InputBorder.none,
                           fillColor: Colors.grey.shade300,
                           enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(20)),
                             borderSide: BorderSide(color: Colors.grey.shade200),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(20)),
                             borderSide: BorderSide(color: Colors.grey.shade200),
                           ),
                         ),
                        ),
                      ),

                    ],
                  )
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
