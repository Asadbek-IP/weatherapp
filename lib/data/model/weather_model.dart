class WeatherModel{
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  int? pressure;
  int? visibility;

  WeatherModel({
    this.cityName,
    this.humidity,
    this.temp,
    this.wind,
    this.pressure,
    this.visibility
});

  WeatherModel.fromJson(Map<String,dynamic> json){
    cityName = json['name'];
    humidity = json['main']['humidity'];
    temp = json['main']['temp'];
    wind = json['wind']['speed'];
    pressure = json['main']['pressure'];
    visibility = json['visibility'];
  }


}