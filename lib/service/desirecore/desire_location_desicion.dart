

class DesireLocationDesicion {

  final double latitude;
  final double longitude;

  DesireLocationDesicion({this.latitude, this.longitude});

  Map<String, String> _bboxes = {
    'rmv': '50.97, 49.39, 7.76, 10.26',
    'deutschebahn': '54.93, 47.22, 5.88, 15.05'
  };

  Map<String, double> _getBbox(String transportholder) {
    var requested = _bboxes[transportholder].split(', ');

    Map<String, double> res = {
      'top':  double.parse(requested[0]),
      'bottom': double.parse(requested[1]),
      'right': double.parse(requested[2]),
      'left': double.parse(requested[3])
    };

    return res;
  }

  get desicion {
    List<String> desicions = [];
    var db_bbox = _getBbox('deutschebahn');
    var rmv_bbox = _getBbox('rmv');
    // Categorized with priorities

    if (db_bbox['top'] > longitude && db_bbox['bottom'] < longitude && db_bbox['right'] > latitude && db_bbox['left'] < latitude)
      desicions.add('deutschebahn');

    if (rmv_bbox['top'] > longitude && rmv_bbox['bottom'] < longitude && rmv_bbox['right'] > latitude && rmv_bbox['left'] < latitude)
      desicions.add('rmv');

    return desicions;
  }
}