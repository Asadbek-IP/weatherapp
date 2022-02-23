import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/config/constants.dart';
import 'package:weatherapp/data/model/weather_model.dart';
import 'package:weatherapp/data/services/weather_call_api.dart';
import 'package:weatherapp/ui/pages/searchbar/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherCallApi callApi = WeatherCallApi();
  WeatherModel? data;

  @override
  void initState() {
    super.initState();
     getData();

  }

  Future<void> getData() async {
    data = await callApi.getCurrentWeather('Tashkent');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body:

      Container(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 10,),
                          IconButton(onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => SearchPage(),
                                transitionsBuilder: (c, anim, a2, child) =>
                                    FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 200),
                              ),
                            );
                          },
                            icon: Icon(Icons.search),
                            color: Colors.black87,
                            iconSize: 30,),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text('${DateTime.now()}', style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: "Montserrat",),),
                      SizedBox(height: 10,),
                      Text('${data!.cityName}', style: TextStyle(fontSize: 40,
                          color: Colors.white,
                          fontFamily: "Montserrat-Bold",
                          fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text('UZ',
                        style: TextStyle(fontSize: 20, color: Colors.white),),
                      SizedBox(height: 10,),
                      Container(
                        width: 240,
                        height: 240,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(blurRadius: 2,
                              color: Colors.white,
                              spreadRadius: 1)
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Image(
                                  width: 75,
                                  height: 75,
                                  image: AssetImage('assets/icons/rain.png')),
                              Text('${data!.temp!.round()}°C', style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 100,
                                  fontWeight: FontWeight.w300),),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('Wind status', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),),
                              SizedBox(height: 5,),
                              Text('${data!.wind}', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),),

                            ],
                          ),
                          Column(
                            children: [
                              Text('Visibility', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),),
                              SizedBox(height: 5,),
                              Text('${data!.visibility}', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),),

                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('Humidity', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),),
                              SizedBox(height: 5,),
                              Text('${data!.humidity}%', style: TextStyle(color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),),

                            ],
                          ),
                          Column(
                            children: [
                              Text('Air pressure', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),),
                              SizedBox(height: 5,),
                              Text('${data!.pressure}', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),),

                            ],
                          ),
                        ],
                      ),
                    ],

                  ),
                ),
              ),

              Expanded(
                child: Container(
                  height: 220,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16,),
                      Text('   The Next 5 days', style: TextStyle(fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, int index) {
                              return _dayItem();
                            }),
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _dayItem() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sunday'),
          SizedBox(height: 10,),
          Container(
            width: 55,
            height: 75,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  width: 26,
                  height: 26,
                  image: AssetImage('assets/icons/snow.png'),
                ),
                SizedBox(height: 5,),
                Text('10° C', style: TextStyle(fontSize: 14),)
              ],
            ),
          ),


        ],
      ),
    );
  }

}




