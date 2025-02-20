import 'dart:convert';

class homeModel {
  bool? status;
  int? statusCode;
  String? msg;
  List<Data>? data;

  homeModel({this.status, this.statusCode, this.msg, this.data});

  homeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  int? driverId;
  int? vehicleId;
  String? rideTime;
  String? pickupLocation;
  String? dropoffLocation;
  String? sourceLat;
  String? sourceLang;
  String? destinationLat;
  String? destinationLang;
  int? aceptedDriver;
  String? acceptedDate;
  String? distance;
  String? totalAmount;
  String? baseFare;
  String? pricePerKm;
  String? paymentMode;
  int? paymentStatus;
  String? paymentDate;
  String? status;
  Null? cancelBy;
  Null? cancelDate;
  String? completedDate;
  String? createdAt;
  String? updatedAt;
  int? isDeleted;
  String? userName;

  Data(
      {this.id,
      this.userId,
      this.driverId,
      this.vehicleId,
      this.rideTime,
      this.pickupLocation,
      this.dropoffLocation,
      this.sourceLat,
      this.sourceLang,
      this.destinationLat,
      this.destinationLang,
      this.aceptedDriver,
      this.acceptedDate,
      this.distance,
      this.totalAmount,
      this.baseFare,
      this.pricePerKm,
      this.paymentMode,
      this.paymentStatus,
      this.paymentDate,
      this.status,
      this.cancelBy,
      this.cancelDate,
      this.completedDate,
      this.createdAt,
      this.updatedAt,
      this.isDeleted,
      this.userName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    driverId = json['driver_id'];
    vehicleId = json['vehicle_id'];
    rideTime = json['ride_time'];
    pickupLocation = json['pickup_location'];
    dropoffLocation = json['dropoff_location'];
    sourceLat = json['source_lat'];
    sourceLang = json['source_lang'];
    destinationLat = json['destination_lat'];
    destinationLang = json['destination_lang'];
    aceptedDriver = json['acepted_driver'];
    acceptedDate = json['accepted_date'];
    distance = json['distance'];
    totalAmount = json['total_amount'];
    baseFare = json['base_fare'];
    pricePerKm = json['price_per_km'];
    paymentMode = json['payment_mode'];
    paymentStatus = json['payment_status'];
    paymentDate = json['payment_date'];
    status = json['status'];
    cancelBy = json['cancel_by'];
    cancelDate = json['cancel_date'];
    completedDate = json['completed_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isDeleted = json['is_deleted'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['driver_id'] = this.driverId;
    data['vehicle_id'] = this.vehicleId;
    data['ride_time'] = this.rideTime;
    data['pickup_location'] = this.pickupLocation;
    data['dropoff_location'] = this.dropoffLocation;
    data['source_lat'] = this.sourceLat;
    data['source_lang'] = this.sourceLang;
    data['destination_lat'] = this.destinationLat;
    data['destination_lang'] = this.destinationLang;
    data['acepted_driver'] = this.aceptedDriver;
    data['accepted_date'] = this.acceptedDate;
    data['distance'] = this.distance;
    data['total_amount'] = this.totalAmount;
    data['base_fare'] = this.baseFare;
    data['price_per_km'] = this.pricePerKm;
    data['payment_mode'] = this.paymentMode;
    data['payment_status'] = this.paymentStatus;
    data['payment_date'] = this.paymentDate;
    data['status'] = this.status;
    data['cancel_by'] = this.cancelBy;
    data['cancel_date'] = this.cancelDate;
    data['completed_date'] = this.completedDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_deleted'] = this.isDeleted;
    data['user_name'] = this.userName;
    return data;
  }
}
