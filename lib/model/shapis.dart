import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class Shapis {
  String? _legacyId;
 // Null _model;
  String? _type;
  List<String>? _roles;
  int? _imo;
  int? _mmsi;
  int? _abs;
  int? _massKg;
  int? _massLbs;
  int? _yearBuilt;
  String? _homePort;
  String? _status;
  //Null? _speedKn;
  //Null? _courseDeg;
 // Null? _latitude;
  //Null? _longitude;
  //Null? _lastAisUpdate;
  String? _link;
  String? _image;
  List<String>? _launches;
  String? _name;
  bool? _active;
  String? _id;


  String? get legacyId => _legacyId;
 // Null get model => _model;
  String? get type => _type;
  List<String>? get roles => _roles;
  int? get imo => _imo;
  int? get mmsi => _mmsi;
  int? get abs => _abs;
  int? get massKg => _massKg;
  int? get massLbs => _massLbs;
  int? get yearBuilt =>  _yearBuilt;
 // Null get speedKn => _speedKn;
  //Null get courseDeg => _courseDeg;
  //Null get latitude => _latitude;
  String? get homePort => _homePort;
  String? get status => _status;
  //Null get longitude => _longitude;
  //Null get lastAisUpdate => _lastAisUpdate;
  String? get link => _link;
  String? get image => _image;
  List<String>?get  launches => _launches;
  String? get name => _name;
  bool? get active => _active;
  String? get id => _id;


  Future<List<Shapis>?>? fetchShapis() async {
    List<Shapis> listdragons = [];
    var url = Uri.parse("https://api.spacexdata.com/v4/ships");

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      for (var item in jsonResponse) {
        listdragons.add(Shapis.fromJson(item));
      }
      return listdragons;
      // var itemCount = jsonResponse['totalItems'];
      // print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }


  Shapis({String? legacyId,
    //Null model,
    String? type,
    List<String>? roles,
    int? imo,
    int? mmsi,
    int? abs,
    int? massKg,
    int? massLbs,
    int? yearBuilt,
    String? homePort,
    String? status,
    //Null speedKn,
    //Null courseDeg,
    //Null latitude,
    //Null longitude,
    //Null lastAisUpdate,
    String? link,
    String? image,
    List<String>? launches,
    String? name,
    bool? active,
    String? id,}) {
    _legacyId = legacyId ;
   // _model= model;
    _type = type;
    _roles = roles ;
    _imo =imo ;
    _mmsi =mmsi ;
    _abs = abs;
    _massKg = massKg ;
    _massLbs = massLbs ;
    _yearBuilt = yearBuilt ;
    _homePort = homePort;
    _status = status;
   // _speedKn = speedKn ;
    //_courseDeg = courseDeg ;
    //_latitude = latitude ;
    //_longitude = longitude ;
    //_lastAisUpdate = lastAisUpdate ;
    _link =link ;
    _image = image ;
    _launches =launches ;
    _name = name ;
    _active = active ;
    _id =id ;


  }

  Shapis.fromJson( dynamic json) {
    //  _legacyId = json['legacy_id'];
    //_model = json['model'];
    _type = json['type'];
//    _roles = json['roles'].cast<String>();
    //  _imo = json['imo'];
    //_mmsi = json['mmsi'];
    //  _abs = json['abs'];
    //_massKg = json['mass_kg'];
    // _massLbs = json['mass_lbs'];
    //  _yearBuilt = json['year_built'];
    //  _homePort = json['home_port'];
    //_status = json['status'];
    //_speedKn = json['speed_kn'];
    //_courseDeg = json['course_deg'];
    //_latitude = json['latitude'];
    // _longitude = json['longitude'];
    // _lastAisUpdate = json['last_ais_update'];
    // _link = json['link'];
    _image = json['image'];
    //_launches = json['launches'].cast<String>();
    _name = json['name'];
    _active = json['active'];
    //_id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['legacy_id'] = _legacyId;
    //data['model'] = _model;
    data['type'] = _type;
    data['roles'] = _roles;
    data['imo'] = _imo;
    data['mmsi'] = _mmsi;
    data['abs'] = _abs;
    data['mass_kg'] = _massKg;
    data['mass_lbs'] = _massLbs;
    data['year_built'] = _yearBuilt;
    data['home_port'] = _homePort;
    data['status'] = _status;
   // data['speed_kn'] = _speedKn;
   // data['course_deg'] = _courseDeg;
   // data['latitude'] = _latitude;
   // data['longitude'] = _longitude;
   // data['last_ais_update'] = _lastAisUpdate;
    data['link'] = _link;
    data['image'] = _image;
    data['launches'] = _launches;
    data['name'] = _name;
    data['active'] = _active;
    data['id'] = _id;
    print("id");
    return data;
  }

  @override
  String toString() {
    return 'Shapis{_legacyId: $_legacyId,  _type: $_type, '
        '_roles: $_roles, _imo: $_imo, _mmsi: $_mmsi, _abs: $_abs, '
        '_massKg: $_massKg, _massLbs: $_massLbs, _yearBuilt: $_yearBuilt, '
        '_homePort: $_homePort, _status: $_status,'
     //  ' _courseDeg: $_courseDeg, _latitude: $_latitude, _longitude: $_longitude,'
        '  _link: $_link, _image: $_image,'
        ' _launches: $_launches, _name: $_name, _active: $_active, _id: $_id}';
  }

  Future<List<Shapis>?>? fetchShapi() async {
    List<Shapis> listdragons = [];
    var url = Uri.parse("https://api.spacexdata.com/v4/ships");

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      for (var item in jsonResponse) {
        listdragons.add(Shapis.fromJson(item));
      }
      return listdragons;
      // var itemCount = jsonResponse['totalItems'];
      // print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}



