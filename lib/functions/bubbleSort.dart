class BubbleSort{

  sortingNumbers(List<int> numbersList){
    List tmpList = numbersList;
    bool swap = false;

    for(int i =0; i<numbersList.length-1; i++){
      if(tmpList[i] > tmpList[i+1]){
        int tmp = tmpList[i+1];
        tmpList[i+1] = tmpList[i];
        tmpList[i] = tmp;
        swap = true;
      }
    }

    if(swap){
      sortingNumbers(tmpList);
    } else{
      print('posortowano');
      tmpList.forEach((element) {print(element);});
    }
  }

}