class ApplianceAssessment {
  late double totalApplianceLoad;
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
  static const int printersLoad = 50; //in watts
  static const int hairdryersLoad = 1500; //in watts
  static const int hairshaverload = 500; //in watts
  static const int iornsLoad = 2000; //in watts
  static const int electricFanLoad = 2000; //in watts

  var applianceAssessmentQuestions = [
    {
      "Question": "what type of lights do you use?",
      "Answer": "",
      "Appliance-Category": "Lighting",
    },
    {
      "Question": "How many lights do you have?",
      "Answer": "",
      "Appliance-Category": "Lighting",
    },
    {
      "Question": "",
      "Answer": "",
      "Appliance-Category": "Lighting",
    },
    {
      "Question": "",
      "Answer": "",
      "Appliance-Category": "Cooking",
      "total-load": 0
    },
    {
      "Question": "",
      "Answer": "",
      "Appliance-Category": "Cooking",
    },
    {
      "Question": "",
      "Answer": "",
      "Appliance-Category": "Cooking",
    },
    {
      "Question": "",
      "Answer": "",
      "Appliance-Category": "Electronics",
    },
    {
      "Question": "",
      "Answer": "",
      "Appliance-Category": "Electronics",
    },
    {
      "Question": "",
      "Answer": "",
      "Appliance-Category": "Electronics",
    },
  ];
}
