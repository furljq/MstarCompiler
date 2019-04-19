package com.fur.intermediateRepresentation;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StringStaticTable {

    private int heap;
    private Map<String, Integer> stringMap = new HashMap<>();
    private List<String> code = new ArrayList<>();

    int get(String string) {
        if (stringMap.get(string) == null) {
            stringMap.put(string, heap);
            int ret = heap;
            for (int i = 0; i < string.length(); i++) {
                int ascii = (byte) string.indexOf(i);
                code.add("STR " + heap + " " + ascii);
                heap += 8;
            }
            return ret;
        } else return stringMap.get(string);
    }

    public List<String> getCode() {
        return code;
    }

}
