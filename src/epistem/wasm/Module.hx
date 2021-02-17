// Copyright © 2021, David N Main. All rights reserved.
// Licensed under the MIT License, see LICENSE file for details.

package epistem.wasm;

import haxe.io.Bytes;

typedef Custom = {name: String, data: Bytes} 

class Module {
    public var version: Int;

    public final customs = Array<Custom>();

    public function new() {}
}