package com.fur.intermediateRepresentation;

public class TemplateName {

    private int count;

    public String getNew() {
        String name = "tmp_" + String.valueOf(count);
        count++;
        return name;
    }

    public void reset() {
        count = 0;
    }

}
