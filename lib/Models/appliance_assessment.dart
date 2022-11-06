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

  int totalApplianceLoad = 0;
  int totalLightingLoad = 0;
  int electronicsLoad = 0;
  int cookingLoad = 0;
  String bulbType = "";
  int lightingHours = 0;
  int electronicsHours = 0;
  List selectedEletronics = [];

  int kitchenCookingLoad = 0;

  // calculating total appliance load
  //decomposed to utility based load and combine them

  void calculateApplianceLoad(List assessmentData) {
    for (var i = 0; i < assessmentData.length; i++) {
      if (assessmentData[i]['Category'] == 'Lighting') {
        if (assessmentData[i]['Id'] == "636241f2034a7e86cd9ba9c2") {
          bulbType = assessmentData[i]['Answer'];
          if (bulbType == 'energy saver') {
            totalLightingLoad += energySaverLoad;
          } else {
            totalLightingLoad += normalBulbsLoad;
          }
        } else if (assessmentData[i]['Id'] == "63624361034a7e86cd9ba9c4") {
          var response = assessmentData[i]['Answer'];
          if (bulbType == 'energy saver') {
            int lightsQuantityLoad = energySaverLoad * int.parse(response);
            totalLightingLoad = lightsQuantityLoad;
          } else {
            int lightsQuantityLoad = normalBulbsLoad * int.parse(response);
            totalLightingLoad = lightsQuantityLoad;
          }
        } else if (assessmentData[i]['Id'] == "63624379034a7e86cd9ba9c6") {
          var response = assessmentData[i]['Answer'];
          if (bulbType == 'energy saver'.toLowerCase()) {
            lightingHours += int.parse(response);
          } else {
            lightingHours += int.parse(response);
          }
        }
      } else if (assessmentData[i]['Category'] == 'Electronics') {
        if (assessmentData[i]['Id'] == "63624451034a7e86cd9ba9ce") {
          String response = assessmentData[i]['Answer'];
          var electronicAccessories = response.split(',');
          for (var j = 0; j < electronicAccessories.length; j++) {
            if (electronicAccessories[j] == 'phones' ||
                electronicAccessories[j] == 'phone') {
              selectedEletronics.add('phone');
            } else if (electronicAccessories[j] == 'laptops' ||
                electronicAccessories[j] == 'laptop') {
              selectedEletronics.add('laptops');
            } else if (electronicAccessories[j] == 'tv' ||
                electronicAccessories[j] == 'plasma') {
              selectedEletronics.add('Tv');
            } else if (electronicAccessories[j] == 'printers' ||
                electronicAccessories[j] == 'printer') {
              selectedEletronics.add('printer');
            } else if (electronicAccessories[j] == 'sound system' ||
                electronicAccessories[j] == 'home theater' ||
                electronicAccessories[j] == 'sound bar') {
              selectedEletronics.add('sound system');
            }
          }
        } else if (assessmentData[i]['Id'] == '636244b8034a7e86cd9ba9d0') {
          var response = assessmentData[i]['Answer'];
          electronicsHours += int.parse(response);
        } else if (assessmentData[i]['Id'] == '63624586034a7e86cd9ba9d2') {
          if (selectedEletronics.isNotEmpty) {
            String response = assessmentData[i]['Answer'];
            var electronicsCount = response.split(',');
            for (var k = 0; k < electronicsCount.length; k++) {
              if (electronicsCount[k] == "phones = 2" ||
                  electronicsCount[k] == "phones = 2") {
              } else {}
            }
          } else {
            print('There are no any selected Eletronics');
          }
        }
      } else if (assessmentData[i]['Category'] == 'Cooking/ Kitchen') {
      } else if (assessmentData[i]['Category'] == 'House Accessories') {}
    }
    // print(totalLightingLoad);
  }
}
