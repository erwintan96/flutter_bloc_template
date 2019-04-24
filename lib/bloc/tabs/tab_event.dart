// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class TabEvent extends Equatable {
  TabEvent([List props = const []]) : super(props);
}

class TabIndexPressed extends TabEvent {
  final int index;

  TabIndexPressed({this.index}) : super([index]);

  @override
  String toString() => 'TabIndexPressed { index: $index }';
}