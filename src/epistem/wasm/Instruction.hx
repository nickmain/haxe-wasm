// Copyright © 2021, David N Main. All rights reserved.
// Licensed under the MIT License, see LICENSE file for details.

package epistem.wasm;

// The Wasm instruction set
enum Instruction {
    unreachable; // cause a trap
    nop;         // no-op
    block;
    loop;
    if_;
    else_;
    end;
    br;
    br_if;
    br_table;
    return_;
    call;
    call_indirect;

    drop;    // [a] -> []
    select;  // [a:i32, b, c] -> if a==0 [b] else [c]

}