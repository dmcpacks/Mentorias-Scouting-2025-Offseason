
List<int> guess(int start, int end, int mid, int count, bool greater) {

  if(greater) {
    start = mid;
  } else {
    end = mid;
  }

  mid = ((start+end)/2).floor();
  count++;

  return [start, end, mid, count];

}