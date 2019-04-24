
// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:secozy/bloc/tabs/tab.dart';

class TabBloc extends Bloc<TabEvent, TabState> {

  @override
  TabState get initialState => TabChangeIndex(index: 0);

  @override
  Stream<TabState> mapEventToState(TabEvent event) async* {
    if (event is TabIndexPressed) {
      yield TabChangeIndex(index: event.index);
    }
  }
}