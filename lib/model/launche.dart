import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Launches {
  Fairings? _fairings;
  String? _links;
  String? _staticFireDateUtc;
  int? _staticFireDateUnix;
  bool? _tbd;
  bool? _net;
  int? _window;
  String? _rocket;
  bool? _success;
  String? _details;
  List<Null>? _crew;
  List<Null>? _ships;
  List<Null>? _capsules;
  List<String>? _payloads;
  String? _launchpad;
  bool? _autoUpdate;
  Null _launchLibraryId;
  List<Failures>? _failures;
  int? _flightNumber;
  String? _name;
  String? _dateUtc;
  int? _dateUnix;
  String? _dateLocal;
  String? _datePrecision;
  bool? _upcoming;
  List<Cores>? _cores;
  String? _id;

  Fairings? get fairings => _fairings;

  String? get links => _links;

  String? get staticFireDateUtc => _staticFireDateUtc;

  int? get staticFireDateUnix => _staticFireDateUnix;

  bool? get tbd => _tbd;

  bool? get net => _net;

  int? get window => _window;

  String? get rocket => _rocket;

  bool? get success => _success;

  String? get details => _details;

  List<Null>? get crew => _crew;

  List<Null>? get ships => _ships;

  List<Null>? get capsules => _capsules;

  List<String>? get payloads => _payloads;

  String? get launchpad => _launchpad;

  bool? get autoUpdate => _autoUpdate;

  Null get launchLibraryId => _launchLibraryId;

  List<Failures>? get failures => _failures;

  int? get flightNumber => _flightNumber;

  String? get name => _name;

  String? get dateUtc => _dateUtc;

  int? get dateUnix => _dateUnix;

  String? get dateLocal => _dateLocal;

  String? get datePrecision => _datePrecision;

  bool? get upcoming => _upcoming;

  List<Cores>? get cores => _cores;

  String? get id => _id;

  Future<List<Launches>?>? fetchLaunches() async {
    List<Launches> listdragons = [];
    var url = Uri.parse("https://api.spacexdata.com/v4/launches/past");

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      for (var item in jsonResponse) {
        listdragons.add(Launches.fromJson(item));
      }
      return listdragons;
      // var itemCount = jsonResponse['totalItems'];
      // print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Launches(
      {Fairings? fairings,
        String? links,
        String? staticFireDateUtc,
        int? staticFireDateUnix,
        bool? tbd,
        bool? net,
        int? window,
        String? rocket,
        bool? success,
        String? details,
        List<Null>? crew,
        List<Null>? ships,
        List<Null>? capsules,
        List<String>? payloads,
        String? launchpad,
        bool? autoUpdate,
        Null launchLibraryId,
        List<Failures>? failures,
        int? flightNumber,
        String? name,
        String? dateUtc,
        int? dateUnix,
        String? dateLocal,
        String? datePrecision,
        bool? upcoming,
        List<Cores>? cores,
        String? id}) {
    _fairings = fairings;
    _links = links;
    _staticFireDateUtc = staticFireDateUtc;
    _staticFireDateUnix = staticFireDateUnix;
    _tbd = tbd;
    _net = net;
    _window = window;
    _rocket = rocket;
    _success = success;
    _details = details;
    _crew = crew;
    _ships = ships;
    _capsules = capsules;
    _payloads = payloads;
    _launchpad = launchpad;
    _autoUpdate = autoUpdate;
    _launchLibraryId = launchLibraryId;
    _failures = failures;
    _flightNumber = flightNumber;
    _name = name;
    _dateUtc = dateUtc;
    _dateUnix = dateUnix;
    _dateLocal = dateLocal;
    _datePrecision = datePrecision;
    _upcoming = upcoming;
    _cores = cores;
    _id = id;
  }

  Launches.fromJson(Map<String, dynamic> json) {
    _links = json['links'] ['patch']['small'];

    //  _links = json['links'] ['patch'];
    //  _links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    _details = json['details'];

    _name = json['name'];
    _dateUtc = json['date_utc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (_fairings != null) {
      data['fairings'] = _fairings!.toJson();
    }
    if (_links != null) {
      data['links'] = _links;
    }
    data['static_fire_date_utc'] = _staticFireDateUtc;
    data['static_fire_date_unix'] = _staticFireDateUnix;
    data['tbd'] = _tbd;
    data['net'] = _net;
    data['window'] = _window;
    data['rocket'] = _rocket;
    data['success'] = _success;
    data['details'] = _details;
    if (_crew != null) {
      data['crew'] = _crew!.map((v) => v).toList();
    }
    if (_ships != null) {
      data['ships'] = _ships!.map((v) => v).toList();
    }
    if (_capsules != null) {
      data['capsules'] = _capsules!.map((v) => v).toList();
    }
    data['payloads'] = _payloads;
    data['launchpad'] = _launchpad;
    data['auto_update'] = _autoUpdate;
    data['launch_library_id'] = _launchLibraryId;
    if (_failures != null) {
      data['failures'] = _failures!.map((v) => v.toJson()).toList();
    }
    data['flight_number'] = _flightNumber;
    data['name'] = _name;
    data['date_utc'] = _dateUtc;
    data['date_unix'] = _dateUnix;
    data['date_local'] = _dateLocal;
    data['date_precision'] = _datePrecision;
    data['upcoming'] = _upcoming;
    if (this._cores != null) {
      data['cores'] = _cores!.map((v) => v.toJson()).toList();
    }
    data['id'] = _id;
    return data;
  }
}

class Fairings {
  bool? _reused;
  bool? _recoveryAttempt;
  bool? _recovered;
  List<Null>? _ships;

  bool? get reused => _reused;

  bool? get recoveryAttempt => _recoveryAttempt;

  bool? get recovered => _recovered;

  List<Null>? get ships => _ships;

  Fairings({
    bool? reused,
    bool? recoveryAttempt,
    bool? recovered,
    List<Null>? ships,
  }) {
    _reused = reused!;
    _recoveryAttempt = recoveryAttempt!;
    _recovered = recovered!;
    _ships = ships;
  }

  Fairings.fromJson(Map<String, dynamic> json) {
    _reused = json['reused'];
    _recoveryAttempt = json['recovery_attempt'];
    _recovered = json['recovered'];
    if (json['ships'] != null) {
      _ships = <Null>[] ;
      json['ships'].forEach((v) {
        print(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reused'] = _reused;
    data['recovery_attempt'] = _recoveryAttempt;
    data['recovered'] = _recovered;
    if (_ships != null) {
      data['ships'] = _ships!.map((v) => v).toList();
    }
    return data;
  }
}

class Links {
  Patch? _patch;
  Reddit? _reddit;
  Flickr? _flickr;
  Null _presskit;
  String? _webcast;
  String? _youtubeId;
  String? _article;
  String? _wikipedia;

  Patch? get patch => _patch;

  Reddit? get reddit => _reddit;

  Flickr? get flickr => _flickr;

  Null get presskit => _presskit;

  String? get webcast => _webcast;

  String? get youtubeId => _youtubeId;

  String? get article => _article;

  String? get wikipedia => _wikipedia;

  Links({
    Patch? patch,
    Reddit? reddit,
    Flickr? flickr,
    Null presskit,
    String? webcast,
    String? youtubeId,
    String? article,
    String? wikipedia,
  }) {
    _patch = patch;
    _reddit = reddit;
    _flickr = flickr;
    _presskit = presskit;
    _webcast = webcast;
    _youtubeId = youtubeId;
    _article = article;
    _wikipedia = wikipedia;
  }

  Links.fromJson(Map<String, dynamic> json) {
    _patch = json['patch'] != null ? new Patch.fromJson(json['patch']) : null;
    // _patch = json['patch'] != null ? new Patch.fromJson(json['patch']) : null;
    //  _reddit = json['reddit'] != null ? new Reddit.fromJson(json['reddit']) : null;
    //   _flickr = json['flickr'] != null ? new Flickr.fromJson(json['flickr']) : null;
    _presskit = json['presskit'];
    _webcast = json['webcast'];
    _youtubeId = json['youtube_id'];
    _article = json['article'];
    _wikipedia = json['wikipedia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (_patch != null) {
      data['patch'] = _patch!.toJson();
    }
    if (_reddit != null) {
      data['reddit'] = _reddit!.toJson();
    }
    if (_flickr != null) {
      data['flickr'] = _flickr!.toJson();
    }
    data['presskit'] = _presskit;
    data['webcast'] = _webcast;
    data['youtube_id'] = _youtubeId;
    data['article'] = _article;
    data['wikipedia'] = _wikipedia;
    return data;
  }
}

class Patch {
  String? _small;
  String? _large;

  String? get small => _small;

  String? get large => _large;

  Patch({String? small, String? large}) {
    _small = small;
    _large = large;
  }

  Patch.fromJson(Map<String, dynamic> json) {
    _small = json['small'];
    _large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = _small;
    data['large'] = _large;
    return data;
  }
}

class Reddit {
  Null _campaign;
  Null _launch;
  Null _media;
  Null _recovery;

  Null get campaign => _campaign;

  Null get launch => _launch;

  Null get media => _media;

  Null get recovery => _recovery;

  Reddit({Null campaign, Null launch, Null media, Null recovery}) {
    _campaign = campaign;
    _launch = launch;
    _media = media;
    _recovery = recovery;
  }

  Reddit.fromJson(Map<String, dynamic> json) {
    _campaign = json['campaign'];
    _launch = json['launch'];
    _media = json['media'];
    _recovery = json['recovery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['campaign'] = _campaign;
    data['launch'] = _launch;
    data['media'] = _media;
    data['recovery'] = _recovery;
    return data;
  }
}

class Flickr {
  List<Null>? _small;
  List<Null>? _original;

  List<Null>? get small => _small;

  List<Null>? get original => _original;

  Flickr({List<Null>? small, List<Null>? original}) {
    _small = small;
    _original = original;
  }

  Flickr.fromJson(Map<String, dynamic> json) {
    if (json['small'] != null) {
      _small = <Null>[];
      json['small'].forEach((v) {
        print(v);
      });
    }
    if (json['original'] != null) {
      _original = <Null>[];
      json['original'].forEach((v) {
        print(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (_small != null) {
      data['small'] = _small!.map((v) => v).toList();
    }
    if (_original != null) {
      data['original'] = _original!.map((v) => v).toList();
    }
    return data;
  }
}

class Failures {
  int? _time;
  Null _altitude;
  String? _reason;

  int? get time => _time;

  Null get altitude => _altitude;

  String? get reason => _reason;

  Failures({int? time, Null altitude, String? reason}) {
    _time = time;
    _altitude = altitude;
    _reason = reason;
  }

  Failures.fromJson(Map<String, dynamic> json) {
    _time = json['time'];
    _altitude = json['altitude'];
    _reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = _time;
    data['altitude'] = _altitude;
    data['reason'] = _reason;
    return data;
  }
}

class Cores {
  String? _core;
  int? _flight;
  bool? _gridfins;
  bool? _legs;
  bool? _reused;
  bool? _landingAttempt;
  Null _landingSuccess;
  Null _landingType;
  Null _landpad;

  String? get core => _core;

  int? get flight => _flight;

  bool? get gridfins => _gridfins;

  bool? get legs => _legs;

  bool? get reused => _reused;

  bool? get landingAttempt => _landingAttempt;

  Null get landingSuccess => _landingSuccess;

  Null get landingType => _landingType;

  Null get landpad => _landpad;

  Cores(
      {String? core,
        int? flight,
        bool? gridfins,
        bool? legs,
        bool? reused,
        bool? landingAttempt,
        Null landingSuccess,
        Null landingType,
        Null landpad}) {
    _core = core;
    _flight = flight;
    _gridfins = gridfins;
    _legs = legs;
    _reused = reused;
    _landingAttempt = landingAttempt;
    _landingSuccess = landingSuccess;
    _landingType = landingType;
    _landpad = landpad;
  }

  Cores.fromJson(Map<String, dynamic> json) {
    _core = json['core'];
    _flight = json['flight'];
    _gridfins = json['gridfins'];
    _legs = json['legs'];
    _reused = json['reused'];
    _landingAttempt = json['landing_attempt'];
    _landingSuccess = json['landing_success'];
    _landingType = json['landing_type'];
    _landpad = json['landpad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['core'] = _core;
    data['flight'] = _flight;
    data['gridfins'] = _gridfins;
    data['legs'] = _legs;
    data['reused'] = _reused;
    data['landing_attempt'] = _landingAttempt;
    data['landing_success'] = _landingSuccess;
    data['landing_type'] = _landingType;
    data['landpad'] = _landpad;
    return data;
  }
}
