import 'package:get/get_connect/http/src/response/response.dart';
import 'package:gns_app/Api/api.dart';

class ApplianceAssessment {
  static const int energySaverLoad = 20; //in watts
  static const int normalBulbsLoad = 100; //in watts
  static const int ledScreensLoad = 144; //in watts
  static const int mobilePhonesLoad = 10; //in watts
  static const int soundSystemsLoad = 315; //in watts
  static const int airconLoad = 1000; //in watts
  static const int laptopsLoad = 100; //in watts
  static const int fridgesLoad = 400; //in watts
  static const int cookersLoad = 3000; //in watts
  static const int microwavesLoad = 600; //in watts
  static const int toastersLoad = 600; //in watts
  static const int blendersLoad = 400; //in watts
  static const int printersLoad = 50; //in watts
  static const int hairdryersLoad = 1500; //in watts
  static const int hairshaverload = 500; //in watts
  static const int ironsLoad = 2000; //in watts
  static const int electricFanLoad = 2000; //in watts
  Response? _response;

  int totalApplianceLoad = 0;
  int totalLightingLoad = 0;
  int electronicsLoad = 0;
  int cookingLoad = 0;
  String bulbType = "";
  int lightingHours = 0;
  int electronicsHours = 0;
  List selectedEletronics = [];
  List electronicsValue = [];

  int kitchenCookingLoad = 0;

  // electronics deconstruction

  List electronicAccessories = [];
  String response = '';
  var electronicsCount;

  createAssessment(data, String user, residentialLocation) async {
    Map<String, dynamic> assessment = {
      "User": user,
      "Location": residentialLocation,
      "Assessment": data
    };
    _response =
        await MyAPI().createAssessment(assessment, '/appliance/assessments');
    if (_response!.statusCode == 201) {
      print('completed');
    } else if (_response!.statusCode == 404 || _response!.statusCode == 400) {
      print('cannot find the url given');
    } else {
      print('internal server check your configurations');
    }
  }

  /// manage assessment handling
  void assessmentManager(List assessmentData, List categories) {
    List asessmentsCompleted = [];
    var locationCoordinates = categories[1];
    List chosenApplianceCategories = categories[0];
    if (chosenApplianceCategories.isNotEmpty) {
      for (var i = 0; i < chosenApplianceCategories.length; i++) {
        if (chosenApplianceCategories[i] == "Electronics") {
          // implement manage electronics assessment
          var electronicsdata = manageElectronicsAssessment(assessmentData);
          if (electronicsdata != null) {
            asessmentsCompleted.add(electronicsdata);
          }
        } else if (chosenApplianceCategories[i] == "Lighting") {
          // implement manage lighting assessment
          var lightsdata = manageLightingAssessment(assessmentData);
          if (lightsdata != null) {
            asessmentsCompleted.add(lightsdata);
          }
        } else if (chosenApplianceCategories[i] == "Cooking/ Kitchen") {
          // implement manage cooking/ kitchen assessment
          var cookingdata = manageCookingLoad(assessmentData);
          if (cookingdata != null) {
            asessmentsCompleted.add(cookingdata);
          }
        } else {
          // ignore: avoid_print
          print('No matches found');
        }
      }
      createAssessment(
          asessmentsCompleted, "Noel Phiri", locationCoordinates.toString());
    }
  }

// manage cooking and kitchen Load
  manageCookingLoad(List assessmentData) {
    List kitchenData = [];
    List appliances = [];
    List selectedAppliances = [];
    List appliancesValue = [];
    late String durationOfUsage = '';
    for (var i = 0; i < assessmentData.length; i++) {
      if (assessmentData[i]['Category'] == 'Cooking/ Kitchen') {
        // getting selected cooking/ kitchen utilities
        if (assessmentData[i]['Id'] == "636243aa034a7e86cd9ba9c8") {
          String response = assessmentData[i]['Answer'];
          selectedAppliances = response.split(',');
        }
        // getting utility run time hours
        else if (assessmentData[i]['Id'] == "63624407034a7e86cd9ba9ca") {
          durationOfUsage = assessmentData[i]['Answer'];
        }
        //getting selected cooking/ kitchen utilities count
        else if (assessmentData[i]['Id'] == "63624421034a7e86cd9ba9cc") {
          String response = assessmentData[i]['Answer'];
          appliances = response.split(' ');
          for (var i = 0; i < appliances.length; i++) {
            if (i % 2 == 0) {
              appliancesValue.add({
                "Appliance": appliances[i],
                "value": appliances[i + 1],
              });
            }
          }
        }
      }
    }
    kitchenData.add({
      "Appliances-Used": selectedAppliances,
      "Appliance-count": appliancesValue,
      "UsageHours": durationOfUsage
    });

    return kitchenData;
  }

//manage lighting appliance assessment
  manageLightingAssessment(List assessmentData) {
    List lightingData = [];
    late String lightscount = "";
    late String durationOfUsage = '';

    for (var i = 0; i < assessmentData.length; i++) {
      if (assessmentData[i]['Category'] == 'Lighting') {
        if (assessmentData[i]['Id'] == "636241f2034a7e86cd9ba9c2") {
          //getting lights type
          bulbType = assessmentData[i]['Answer'];
        } //getting the number of bulbs clients use

        else if (assessmentData[i]['Id'] == "63624361034a7e86cd9ba9c4") {
          lightscount = assessmentData[i]['Answer'];
        }
        //getting the number of hours the hours lights stay on
        else if (assessmentData[i]['Id'] == "63624379034a7e86cd9ba9c6") {
          durationOfUsage = assessmentData[i]['Answer'];
        }
      }
    }

    lightingData.add({
      "BulbType": bulbType,
      "LightsCount": lightscount,
      "LightingHours": durationOfUsage
    });
    return lightingData;
  }

  // total electronics appliance load
  manageElectronicsAssessment(List assessmentData) {
    List electronicsData = [];
    late String durationOfUsage = '';

    for (var i = 0; i < assessmentData.length; i++) {
      //getting the devices selected by user
      if (assessmentData[i]['Id'] == "63624451034a7e86cd9ba9ce") {
        String response = assessmentData[i]['Answer'];
        electronicAccessories = response.split(',');
      }
      //getting the number of hours the devices runs
      else if (assessmentData[i]['Id'] == '636244b8034a7e86cd9ba9d0') {
        durationOfUsage = assessmentData[i]['Answer'];
      }
      //getting the number of devices selected
      else if (assessmentData[i]['Id'] == '63624586034a7e86cd9ba9d2') {
        response = assessmentData[i]['Answer'];
        electronicsCount = response.split(' ');
        for (var i = 0; i < electronicsCount.length; i++) {
          if (i % 2 == 0) {
            electronicsValue.add({
              "Appliance": electronicsCount[i],
              "value": electronicsCount[i + 1],
            });
          }
        }
      }
    }

    electronicsData.add({
      "Devices-Used": electronicAccessories,
      "Device-count": electronicsValue,
      "UsageHours": durationOfUsage
    });

    return electronicsData;
  }
}
