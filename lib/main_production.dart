// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:movie_app/app/app.dart';
import 'package:movie_app/bootstrap.dart';
import 'package:movie_app/env/flavor.dart';

void main() {
  bootstrap(() => const App(), FlavorSetting.production());
}
