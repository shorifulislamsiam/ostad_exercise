class City{
  String? name;
  double? temperature;
  String? condition;
  DateTime? lastUpdated;
  City({required this.name, required this.temperature, required this.condition, required this.lastUpdated});
}
class WeatherMonitor {
  List<City> cities = [];

  void addCityWeather(City city) {
    cities.add(city);
    print("Added weather data for ${city.name}");
  }

  void updateWeather(String? cityName, double? temperature, String? condition,
      DateTime? lastUpdate) {
    for (var city in cities) {
      if (city.name == cityName) {
        city.temperature = temperature;
        city.condition = condition;
        city.lastUpdated = DateTime.now();
        print("Update Weather for ${city.name}");
      }
    }
    print("City $cityName not found");
  }

  void showCitySortedByTempearature() {
    cities.sort((a, b) => a.temperature!.compareTo(b.temperature!));
    for (var city in cities) {
      print('${city.name}: ${city.temperature}°C, ${city
          .condition}, Last updated: ${city.lastUpdated}');
    }
  }

  void showCitiesWithCondition(String?condition) {
    var filteredCities = cities
        .where((city) => city.condition == condition)
        .toList();
    for (var city in filteredCities) {
      print('${city.name}: ${city.temperature}°C, ${city
          .condition}, Last updated: ${city.lastUpdated}');
    }
  }

  Future<void> fetchNewWeatherData() async {
    print('Fetching new weather data...');
    await Future.delayed(Duration(
        seconds: 2)); // Simulate async operation print('Weather data updated.'); }
  }
}



void main() {
  City dhaka = City(name: 'Dhaka', temperature: 30.0, condition: 'Sunny', lastUpdated: DateTime.now());

  City chittagong = City(name:'Chittagong', temperature:28.0, condition:'Rainy',lastUpdated: DateTime.now());
  City sylhet = City(name:'Sylhet', temperature:25.0, condition:'Cloudy',lastUpdated: DateTime.now());
  WeatherMonitor weatherMonitor = WeatherMonitor();
  weatherMonitor.addCityWeather(dhaka); weatherMonitor.addCityWeather(chittagong);
  weatherMonitor.addCityWeather(sylhet); weatherMonitor.showCitySortedByTempearature();
  weatherMonitor.showCitiesWithCondition('Rainy');
  // Update weather conditions
  weatherMonitor.updateWeather('Dhaka', 29.0, 'Cloudy',DateTime.now());
  weatherMonitor.showCitiesWithCondition('Cloudy');
  // Simulate fetching new weather data
  weatherMonitor.fetchNewWeatherData(); }