import haxe.io.BytesInput;
import haxe.io.Bytes;
import epistem.wasm.io.BinaryReader;

class Main {
    public static function main() {
        trace("Hello World");

        final testModuleData = [
            0,97,115,109,1,0,0,0,1,133,128,128,128,0,1,96,0,1,
            127,3,130,128,128,128,0,1,0,4,132,128,128,128,0,1,
            112,0,0,5,131,128,128,128,0,1,0,1,6,129,128,128,
            128,0,0,7,146,128,128,128,0,2,6,109,101,109,111,
            114,121,2,0,5,104,101,108,108,111,0,0,10,138,128,
            128,128,0,1,132,128,128,128,0,0,65,16,11,11,146,
            128,128,128,0,1,0,65,16,11,12,72,101,108,108,111,
            32,87,111,114,108,100,0
        ];
        
        final bytes = Bytes.alloc(testModuleData.length);
        for(i in 0...testModuleData.length) bytes.set(i, testModuleData[i]);

        final input = new BytesInput(bytes);
        final reader = new BinaryReader(input);
        final module = reader.readModule();
        trace('Module version = ${module.version}');
    }
}