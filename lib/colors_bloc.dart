import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvents { toAmber, toBlue }

class ColorBloc {
  Color _color = Colors.amber; // Variabel untuk menyimpan state color

  // Controller untuk event
  final StreamController<ColorEvents> _eventController =
      StreamController<ColorEvents>();
  StreamSink<ColorEvents> get eventSink => _eventController.sink;

  // Controller untk state
  final StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;

  Stream<Color> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEvents colorEvents) {
    if (colorEvents == ColorEvents.toAmber) {
      _color = Colors.amber;
    } else {
      _color = Colors.blue;
    }

    _stateSink.add(_color);
  }

  // Kendali untuk melakukan perubahan pada color
  ColorBloc() {
    _eventController.stream.listen((_mapEventToState));
  }

  // Membuang even dari memori
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
