import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userName = prefs.getString('ff_userName') ?? _userName;
    });
    _safeInit(() {
      _userId = prefs.getString('ff_userId') ?? _userId;
    });
    _safeInit(() {
      _sessionToken = prefs.getString('ff_sessionToken') ?? _sessionToken;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _userName = '';
  String get userName => _userName;
  set userName(String _value) {
    _userName = _value;
    prefs.setString('ff_userName', _value);
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String _value) {
    _userId = _value;
    prefs.setString('ff_userId', _value);
  }

  String _sessionToken = '';
  String get sessionToken => _sessionToken;
  set sessionToken(String _value) {
    _sessionToken = _value;
    prefs.setString('ff_sessionToken', _value);
  }

  List<dynamic> _resultTareas = [];
  List<dynamic> get resultTareas => _resultTareas;
  set resultTareas(List<dynamic> _value) {
    _resultTareas = _value;
  }

  void addToResultTareas(dynamic _value) {
    _resultTareas.add(_value);
  }

  void removeFromResultTareas(dynamic _value) {
    _resultTareas.remove(_value);
  }

  void removeAtIndexFromResultTareas(int _index) {
    _resultTareas.removeAt(_index);
  }

  void updateResultTareasAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _resultTareas[_index] = updateFn(_resultTareas[_index]);
  }

  void insertAtIndexInResultTareas(int _index, dynamic _value) {
    _resultTareas.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
