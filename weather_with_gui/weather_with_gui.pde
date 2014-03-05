//declare variables
//url is the base url for Yahoo's RSS feed
//woeid is the location I'm using
String url = "http://weather.yahooapis.com/forecastrss?w=";
String woeid = "2518192";
String city, region, country;
String sunrise, sunset;
int currentTemp, currentCode;
String currentDesc, rightNow;
String[] codes = {
  "with tornadoes", "with a tropical storm", "with a hurricane", "with severe thunderstorms", "with thunderstorms", "with a mix of rain and snow", "with a mix of rain and sleet", "with a mix of snow and sleet", "with freezing drizzle", "and drizzling", "with freezing rain", "with rain showers", "with rain showers", "with snow flurries", "with light snow showers", "with blowing snow", "and snowing", "with hail", "with sleet", "and dusty", "and foggy", "and hazy", "and smoky", "with blustery winds", "and windy", "and cold", "and cloudy", "and mostly cloudy", "and mostly cloudy", "and partly cloudy", "and partly cloudy", "and clear", "and sunny", "and fair", "and fair", "with a mix of rain and hail", "and hot", "with isolated thunderstorms", "with scattered thunderstorms", "with scattered thunderstorms", "with scattered showers", "and snowing heavily", "with scattered snow showers", "and snowing heavily", "and partly cloudy", "with thundershowers", "with snow showers", "with isolated thundershowers"
};

void setup() {
  //declare an XML object and load the URL we want for the weather forecast
  XML xml;
  xml = loadXML(url+woeid);
  
  //Create XML objects for each part of the feed we want to access
  XML location = xml.getChild("channel/yweather:location");
  XML astronomy = xml.getChild("channel/yweather:astronomy");
  XML current = xml.getChild("channel/item/yweather:condition");
  
  //use getInt() and getString() to access information from the XML objects
  city = location.getString("city");
  region = location.getString("region");
  country = location.getString("country");
  sunrise = astronomy.getString("sunrise");
  sunset = astronomy.getString("sunset");
  currentTemp = current.getInt("temp");
  currentCode = current.getInt("code");
  currentDesc = current.getString("text");
  rightNow = current.getString("date");



  println("Welcome to " + city + ", " + region);
  println("Sunrise: " + sunrise + "     Sunset: " + sunset);
  println("It's " + currentTemp + " " + codes[currentCode]);
}

void draw() {
}

