import '../models/dmv_question.dart';

class DmvTestData {
  static List<DmvQuestion> getAllQuestions() {
    return [
      ..._getTrafficSignsQuestions(),
      ..._getRoadRulesQuestions(),
      ..._getSafetyQuestions(),
      ..._getParkingQuestions(),
      ..._getSignalsQuestions(),
    ];
  }

  static List<DmvQuestion> _getTrafficSignsQuestions() {
    return [
      DmvQuestion(
        category: 'signs',
        question: 'What does an octagonal (8-sided) sign indicate?',
        optionA: 'Yield',
        optionB: 'Stop',
        optionC: 'Warning',
        optionD: 'Do Not Enter',
        correctAnswer: 'B',
        explanation: 'An octagonal (8-sided) sign always means STOP. You must come to a complete stop at the stop line, crosswalk, or intersection, whichever you reach first.',
      ),
      DmvQuestion(
        category: 'signs',
        question: 'A triangular sign is typically used for:',
        optionA: 'Stop signs',
        optionB: 'Yield signs',
        optionC: 'Railroad crossings',
        optionD: 'School zones',
        correctAnswer: 'B',
        explanation: 'A triangular (3-sided) sign is used for YIELD signs. You must slow down and give right-of-way to traffic and pedestrians.',
      ),
      DmvQuestion(
        category: 'signs',
        question: 'What color are warning signs?',
        optionA: 'Red and white',
        optionB: 'Blue and white',
        optionC: 'Yellow and black',
        optionD: 'Green and white',
        correctAnswer: 'C',
        explanation: 'Warning signs are typically yellow with black text or symbols. They alert you to potential hazards ahead.',
      ),
      DmvQuestion(
        category: 'signs',
        question: 'A red circle with a red line through it means:',
        optionA: 'Yield',
        optionB: 'Caution',
        optionC: 'Prohibited/Not allowed',
        optionD: 'Merge',
        correctAnswer: 'C',
        explanation: 'A red circle with a red diagonal line through it indicates that something is prohibited or not allowed (e.g., no parking, no U-turn, no entry).',
      ),
      DmvQuestion(
        category: 'signs',
        question: 'What does a pentagon-shaped sign indicate?',
        optionA: 'Railroad crossing',
        optionB: 'School zone',
        optionC: 'Hospital zone',
        optionD: 'Construction zone',
        correctAnswer: 'B',
        explanation: 'A pentagon (5-sided) shaped sign indicates a school zone or school crossing. Exercise extra caution and watch for children.',
      ),
      DmvQuestion(
        category: 'signs',
        question: 'An orange sign typically indicates:',
        optionA: 'School zone',
        optionB: 'Construction or maintenance zone',
        optionC: 'No parking zone',
        optionD: 'Hospital zone',
        correctAnswer: 'B',
        explanation: 'Orange signs indicate construction, maintenance, or work zones. Slow down and watch for workers and equipment.',
      ),
      DmvQuestion(
        category: 'signs',
        question: 'What does a white rectangular sign typically indicate?',
        optionA: 'Warnings',
        optionB: 'Construction',
        optionC: 'Regulations and laws',
        optionD: 'Services',
        correctAnswer: 'C',
        explanation: 'White rectangular signs indicate regulations and laws, such as speed limits, parking rules, or traffic restrictions.',
      ),
      DmvQuestion(
        category: 'signs',
        question: 'A round yellow sign with an X and two Rs means:',
        optionA: 'Rest area ahead',
        optionB: 'Railroad crossing ahead',
        optionC: 'Road work ahead',
        optionD: 'Restricted area',
        correctAnswer: 'B',
        explanation: 'A round yellow sign with an "X" and two "R"s warns of a railroad crossing ahead. Slow down and be prepared to stop.',
      ),
    ];
  }

  static List<DmvQuestion> _getRoadRulesQuestions() {
    return [
      DmvQuestion(
        category: 'rules',
        question: 'At a four-way stop, who has the right-of-way?',
        optionA: 'The largest vehicle',
        optionB: 'The vehicle on the right',
        optionC: 'The first vehicle to arrive',
        optionD: 'The fastest vehicle',
        correctAnswer: 'C',
        explanation: 'At a four-way stop, the first vehicle to arrive at the intersection has the right-of-way. If two vehicles arrive at the same time, the vehicle on the right goes first.',
      ),
      DmvQuestion(
        category: 'rules',
        question: 'When can you pass a school bus with flashing red lights?',
        optionA: 'When there are no children visible',
        optionB: 'When you are running late',
        optionC: 'Never, until the lights stop flashing',
        optionD: 'When the bus driver waves you on',
        correctAnswer: 'C',
        explanation: 'You must never pass a school bus when its red lights are flashing. This means children are getting on or off the bus. Wait until the lights stop flashing before proceeding.',
      ),
      DmvQuestion(
        category: 'rules',
        question: 'The speed limit in a school zone when children are present is typically:',
        optionA: '15-25 mph',
        optionB: '30-35 mph',
        optionC: '40-45 mph',
        optionD: '50-55 mph',
        correctAnswer: 'A',
        explanation: 'School zone speed limits are typically 15-25 mph when children are present or when lights are flashing. Always watch for children and be prepared to stop.',
      ),
      DmvQuestion(
        category: 'rules',
        question: 'When must you use your headlights?',
        optionA: 'Only at night',
        optionB: 'From sunset to sunrise and in poor visibility',
        optionC: 'Only in rain',
        optionD: 'Only on highways',
        correctAnswer: 'B',
        explanation: 'You must use headlights from sunset to sunrise, and whenever visibility is poor due to weather conditions (rain, fog, snow) or any time you cannot see at least 1,000 feet ahead.',
      ),
      DmvQuestion(
        category: 'rules',
        question: 'What is the minimum following distance in good conditions?',
        optionA: '1 second',
        optionB: '2 seconds',
        optionC: '3 seconds',
        optionD: '5 seconds',
        correctAnswer: 'C',
        explanation: 'The minimum safe following distance is 3 seconds in good conditions. Increase this distance in bad weather, heavy traffic, or when following large vehicles.',
      ),
      DmvQuestion(
        category: 'rules',
        question: 'When approaching an intersection with a flashing yellow light, you should:',
        optionA: 'Stop completely',
        optionB: 'Speed up to clear the intersection',
        optionC: 'Slow down and proceed with caution',
        optionD: 'Treat it like a stop sign',
        correctAnswer: 'C',
        explanation: 'A flashing yellow light means slow down and proceed with caution. Check for cross traffic and pedestrians before proceeding through the intersection.',
      ),
      DmvQuestion(
        category: 'rules',
        question: 'When are you required to stop for a pedestrian?',
        optionA: 'Only at marked crosswalks',
        optionB: 'Only when they wave at you',
        optionC: 'At any crosswalk, marked or unmarked',
        optionD: 'Never, pedestrians must yield',
        correctAnswer: 'C',
        explanation: 'You must stop for pedestrians at any crosswalk, whether marked or unmarked. Pedestrians have the right-of-way at all crosswalks.',
      ),
      DmvQuestion(
        category: 'rules',
        question: 'When can you legally make a U-turn?',
        optionA: 'Anywhere you want',
        optionB: 'Only when safe and not prohibited by signs',
        optionC: 'Only on highways',
        optionD: 'Only in parking lots',
        correctAnswer: 'B',
        explanation: 'U-turns are legal only when they can be made safely and are not prohibited by signs. Never make a U-turn where you cannot see clearly in both directions.',
      ),
      DmvQuestion(
        category: 'rules',
        question: 'What should you do when an emergency vehicle with lights and sirens approaches?',
        optionA: 'Speed up to get out of the way',
        optionB: 'Stop immediately wherever you are',
        optionC: 'Pull to the right and stop',
        optionD: 'Continue at the same speed',
        correctAnswer: 'C',
        explanation: 'When an emergency vehicle with lights and sirens approaches, pull to the right side of the road and stop until it passes.',
      ),
      DmvQuestion(
        category: 'rules',
        question: 'In most states, you must dim your high beams within what distance of oncoming traffic?',
        optionA: '100 feet',
        optionB: '300 feet',
        optionC: '500 feet',
        optionD: '1000 feet',
        correctAnswer: 'C',
        explanation: 'You must dim your high beams within 500 feet of oncoming traffic and within 300 feet when following another vehicle.',
      ),
    ];
  }

  static List<DmvQuestion> _getSafetyQuestions() {
    return [
      DmvQuestion(
        category: 'safety',
        question: 'What is the safest action when you feel drowsy while driving?',
        optionA: 'Open the windows',
        optionB: 'Turn up the radio',
        optionC: 'Pull over and rest',
        optionD: 'Drink coffee',
        correctAnswer: 'C',
        explanation: 'The only safe solution for drowsy driving is to pull over in a safe location and rest. Opening windows or drinking coffee are only temporary solutions.',
      ),
      DmvQuestion(
        category: 'safety',
        question: 'Seat belts should be worn:',
        optionA: 'Only on highways',
        optionB: 'Only in the front seat',
        optionC: 'By all passengers at all times',
        optionD: 'Only on long trips',
        correctAnswer: 'C',
        explanation: 'Seat belts should be worn by all passengers in all seating positions at all times. This is the law in most states and the most effective way to prevent injury in a crash.',
      ),
      DmvQuestion(
        category: 'safety',
        question: 'What is the leading cause of fatal accidents?',
        optionA: 'Mechanical failure',
        optionB: 'Bad weather',
        optionC: 'Impaired/distracted driving',
        optionD: 'Poor road conditions',
        correctAnswer: 'C',
        explanation: 'Impaired driving (alcohol, drugs) and distracted driving (phone use, etc.) are the leading causes of fatal accidents.',
      ),
      DmvQuestion(
        category: 'safety',
        question: 'Children under what age/size must be in a proper child safety seat?',
        optionA: 'Under 4 years or 40 lbs',
        optionB: 'Under 8 years or 4\'9" tall',
        optionC: 'Under 10 years',
        optionD: 'Under 12 years',
        correctAnswer: 'B',
        explanation: 'Most states require children under 8 years old or under 4\'9" tall to be secured in an appropriate child safety seat or booster seat.',
      ),
      DmvQuestion(
        category: 'safety',
        question: 'What should you do if your brakes fail while driving?',
        optionA: 'Jump out of the vehicle',
        optionB: 'Pump the brakes and use emergency brake',
        optionC: 'Turn off the engine',
        optionD: 'Accelerate to find help',
        correctAnswer: 'B',
        explanation: 'If brakes fail, pump the brake pedal rapidly to build pressure. Shift to a lower gear and gradually apply the emergency brake while steering to a safe location.',
      ),
      DmvQuestion(
        category: 'safety',
        question: 'On a freeway, you should signal your intention to change lanes for:',
        optionA: 'At least 2 seconds before',
        optionB: 'At least 5 seconds before',
        optionC: 'Only if other cars are present',
        optionD: 'After you start changing lanes',
        correctAnswer: 'B',
        explanation: 'On a freeway, signal your intention to change lanes at least 5 seconds (100 feet) before making the lane change. This gives other drivers time to react.',
      ),
      DmvQuestion(
        category: 'safety',
        question: 'What is hydroplaning?',
        optionA: 'When your car overheats',
        optionB: 'When tires lose contact with the road due to water',
        optionC: 'When brakes overheat',
        optionD: 'When the engine stalls',
        correctAnswer: 'B',
        explanation: 'Hydroplaning occurs when tires lose contact with the road surface due to water buildup. If this happens, ease off the gas and steer straight until you regain traction.',
      ),
      DmvQuestion(
        category: 'safety',
        question: 'What is the proper hand position on the steering wheel?',
        optionA: '10 and 2 o\'clock',
        optionB: '9 and 3 o\'clock',
        optionC: '8 and 4 o\'clock',
        optionD: 'One hand at 12 o\'clock',
        correctAnswer: 'B',
        explanation: 'The recommended hand position is 9 and 3 o\'clock (or 8 and 4). This provides better control and reduces injury risk from airbag deployment.',
      ),
    ];
  }

  static List<DmvQuestion> _getParkingQuestions() {
    return [
      DmvQuestion(
        category: 'parking',
        question: 'When parking uphill with a curb, you should turn your wheels:',
        optionA: 'Away from the curb',
        optionB: 'Toward the curb',
        optionC: 'Straight',
        optionD: 'Either direction',
        correctAnswer: 'A',
        explanation: 'When parking uphill with a curb, turn your wheels away from the curb. If the car rolls back, it will hit the curb and stop.',
      ),
      DmvQuestion(
        category: 'parking',
        question: 'When parking downhill, you should turn your wheels:',
        optionA: 'Away from the curb',
        optionB: 'Toward the curb',
        optionC: 'Straight',
        optionD: 'Either direction',
        correctAnswer: 'B',
        explanation: 'When parking downhill, turn your wheels toward the curb. If the car rolls forward, the curb will stop it.',
      ),
      DmvQuestion(
        category: 'parking',
        question: 'You must not park within how many feet of a fire hydrant?',
        optionA: '5 feet',
        optionB: '10 feet',
        optionC: '15 feet',
        optionD: '20 feet',
        correctAnswer: 'C',
        explanation: 'You must not park within 15 feet of a fire hydrant. This ensures fire trucks can access the hydrant in an emergency.',
      ),
      DmvQuestion(
        category: 'parking',
        question: 'You cannot park within how many feet of a crosswalk?',
        optionA: '10 feet',
        optionB: '20 feet',
        optionC: '30 feet',
        optionD: '40 feet',
        correctAnswer: 'B',
        explanation: 'You cannot park within 20 feet of a crosswalk at an intersection. This ensures pedestrians are visible to other drivers.',
      ),
      DmvQuestion(
        category: 'parking',
        question: 'What color curb indicates no parking at any time?',
        optionA: 'Yellow',
        optionB: 'White',
        optionC: 'Red',
        optionD: 'Blue',
        correctAnswer: 'C',
        explanation: 'A red curb means no stopping, standing, or parking at any time. This is typically near fire hydrants or fire stations.',
      ),
      DmvQuestion(
        category: 'parking',
        question: 'A white curb marking typically means:',
        optionA: 'No parking',
        optionB: 'Passenger loading/unloading only',
        optionC: 'Commercial loading only',
        optionD: 'Disabled parking only',
        correctAnswer: 'B',
        explanation: 'A white curb indicates passenger loading and unloading zone only. You may stop only long enough to pick up or drop off passengers.',
      ),
      DmvQuestion(
        category: 'parking',
        question: 'A blue curb is reserved for:',
        optionA: 'Emergency vehicles',
        optionB: 'Disabled persons with proper permit',
        optionC: 'Commercial vehicles',
        optionD: 'Motorcycles only',
        correctAnswer: 'B',
        explanation: 'A blue curb indicates parking reserved for disabled persons with proper disabled parking permit or license plates.',
      ),
    ];
  }

  static List<DmvQuestion> _getSignalsQuestions() {
    return [
      DmvQuestion(
        category: 'signals',
        question: 'A red traffic light means:',
        optionA: 'Slow down',
        optionB: 'Stop, then proceed when safe',
        optionC: 'Stop completely and remain stopped',
        optionD: 'Yield to oncoming traffic',
        correctAnswer: 'C',
        explanation: 'A steady red light means stop completely and remain stopped until the light turns green. Do not proceed until the light changes.',
      ),
      DmvQuestion(
        category: 'signals',
        question: 'A flashing red light should be treated like:',
        optionA: 'A yield sign',
        optionB: 'A stop sign',
        optionC: 'A warning sign',
        optionD: 'A green light',
        correctAnswer: 'B',
        explanation: 'A flashing red light should be treated like a stop sign. Come to a complete stop, yield to traffic and pedestrians, then proceed when safe.',
      ),
      DmvQuestion(
        category: 'signals',
        question: 'A yellow traffic light means:',
        optionA: 'Speed up to clear the intersection',
        optionB: 'Stop if you can do so safely',
        optionC: 'Proceed with caution',
        optionD: 'The light is broken',
        correctAnswer: 'B',
        explanation: 'A yellow light means the light is about to turn red. Stop if you can do so safely. If you cannot stop safely, proceed with caution.',
      ),
      DmvQuestion(
        category: 'signals',
        question: 'What does a green arrow mean?',
        optionA: 'Yield to oncoming traffic',
        optionB: 'Protected turn in the direction of arrow',
        optionC: 'Caution, slow down',
        optionD: 'Emergency vehicles only',
        correctAnswer: 'B',
        explanation: 'A green arrow means you have a protected turn and may proceed in the direction of the arrow. Oncoming traffic is stopped by a red light.',
      ),
      DmvQuestion(
        category: 'signals',
        question: 'When can you turn right on red?',
        optionA: 'Never',
        optionB: 'Always',
        optionC: 'After stopping and yielding, if not prohibited',
        optionD: 'Only on highways',
        correctAnswer: 'C',
        explanation: 'In most states, you can turn right on red after coming to a complete stop and yielding to traffic and pedestrians, unless prohibited by a sign.',
      ),
      DmvQuestion(
        category: 'signals',
        question: 'A traffic light with a red X over a lane means:',
        optionA: 'Slow down in that lane',
        optionB: 'Do not drive in that lane',
        optionC: 'Yield in that lane',
        optionD: 'Carpool lane only',
        correctAnswer: 'B',
        explanation: 'A red X over a lane means you must not drive in that lane. It may be closed for construction or reserved for opposite-direction traffic.',
      ),
      DmvQuestion(
        category: 'signals',
        question: 'A green arrow and solid green light together mean:',
        optionA: 'Stop',
        optionB: 'Protected turn only',
        optionC: 'You may turn or go straight',
        optionD: 'Emergency vehicles have priority',
        correctAnswer: 'C',
        explanation: 'When both a green arrow and solid green light are displayed, you may either turn in the direction of the arrow (protected) or go straight.',
      ),
    ];
  }

  static List<DmvQuestion> getQuestionsByCategory(String category) {
    return getAllQuestions().where((q) => q.category == category).toList();
  }

  static List<String> getCategories() {
    return ['signs', 'rules', 'safety', 'parking', 'signals'];
  }

  static String getCategoryName(String category) {
    switch (category) {
      case 'signs':
        return 'Traffic Signs';
      case 'rules':
        return 'Road Rules';
      case 'safety':
        return 'Driving Safety';
      case 'parking':
        return 'Parking Rules';
      case 'signals':
        return 'Traffic Signals';
      default:
        return category;
    }
  }

  static String getCategoryIcon(String category) {
    switch (category) {
      case 'signs':
        return '🛑';
      case 'rules':
        return '📋';
      case 'safety':
        return '🦺';
      case 'parking':
        return '🅿️';
      case 'signals':
        return '🚦';
      default:
        return '📖';
    }
  }
}
