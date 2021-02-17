// Copyright © 2021, David N Main. All rights reserved.
// Licensed under the MIT License, see LICENSE file for details.

package epistem.wasm.io;

import epistem.wasm.io.FileFormat.magic;
import haxe.io.Output;

class BinaryWriter {
    final out: Output;

    public function new(output: Output) {
        this.output = output;
        out.bigEndian = false;
    }

    public function writeModule(module: Module) {
        out.writeInt32(magic);
        out.writeInt32(module.version);
    }
}