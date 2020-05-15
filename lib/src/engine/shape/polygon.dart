import 'dart:ui' show Path;

import '../cfg.dart' show Cfg;
import '../attrs.dart' show Attrs;
import '../shape.dart' show Shape;

class Polygon extends Shape {
  Polygon(Cfg cfg) : super(cfg);

  @override
  Cfg get defaultCfg => super.defaultCfg
    ..type = 'polygon';
  
  @override
  Attrs get defaultAttrs => super.defaultAttrs
    ..strokeWidth = 0;
  
  @override
  void createPath(Path path) {
    final points = attrs.points;

    if (points == null || points.isEmpty) {
      return;
    }

    path.moveTo(points.first.dx, points.first.dy);
    for (var i = 1; i < points.length; i++) {
      final point = points[i];
      path.lineTo(point.dx, point.dy);
    }
    path.close();
  }
}
