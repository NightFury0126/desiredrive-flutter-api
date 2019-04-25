import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:desiredrive_api_flutter/constants/dbconstants.dart';
import 'package:desiredrive_api_flutter/service/intelligent_query/query_lists.dart';
import 'package:desiredrive_api_flutter/service/intelligent_query/query_save.dart';

class DesireQuery {

  DesireQuerySave _querySave = new DesireQuerySave();

  Future<String> query(String query) async {
    return _querySave.readLastSearch().then((res) {
      var preparedQuery;

      if (res != null && res.contains(query)) {
        preparedQuery = res;
      } else {
        preparedQuery = _marketingQuery(query);

        if (preparedQuery == query) {
          preparedQuery = _preferredCityQuery(query);
        }

        _querySave.saveLastSearch(preparedQuery);
      }

      return preparedQuery;
    });
  }

  String _marketingQuery(String query) {
    var result = query;
    var found = false;
    if (result.length >= 2 && result.length <= 5) {
      for (var city in DesireQueryLists.marketingList) {
        if (found)
          break;

        var first = city.split(' ');

        if (first[0].contains(query)) {
          result = city;
          found = true;
        }
      }
    }
    return result;
  }

  String _preferredCityQuery(String query) {
    var result = query;
    var found = false;
    if (result.length > 2) {
      for (var city in DesireQueryLists.cityList) {
        if (found)
          break;

        var first = city.split(' ');

        if (first[0].contains(query)) {
          result = city;
          found = true;
        }
      }
    }
    return result;
  }

}