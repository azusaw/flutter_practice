import 'package:flutter/material.dart';
import 'package:flutter_sample/models/event.dart';

class EventViewModel with ChangeNotifier {
  EventViewModel({@required this.event});

  Event event;

  void setName(String name) {
    event.name = name;
  }

  void setDate(DateTime date) {
    event.date = date;
  }
}

class EventListViewModel with ChangeNotifier {
  EventListViewModel({
    @required this.eventList,
  });

  List<Event> eventList;

  void add(Event event) {
    eventList.add(event);
    notifyListeners();
  }

  void delete(int index) {
    eventList.removeAt(index);
    notifyListeners();
  }
}
