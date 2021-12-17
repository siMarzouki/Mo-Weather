class OpenWeather {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<Liste>? list;
  final City? city;

  OpenWeather({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  OpenWeather.fromJson(Map<String, dynamic> json)
      : cod = json['cod'] as String?,
        message = json['message'] as int?,
        cnt = json['cnt'] as int?,
        list = (json['list'] as List?)
            ?.map((dynamic e) => Liste.fromJson(e as Map<String, dynamic>))
            .toList(),
        city = (json['city'] as Map<String, dynamic>?) != null
            ? City.fromJson(json['city'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'cod': cod,
        'message': message,
        'cnt': cnt,
        'list': list?.map((e) => e.toJson()).toList(),
        'city': city?.toJson()
      };
}

class Liste {
  final int? dt;
  final Main? main;
  final List<Weather>? weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  final num? pop;
  final Rain? rain;
  final Sys? sys;
  final String? dtTxt;

  Liste({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    this.dtTxt,
  });

  Liste.fromJson(Map<String, dynamic> json)
      : dt = json['dt'] as int?,
        main = (json['main'] as Map<String, dynamic>?) != null
            ? Main.fromJson(json['main'] as Map<String, dynamic>)
            : null,
        weather = (json['weather'] as List?)
            ?.map((dynamic e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        clouds = (json['clouds'] as Map<String, dynamic>?) != null
            ? Clouds.fromJson(json['clouds'] as Map<String, dynamic>)
            : null,
        wind = (json['wind'] as Map<String, dynamic>?) != null
            ? Wind.fromJson(json['wind'] as Map<String, dynamic>)
            : null,
        visibility = json['visibility'] as int?,
        pop = json['pop'] as num?,
        rain = (json['rain'] as Map<String, dynamic>?) != null
            ? Rain.fromJson(json['rain'] as Map<String, dynamic>)
            : null,
        sys = (json['sys'] as Map<String, dynamic>?) != null
            ? Sys.fromJson(json['sys'] as Map<String, dynamic>)
            : null,
        dtTxt = json['dt_txt'] as String?;

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'main': main?.toJson(),
        'weather': weather?.map((e) => e.toJson()).toList(),
        'clouds': clouds?.toJson(),
        'wind': wind?.toJson(),
        'visibility': visibility,
        'pop': pop,
        'rain': rain?.toJson(),
        'sys': sys?.toJson(),
        'dt_txt': dtTxt
      };
}

class Main {
  final num? temp;
  final num? feelsLike;
  final num? tempMin;
  final num? tempMax;
  final int? pressure;
  final int? seaLevel;
  final int? grndLevel;
  final int? humidity;
  final num? tempKf;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  Main.fromJson(Map<String, dynamic> json)
      : temp = json['temp'] as num?,
        feelsLike = json['feels_like'] as num?,
        tempMin = json['temp_min'] as num?,
        tempMax = json['temp_max'] as num?,
        pressure = json['pressure'] as int?,
        seaLevel = json['sea_level'] as int?,
        grndLevel = json['grnd_level'] as int?,
        humidity = json['humidity'] as int?,
        tempKf = json['temp_kf'] as num?;

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'pressure': pressure,
        'sea_level': seaLevel,
        'grnd_level': grndLevel,
        'humidity': humidity,
        'temp_kf': tempKf
      };
}

class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  Weather.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        main = json['main'] as String?,
        description = json['description'] as String?,
        icon = json['icon'] as String?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'main': main, 'description': description, 'icon': icon};
}

class Clouds {
  final int? all;

  Clouds({
    this.all,
  });

  Clouds.fromJson(Map<String, dynamic> json) : all = json['all'] as int?;

  Map<String, dynamic> toJson() => {'all': all};
}

class Wind {
  final num? speed;
  final int? deg;
  final num? gust;

  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  Wind.fromJson(Map<String, dynamic> json)
      : speed = json['speed'] as num?,
        deg = json['deg'] as int?,
        gust = json['gust'] as num?;

  Map<String, dynamic> toJson() => {'speed': speed, 'deg': deg, 'gust': gust};
}

class Rain {
  final num? h;

  Rain({
    this.h,
  });

  Rain.fromJson(Map<String, dynamic> json) : h = json['3h'] as num?;

  Map<String, dynamic> toJson() => {'3h': h};
}

class Sys {
  final String? pod;

  Sys({
    this.pod,
  });

  Sys.fromJson(Map<String, dynamic> json) : pod = json['pod'] as String?;

  Map<String, dynamic> toJson() => {'pod': pod};
}

class City {
  final int? id;
  final String? name;
  final Coord? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  City.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        coord = (json['coord'] as Map<String, dynamic>?) != null
            ? Coord.fromJson(json['coord'] as Map<String, dynamic>)
            : null,
        country = json['country'] as String?,
        population = json['population'] as int?,
        timezone = json['timezone'] as int?,
        sunrise = json['sunrise'] as int?,
        sunset = json['sunset'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'coord': coord?.toJson(),
        'country': country,
        'population': population,
        'timezone': timezone,
        'sunrise': sunrise,
        'sunset': sunset
      };
}

class Coord {
  final num? lat;
  final num? lon;

  Coord({
    this.lat,
    this.lon,
  });

  Coord.fromJson(Map<String, dynamic> json)
      : lat = json['lat'] as num?,
        lon = json['lon'] as num?;

  Map<String, dynamic> toJson() => {'lat': lat, 'lon': lon};
}
