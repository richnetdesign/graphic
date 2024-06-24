import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:intl/intl.dart';

import '../data.dart';

final _monthDayFormat = DateFormat('MM-dd');

class LineAreaPointPage extends StatelessWidget {
  LineAreaPointPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Line and Area Mark'),
      ),
      backgroundColor: Colors.white,
      
      body: SingleChildScrollView(
        
        child: Center(
          child: Column(
            //width: MediaQuery()
            
            children: <Widget>[
              
              Container(
                width: 1000,
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                child: const Text(
                  'Smooth Line and Area chart',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- Line and area will break at NaN.',
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  '- A touch moving triggerd selection.',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 1350,
                height: 1300,
                child: Chart(
                  data: invalidData,
                  variables: {
                    'Date': Variable(
                      accessor: (Map map) => map['Date'] as String,
                      scale: OrdinalScale(tickCount: 10),
                    ),
                    'Close': Variable(
                      accessor: (Map map) =>
                          (map['Close'] ?? double.nan) as num,
                    ),
                  },
                  marks: [
                    AreaMark(
                      shape: ShapeEncode(value: BasicAreaShape(smooth: true)),
                      color: ColorEncode(
                          value: Defaults.colors10.first.withAlpha(80)),
                    ),
                    LineMark(
                      shape: ShapeEncode(value: BasicLineShape(smooth: true)),
                      size: SizeEncode(value: 0.5),
                    ),
                    
                  ],
                  axes: [
                    Defaults.horizontalAxis,
                    //efaults.verticalAxis,
                  ],
                  selections: {
                    'touchMove': PointSelection(
                      on: {
                        GestureType.scaleUpdate,
                        GestureType.tapDown,
                        GestureType.longPressMoveUpdate
                      },
                      dim: Dim.x,
                    )
                  },
                  tooltip: TooltipGuide(
                    followPointer: [false, true],
                    align: Alignment.topLeft,
                    offset: const Offset(-20, -20),
                  ),
                  //crosshair: CrosshairGuide(followPointer: [false, true]),
                ),
              ),
              
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 300,
                child: Chart(
                  data: const [65, 43, 22, 11],
                  variables: {
                    'value': Variable(
                      accessor: (num value) => value,
                      scale: LinearScale(min: 0),
                    ),
                  },
                  marks: [
                    PointMark(
                      position: Varset('value'),
                    )
                  ],
                  axes: [
                    Defaults.verticalAxis,
                  ],
                  coord: RectCoord(dimCount: 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
