import 'package:dio/dio.dart';
import 'package:weatherapp/data/model/weather_model.dart';

class WeatherCallApi{

  Future<WeatherModel?> getCurrentWeather (String location) async{

    Response response;
    var dio = Dio();
    response = await dio.get('http://api.openweathermap.org/data/2.5/weather?q=$location&appid=6586eb96f640f4b3a3181ffd0f38a3c4&units=metric');
    print(WeatherModel.fromJson(response.data).cityName);
    return WeatherModel.fromJson(response.data);

  }

}