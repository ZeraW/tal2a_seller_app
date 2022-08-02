import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class Admin {
  String? id, name, email, password, userType;
  Admin({this.id, this.name, this.email, this.password, this.userType});

  factory Admin.fromJson(var json) => _$AdminFromJson(json);
  Map<String, dynamic> toJson() => _$AdminToJson(this);

}

@JsonSerializable()
class Client {
  String? id,
      name,
      companyName,
      email,
      password,
      userType,
      phone,
      phone2,
      cityId,
      areaId,
      address,
      billingCityId,
      billingAreaId,
      billingAddress;

  factory Client.fromJson(var json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);

  Client({
    this.id,
    this.name,
    this.email,
    this.companyName,

    this.password,
    this.userType,
    this.phone,
    this.phone2,
    this.cityId,
    this.areaId,
    this.address,
    this.billingCityId,
    this.billingAreaId,
    this.billingAddress,
  });
}

@JsonSerializable()
class Delivery {
  String? id,
      name,
      email,
      password,
      userType,
      phone,
      phone2,
      cityId,
      areaId,
      address,
      vehicle,
      nationalId;

  factory Delivery.fromJson(var json) => _$DeliveryFromJson(json);
  Map<String, dynamic> toJson() => _$DeliveryToJson(this);

  Delivery({
    this.id,
    this.name,
    this.email,
    this.password,
    this.userType,
    this.phone,
    this.phone2,
    this.cityId,
    this.areaId,
    this.address,
    this.vehicle,
    this.nationalId,
  });
}

@JsonSerializable()
class City {
  String? id, name;

  factory City.fromJson(var json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);

  City({
    this.id,
    this.name,
  });
}

@JsonSerializable()
class Area {
  String? id, name, cityId;

  factory Area.fromJson(var json) => _$AreaFromJson(json);
  Map<String, dynamic> toJson() => _$AreaToJson(this);

  Area({
    this.id,
    this.name,
    this.cityId,
  });
}

/*@JsonSerializable()
class Branch {
  String? id, name, cityId, areaId, phone, phone2;
  factory Branch.fromJson(var json) => _$BranchFromJson(json);
  Map<String, dynamic> toJson() => _$BranchToJson(this);

  Branch({
    this.id,
    this.name,
    this.cityId,
    this.areaId,
    this.phone,
    this.phone2,
  });
}*/

@JsonSerializable()
class Shipment {
  String? id,
      clientId,
      deliveryId,
      receiverName,
      receiverPhone1,
      receiverPhone2,
      cityFrom,
      areaFrom,
      cityTo,
      areaTo,
      addressTo,
      shipmentDetails,
      shipmentOn,
      notes;
      double? quantity,
      shippingPrice,
      shipmentPrice,
      discount,
      total;
      DateTime?  arrivalDate,
      deliveryDate,
      collectionDate,
      paymentDate;
  List<Tracking>? tracking;


  factory Shipment.fromJson(var json) => _$ShipmentFromJson(json);
  Map<String, dynamic> toJson() => _$ShipmentToJson(this);

  Shipment({
    this.id,
    this.clientId,
    this.deliveryId,
    this.receiverName,
    this.receiverPhone1,
    this.receiverPhone2,
    this.cityFrom,
    this.areaFrom,
    this.cityTo,
    this.areaTo,
    this.addressTo,
    this.shipmentDetails,
    this.shipmentOn,
    this.notes,
    this.quantity,
    this.shippingPrice,
    this.shipmentPrice,
    this.discount,
    this.total,
    this.arrivalDate,
    this.deliveryDate,
    this.collectionDate,
    this.paymentDate,
    this.tracking,
  });
}

@JsonSerializable()
class Tracking {
  DateTime? dateTime;
  String? code, details;


  factory Tracking.fromJson(var json) => _$TrackingFromJson(json);
  Map<String, dynamic> toJson() => _$TrackingToJson(this);

  Tracking({
    this.dateTime,
    this.code,
    this.details,
  });
}

@JsonSerializable()
class Location {
  Map<String,City>? allCities;
  Map<String,Area>? allAreas;

  Location({
    this.allCities,
    this.allAreas,
  });

  factory Location.fromJson(var json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);

}

@JsonSerializable()
class AllAdmins {
  Map<String,Admin>? allAdmins;

  AllAdmins({
    this.allAdmins,
  });
  factory AllAdmins.fromJson(var json) => _$AllAdminsFromJson(json);
  Map<String, dynamic> toJson() => _$AllAdminsToJson(this);

}

@JsonSerializable()
class AllClients {
  Map<String,Client>? allClients;

  AllClients({
    this.allClients,
  });
  factory AllClients.fromJson(var json) => _$AllClientsFromJson(json);
  Map<String, dynamic> toJson() => _$AllClientsToJson(this);

}

@JsonSerializable()
class AllDelivery {
  Map<String,Delivery>? allDelivery;

  AllDelivery({
    this.allDelivery,
  });
  factory AllDelivery.fromJson(var json) => _$AllDeliveryFromJson(json);
  Map<String, dynamic> toJson() => _$AllDeliveryToJson(this);

}