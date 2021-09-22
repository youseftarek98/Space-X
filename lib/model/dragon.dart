

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class ModelDragons  {
  Heat_shield? _heatShield;
  Launch_payload_mass? _launchPayloadMass;
  Launch_payload_vol? _launchPayloadVol;
  Return_payload_mass? _returnPayloadMass;
  Return_payload_vol? _returnPayloadVol;
  Pressurized_capsule? _pressurizedCapsule;
  Trunk? _trunk;
  Height_w_trunk? _heightWTrunk;
  Diameter? _diameter;
  String? _firstFlight;
  List<String>? _flickrImages;
  String? _name;
  String? _type;
  bool? _active;
  int? _crewCapacity;
  int? _sidewallAngleDeg;
  int? _orbitDurationYr;
  int? _dryMassKg;
  int? _dryMassLb;
  List<Thrusters>? _thrusters;
  String? _wikipedia;
  String? _description;
  String? _id;

  Heat_shield? get heatShield => _heatShield;
  Launch_payload_mass? get launchPayloadMass => _launchPayloadMass;
  Launch_payload_vol? get launchPayloadVol => _launchPayloadVol;
  Return_payload_mass? get returnPayloadMass => _returnPayloadMass;
  Return_payload_vol? get returnPayloadVol => _returnPayloadVol;
  Pressurized_capsule? get pressurizedCapsule => _pressurizedCapsule;
  Trunk? get trunk => _trunk;
  Height_w_trunk? get heightWTrunk => _heightWTrunk;
  Diameter? get diameter => _diameter;
  String? get firstFlight => _firstFlight;
  List<String>? get flickrImages => _flickrImages;
  String? get name => _name;
  String? get type => _type;
  bool? get active => _active;
  int? get crewCapacity => _crewCapacity;
  int? get sidewallAngleDeg => _sidewallAngleDeg;
  int? get orbitDurationYr => _orbitDurationYr;
  int? get dryMassKg => _dryMassKg;
  int? get dryMassLb => _dryMassLb;
  List<Thrusters>? get thrusters => _thrusters;
  String? get wikipedia => _wikipedia;
  String? get description => _description;
  String? get id => _id;



  Future<List<ModelDragons>?> fetchDagons() async {
    List<ModelDragons> listdragons = [];
    var url = Uri.parse("https://api.spacexdata.com/v4/dragons");

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      for (var item in jsonResponse) {
        listdragons.add(ModelDragons.fromJson(item));
      }
      return listdragons;
      // var itemCount = jsonResponse['totalItems'];
      // print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }






  ModelDragons({
    Heat_shield? heatShield,
    Launch_payload_mass? launchPayloadMass,
    Launch_payload_vol? launchPayloadVol,
    Return_payload_mass? returnPayloadMass,
    Return_payload_vol? returnPayloadVol,
    Pressurized_capsule? pressurizedCapsule,
    Trunk? trunk,
    Height_w_trunk? heightWTrunk,
    Diameter? diameter,
    String? firstFlight,
    List<String>? flickrImages,
    String? name,
    String? type,
    bool? active,
    int? crewCapacity,
    int? sidewallAngleDeg,
    int? orbitDurationYr,
    int? dryMassKg,
    int? dryMassLb,
    List<Thrusters>? thrusters,
    String? wikipedia,
    String? description,
    String? id}){
    _heatShield = heatShield;
    _launchPayloadMass = launchPayloadMass;
    _launchPayloadVol = launchPayloadVol;
    _returnPayloadMass = returnPayloadMass;
    _returnPayloadVol = returnPayloadVol;
    _pressurizedCapsule = pressurizedCapsule;
    _trunk = trunk;
    _heightWTrunk = heightWTrunk;
    _diameter = diameter;
    _firstFlight = firstFlight;
    _flickrImages = flickrImages;
    _name = name;
    _type = type;
    _active = active;
    _crewCapacity = crewCapacity;
    _sidewallAngleDeg = sidewallAngleDeg;
    _orbitDurationYr = orbitDurationYr;
    _dryMassKg = dryMassKg;
    _dryMassLb = dryMassLb;
    _thrusters = thrusters;
    _wikipedia = wikipedia;
    _description = description;
    _id = id;
  }

  ModelDragons.fromJson(dynamic json) {
    // _heatShield = json["heat_shield"] != null ? Heat_shield.fromJson(json["heatShield"]) : null;
    // _launchPayloadMass = json["launch_payload_mass"] != null ? Launch_payload_mass.fromJson(json["launchPayloadMass"]) : null;
    // _launchPayloadVol = json["launch_payload_vol"] != null ? Launch_payload_vol.fromJson(json["launchPayloadVol"]) : null;
    // _returnPayloadMass = json["return_payload_mass"] != null ? Return_payload_mass.fromJson(json["returnPayloadMass"]) : null;
    // _returnPayloadVol = json["return_payload_vol"] != null ? Return_payload_vol.fromJson(json["returnPayloadVol"]) : null;
    // _pressurizedCapsule = json["pressurized_capsule"] != null ? Pressurized_capsule.fromJson(json["pressurizedCapsule"]) : null;
    // _trunk = json["trunk"] != null ? Trunk.fromJson(json["trunk"]) : null;
    // _heightWTrunk = json["height_w_trunk"] != null ? Height_w_trunk.fromJson(json["heightWTrunk"]) : null;
    // _diameter = json["diameter"] != null ? Diameter.fromJson(json["diameter"]) : null;
    // _firstFlight = json["first_flight"];
    _flickrImages = json["flickr_images"] != null ? json["flickr_images"].cast<String>() : [];
    _name = json["name"];
    _type = json["type"];
    _active = json["active"];
    _crewCapacity = json["crew_capacity"];
    _sidewallAngleDeg = json["sidewall_angle_deg"];
    _orbitDurationYr = json["orbit_duration_yr"];
    _dryMassKg = json["dry_mass_kg"];
    _dryMassLb = json["dry_mass_lb"];
    // if (json["thrusters"] != null) {
    //   _thrusters = [];
    //   json["thrusters"].forEach((v) {
    //     _thrusters.add(Thrusters.fromJson(v));
    //   });
    // }
    _wikipedia = json["wikipedia"];
    _description = json["description"];
    _id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_heatShield != null) {
      map["heat_shield"] = _heatShield!.toJson();
    }
    if (_launchPayloadMass != null) {
      map["launch_payload_mass"] = _launchPayloadMass!.toJson();
    }
    if (_launchPayloadVol != null) {
      map["launch_payload_vol"] = _launchPayloadVol!.toJson();
    }
    if (_returnPayloadMass != null) {
      map["return_payload_mass"] = _returnPayloadMass!.toJson();
    }
    if (_returnPayloadVol != null) {
      map["return_payload_vol"] = _returnPayloadVol!.toJson();
    }
    if (_pressurizedCapsule != null) {
      map["pressurized_capsule"] = _pressurizedCapsule!.toJson();
    }
    if (_trunk != null) {
      map["trunk"] = _trunk!.toJson();
    }
    if (_heightWTrunk != null) {
      map["height_w_trunk"] = _heightWTrunk!.toJson();
    }
    if (_diameter != null) {
      map["diameter"] = _diameter!.toJson();
    }
    map["first_flight"] = _firstFlight;
    map["flickr_images"] = _flickrImages;
    map["name"] = _name;
    map["type"] = _type;
    map["active"] = _active;
    map["crew_capacity"] = _crewCapacity;
    map["sidewall_angle_deg"] = _sidewallAngleDeg;
    map["orbit_duration_yr"] = _orbitDurationYr;
    map["dry_mass_kg"] = _dryMassKg;
    map["dry_mass_lb"] = _dryMassLb;
    if (_thrusters != null) {
      map["thrusters"] = _thrusters!.map((v) => v.toJson()).toList();
    }
    map["wikipedia"] = _wikipedia;
    map["description"] = _description;
    map["id"] = _id;
    return map;
  }

}

class Thrusters {
  String? _type;
  int? _amount;
  int? _pods;
  String? _fuel1;
  String? _fuel2;
  int? _isp;
  Thrust? _thrust;

  String? get type => _type;
  int? get amount => _amount;
  int? get pods => _pods;
  String? get fuel1 => _fuel1;
  String? get fuel2 => _fuel2;
  int? get isp => _isp;
  Thrust? get thrust => _thrust;

  Thrusters({
    String? type,
    int? amount,
    int? pods,
    String? fuel1,
    String? fuel2,
    int? isp,
    Thrust? thrust}){
    _type = type;
    _amount = amount;
    _pods = pods;
    _fuel1 = fuel1;
    _fuel2 = fuel2;
    _isp = isp;
    _thrust = thrust;
  }

  Thrusters.fromJson(dynamic json) {
    _type = json["type"];
    _amount = json["amount"];
    _pods = json["pods"];
    _fuel1 = json["fuel_1"];
    _fuel2 = json["fuel_2"];
    _isp = json["isp"];
    _thrust = json["thrust"] != null ? Thrust.fromJson(json["thrust"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = _type;
    map["amount"] = _amount;
    map["pods"] = _pods;
    map["fuel_1"] = _fuel1;
    map["fuel_2"] = _fuel2;
    map["isp"] = _isp;
    if (_thrust != null) {
      map["thrust"] = _thrust!.toJson();
    }
    return map;
  }

}

class Thrust {
  double? _kN;
  int? _lbf;

  double? get kN => _kN;
  int? get lbf => _lbf;

  Thrust({
    double? kN,
    int? lbf}){
    _kN = kN;
    _lbf = lbf;
  }

  Thrust.fromJson(dynamic json) {
    _kN = json["kN"];
    _lbf = json["lbf"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["kN"] = _kN;
    map["lbf"] = _lbf;
    return map;
  }

}

class Diameter {
  double? _meters;
  int? _feet;

  double? get meters => _meters;
  int? get feet => _feet;

  Diameter({
    double? meters,
    int? feet}){
    _meters = meters;
    _feet = feet;
  }

  Diameter.fromJson(dynamic json) {
    _meters = json["meters"];
    _feet = json["feet"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["meters"] = _meters;
    map["feet"] = _feet;
    return map;
  }

}

class Height_w_trunk {
  double? _meters;
  double? _feet;

  double? get meters => _meters;
  double? get feet => _feet;

  Height_w_trunk({
    double? meters,
    double? feet}){
    _meters = meters;
    _feet = feet;
  }

  Height_w_trunk.fromJson(dynamic json) {
    _meters = json["meters"];
    _feet = json["feet"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["meters"] = _meters;
    map["feet"] = _feet;
    return map;
  }

}

class Trunk {
  Trunk_volume? _trunkVolume;
  Cargo? _cargo;

  Trunk_volume? get trunkVolume => _trunkVolume;
  Cargo? get cargo => _cargo;

  Trunk({
    Trunk_volume? trunkVolume,
    Cargo? cargo}){
    _trunkVolume = trunkVolume;
    _cargo = cargo;
  }

  Trunk.fromJson(dynamic json) {
    _trunkVolume = json["trunk_volume"] != null ? Trunk_volume.fromJson(json["trunkVolume"]) : null;
    _cargo = json["cargo"] != null ? Cargo.fromJson(json["cargo"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_trunkVolume != null) {
      map["trunk_volume"] = _trunkVolume!.toJson();
    }
    if (_cargo != null) {
      map["cargo"] = _cargo!.toJson();
    }
    return map;
  }

}

class Cargo {
  int? _solarArray;
  bool? _unpressurizedCargo;

  int? get solarArray => _solarArray;
  bool? get unpressurizedCargo => _unpressurizedCargo;

  Cargo({
    int? solarArray,
    bool? unpressurizedCargo}){
    _solarArray = solarArray;
    _unpressurizedCargo = unpressurizedCargo;
  }

  Cargo.fromJson(dynamic json) {
    _solarArray = json["solar_array"];
    _unpressurizedCargo = json["unpressurized_cargo"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["solar_array"] = _solarArray;
    map["unpressurized_cargo"] = _unpressurizedCargo;
    return map;
  }

}

class Trunk_volume {
  int? _cubicMeters;
  int? _cubicFeet;

  int? get cubicMeters => _cubicMeters;
  int? get cubicFeet => _cubicFeet;

  Trunk_volume({
    int? cubicMeters,
    int? cubicFeet}){
    _cubicMeters = cubicMeters;
    _cubicFeet = cubicFeet;
  }

  Trunk_volume.fromJson(dynamic json) {
    _cubicMeters = json["cubic_meters"];
    _cubicFeet = json["cubic_feet"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["cubic_meters"] = _cubicMeters;
    map["cubic_feet"] = _cubicFeet;
    return map;
  }

}

class Pressurized_capsule {
  Payload_volume? _payloadVolume;

  Payload_volume? get payloadVolume => _payloadVolume;

  Pressurized_capsule({
    Payload_volume? payloadVolume}){
    _payloadVolume = payloadVolume;
  }

  Pressurized_capsule.fromJson(dynamic json) {
    _payloadVolume = json["payload_volume"] != null ? Payload_volume.fromJson(json["payloadVolume"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_payloadVolume != null) {
      map["payload_volume"] = _payloadVolume!.toJson();
    }
    return map;
  }

}

class Payload_volume {
  int? _cubicMeters;
  int? _cubicFeet;

  int? get cubicMeters => _cubicMeters;
  int? get cubicFeet => _cubicFeet;

  Payload_volume({
    int? cubicMeters,
    int? cubicFeet}){
    _cubicMeters = cubicMeters;
    _cubicFeet = cubicFeet;
  }

  Payload_volume.fromJson(dynamic json) {
    _cubicMeters = json["cubic_meters"];
    _cubicFeet = json["cubic_feet"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["cubic_meters"] = _cubicMeters;
    map["cubic_feet"] = _cubicFeet;
    return map;
  }

}

class Return_payload_vol {
  int? _cubicMeters;
  int? _cubicFeet;

  int? get cubicMeters => _cubicMeters;
  int? get cubicFeet => _cubicFeet;

  Return_payload_vol({
    int? cubicMeters,
    int? cubicFeet}){
    _cubicMeters = cubicMeters;
    _cubicFeet = cubicFeet;
  }

  Return_payload_vol.fromJson(dynamic json) {
    _cubicMeters = json["cubic_meters"];
    _cubicFeet = json["cubic_feet"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["cubic_meters"] = _cubicMeters;
    map["cubic_feet"] = _cubicFeet;
    return map;
  }

}

class Return_payload_mass {
  int? _kg;
  int? _lb;

  int? get kg => _kg;
  int? get lb => _lb;

  Return_payload_mass({
    int? kg,
    int? lb}){
    _kg = kg;
    _lb = lb;
  }

  Return_payload_mass.fromJson(dynamic json) {
    _kg = json["kg"];
    _lb = json["lb"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["kg"] = _kg;
    map["lb"] = _lb;
    return map;
  }

}

class Launch_payload_vol {
  int? _cubicMeters;
  int? _cubicFeet;

  int? get cubicMeters => _cubicMeters;
  int? get cubicFeet => _cubicFeet;

  Launch_payload_vol({
    int? cubicMeters,
    int? cubicFeet}){
    _cubicMeters = cubicMeters;
    _cubicFeet = cubicFeet;
  }

  Launch_payload_vol.fromJson(dynamic json) {
    _cubicMeters = json["cubic_meters"];
    _cubicFeet = json["cubic_feet"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["cubic_meters"] = _cubicMeters;
    map["cubic_feet"] = _cubicFeet;
    return map;
  }

}

class Launch_payload_mass {
  int? _kg;
  int? _lb;

  int? get kg => _kg;
  int? get lb => _lb;

  Launch_payload_mass({
    int? kg,
    int? lb}){
    _kg = kg;
    _lb = lb;
  }

  Launch_payload_mass.fromJson(dynamic json) {
    _kg = json["kg"];
    _lb = json["lb"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["kg"] = _kg;
    map["lb"] = _lb;
    return map;
  }

}

class Heat_shield {
  String? _material;
  double? _sizeMeters;
  int? _tempDegrees;
  String? _devPartner;

  String? get material => _material;
  double? get sizeMeters => _sizeMeters;
  int? get tempDegrees => _tempDegrees;
  String? get devPartner => _devPartner;

  Heat_shield({
    String? material,
    double? sizeMeters,
    int? tempDegrees,
    String? devPartner}){
    _material = material;
    _sizeMeters = sizeMeters;
    _tempDegrees = tempDegrees;
    _devPartner = devPartner;
  }

  Heat_shield.fromJson(dynamic json) {
    // _material = json["material"];
    _sizeMeters = json["size_meters"];
    _tempDegrees = json["temp_degrees"];
    _devPartner = json["dev_partner"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["material"] = _material;
    map["size_meters"] = _sizeMeters;
    map["temp_degrees"] = _tempDegrees;
    map["dev_partner"] = _devPartner;
    return map;
  }

}





