

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

    //if (db_bbox['top'] < latitude && db_bbox['bottom'] > latitude && db_bbox['right'] > longitude && db_bbox['left'] < longitude)
      //desicions.add('deutschebahn');

    //if (rmv_bbox['top'] < latitude && rmv_bbox['bottom'] > latitude && rmv_bbox['right'] > longitude && rmv_bbox['left'] < longitude)
      desicions.add('rmv');

    print(desicions);
    return desicions;
  }
}