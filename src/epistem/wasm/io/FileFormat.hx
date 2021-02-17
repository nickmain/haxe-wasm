// Copyright © 2021, David N Main. All rights reserved.
// Licensed under the MIT License, see LICENSE file for details.

package epistem.wasm.io;

final magic: Int = 0x6D736100;

enum abstract SectionId(Int) {
    var custom    = 0;
    var type      = 1;
    var import_   = 2;
    var function_ = 3;
    var table     = 4;
    var memory    = 5;
    var global    = 6;
    var export    = 7;
    var start     = 8;
    var element   = 9;
    var code      = 10;
    var data      = 11;
}