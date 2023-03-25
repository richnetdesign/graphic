import 'dart:async';
import 'dart:ui';

import 'package:graphic/src/dataflow/tuple.dart';
import 'package:graphic/src/encode/color.dart';
import 'package:graphic/src/encode/elevation.dart';
import 'package:graphic/src/encode/gradient.dart';
import 'package:graphic/src/encode/label.dart';
import 'package:graphic/src/algebra/varset.dart';
import 'package:graphic/src/encode/shape.dart';
import 'package:graphic/src/encode/size.dart';
import 'package:graphic/src/graffiti/transition.dart';
import 'package:graphic/src/interaction/selection/selection.dart';
import 'package:graphic/src/shape/point.dart';

import 'function.dart';
import 'modifier/modifier.dart';
import 'mark.dart';

/// The specification of a point mark.
///
/// A point graphing produces a set of geometric points.
///
/// It will check and complete position points by the rule of:
///
/// ```
/// [point] => [point]
/// ```
class PointMark extends FunctionMark<PointShape> {
  /// Creates a point mark.
  PointMark({
    ColorEncode? color,
    ElevationEncode? elevation,
    GradientEncode? gradient,
    LabelEncode? label,
    Varset? position,
    ShapeEncode<PointShape>? shape,
    SizeEncode? size,
    List<Modifier>? modifiers,
    int? layer,
    Selected? selected,
    StreamController<Selected?>? selectionStream,
    Transition? transition,
    MarkEntrance? entrance,
    String? Function(Tuple)? tag,
  }) : super(
          color: color,
          elevation: elevation,
          gradient: gradient,
          label: label,
          position: position,
          shape: shape,
          size: size,
          modifiers: modifiers,
          layer: layer,
          selected: selected,
          selectionStream: selectionStream,
          transition: transition,
          entrance: entrance,
          tag: tag,
        );
}

/// The position completer of the point mark.
///
/// It will check and complete position points by the rule of:
///
/// ```
/// [point] => [point]
/// ```
List<Offset> pointCompleter(List<Offset> position, Offset origin) {
  assert(position.length == 1);
  return position;
}
