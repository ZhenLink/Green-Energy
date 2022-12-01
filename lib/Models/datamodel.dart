class DataModel {
  late String deviceID;
  late num watts;

  DataModel.fromJson(Map<String, dynamic> json)
      : deviceID = json['DeviceID'],
        watts = json['Watts'];

  Map<String, dynamic> toJson() => {"DeviceID": deviceID, "Watts": watts};
}
