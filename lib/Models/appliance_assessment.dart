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
  static const int toastersLoad = 600; //in watts
  static const int blendersLoad = 400; //in watts
  static const int printersLoad = 50; //in watts
  static const int hairdryersLoad = 1500; //in watts
  static const int hairshaverload = 500; //in watts
  static const int ironsLoad = 2000; //in watts
  static const int electricFanLoad = 2000; //in watts

  var applianceAssessmentQuestions = [
    {
      "Question":
          "what type of lights do you use? e.g. Energy saver, normal etc",
      "Appliance-Category": "Lighting",
    },
    {
      "Question": "How many lights do you have?",
      "Appliance-Category": "Lighting",
    },
    {
      "Question": "Approximately, How many hours do they stay on?",
      "Appliance-Category": "Lighting",
    },
    {
      "Question": "What cooking utilities do you use? e.g. Cooker, Fridge etc",
      "Appliance-Category": "Cooking/ Kitchen",
    },
    {
      "Question": "Approximately, How many hours do they stay on?",
      "Appliance-Category": "Cooking/ Kitchen",
    },
    {
      "Question":
          "How many do you have per cooking utility e.g. Cooker = 2, etc",
      "Appliance-Category": "Cooking/ Kitchen",
    },
    {
      "Question":
          "What Electronic devices do you use? e.g. Phones, Laptops etc",
      "Appliance-Category": "Electronics",
    },
    {
      "Question": "Approximately, How many hours do they stay on?",
      "Appliance-Category": "Electronics",
    },
    {
      "Question": "How many do you have per device e.g. laptops = 2, etc",
      "Appliance-Category": "Electronics",
    },
    {
      "Question":
          "What other house accessories do you use? e.g. Fans, Irons etc ",
      "Appliance-Category": "House Accessories",
    },
    {
      "Question": "How many do you have per device e.g. Irons = 2, etc",
      "Appliance-Category": "House Accessories",
    },
  ];
}
