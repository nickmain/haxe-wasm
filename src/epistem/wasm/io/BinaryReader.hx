// Copyright © 2021, David N Main. All rights reserved.
// Licensed under the MIT License, see LICENSE file for details.

package epistem.wasm.io;

import haxe.io.Input;
import epistem.wasm.Module;

enum Error {
    badMagic;
}

class BinaryReader {
    final input: Input;

    public var ignoreCustomSections = false;

    public function new(input: Input) {
        this.input = input;
        input.bigEndian = false;
    }

    public function readModule(): Module {
        final module = new Module();
        if(input.readInt32() != FileFormat.magic) throw Error.badMagic;

        module.version = input.readInt32();


        return module;
    }

    function readCustom(): Custom {
        final size = readUInt_LEB128();
        final data = input.read(size);

        final name = readName

    }

    function readUInt_LEB128(): Int {
        final b1 = input.readByte();
        if(b1 < 128) return b1;
        final b2 = input.readByte();
        if(b2 < 128) return (b2 << 7) + b1;
        final b3 = input.readByte();
        if(b3 < 128) return (b3 << 14) + (b2 << 7) + b1;
        final b4 = input.readByte();
        return (b4 << 21) + (b3 << 14) + (b2 << 7) + b1;
    }

    function readInt_LEB128(): Int {
        var n = readUInt_LEB128();
        n = n - 1;
        n = n ^ 0xffffffff;
        return n;
    }

    function readName(): String {
        final length = readUInt_LEB128();
        final bytes = input.read(length);
        return bytes.getString(0, length);
    }
}