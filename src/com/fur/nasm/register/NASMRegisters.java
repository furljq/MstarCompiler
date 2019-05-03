package com.fur.nasm.register;

import com.fur.intermediateRepresentation.IRRegister;

import java.util.ArrayList;
import java.util.List;

public class NASMRegisters {

    private List<NASMRegister> registers;

    public NASMRegisters() {
        registers = new ArrayList<>();
        registers.add(new NASMRegister("rax"));
        registers.add(new NASMRegister("rcx"));
        registers.add(new NASMRegister("rdx"));
        registers.add(new NASMRegister("rbx"));
        registers.add(new NASMRegister("rsi"));
        registers.add(new NASMRegister("rdi"));
        registers.add(new NASMRegister("rsp"));
        registers.add(new NASMRegister("rbp"));
        registers.add(new NASMRegister("r8"));
        registers.add(new NASMRegister("r9"));
        registers.add(new NASMRegister("r10"));
        registers.add(new NASMRegister("r11"));
        registers.add(new NASMRegister("r12"));
        registers.add(new NASMRegister("r13"));
        registers.add(new NASMRegister("r14"));
        registers.add(new NASMRegister("r15"));
    }

    public NASMRegister getRegister(String name) {
        if (name.equals("rax")) return registers.get(0);
        if (name.equals("rcx")) return registers.get(1);
        if (name.equals("rdx")) return registers.get(2);
        if (name.equals("rbx")) return registers.get(3);
        if (name.equals("rsi")) return registers.get(4);
        if (name.equals("rdi")) return registers.get(5);
        if (name.equals("rsp")) return registers.get(6);
        if (name.equals("rbp")) return registers.get(7);
        if (name.equals("r8")) return registers.get(8);
        if (name.equals("r9")) return registers.get(9);
        if (name.equals("r10")) return registers.get(10);
        if (name.equals("r11")) return registers.get(11);
        if (name.equals("r12")) return registers.get(12);
        if (name.equals("r13")) return registers.get(13);
        if (name.equals("r14")) return registers.get(14);
        if (name.equals("r15")) return registers.get(15);
        return null;
    }

    public NASMRegister getParameterRegister(int index) {
        if (index == 0) return registers.get(5);
        if (index == 1) return registers.get(4);
        if (index == 2) return registers.get(2);
        if (index == 3) return registers.get(1);
        if (index == 4) return registers.get(8);
        if (index == 5) return registers.get(9);
        return null;
    }

    public NASMRegister getFreeRegister() {
        for (int i = 0; i < 16; i++) {
            if (i == 6 || i == 7) continue;
            NASMRegister register = registers.get(i);
            if (register.getIrRegister() == null)
                return register;
        }
        return null;
    }

    public List<String> store() {
        List<String> code = new ArrayList<>();
        for (NASMRegister register : registers)
            code.addAll(register.store());
        return code;
    }

}
