import 'dart:math';

class RandomNumbers{

  List<int> generateRandomNumbers(){
    List<int> numbers = new List();
    var rng = new Random();
    for(int i =0; i<200; i++){
      int randomNumber  = rng.nextInt(300);
      numbers.add(randomNumber);
    }
    return numbers;
  }
}