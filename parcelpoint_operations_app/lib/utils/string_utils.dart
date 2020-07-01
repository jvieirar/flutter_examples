// adds the slice method extension on String objects

extension StringProcessing on String {
  String slice([int start = 0, int end]) {
    if (this is! String) {
      return '';
    }

    int _realEnd;
    int _realStart = start < 0 ? this.length + start : start;
    if (end is! int) {
      _realEnd = this.length;
    } else {
      _realEnd = end < 0 ? this.length + end : end;
    }

    return this.substring(_realStart, _realEnd);
  }
}
