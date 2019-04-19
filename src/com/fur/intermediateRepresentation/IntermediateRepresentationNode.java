package com.fur.intermediateRepresentation;

import com.fur.type.BaseType;

import java.util.List;

public class IntermediateRepresentationNode {

    private List<String> code;
    private String result;
    private BaseType type;

    public IntermediateRepresentationNode(List<String> _code, String _result, BaseType _type) {
        code = _code;
        result = _result;
        type = _type;
    }

    public List<String> getCode() {
        return code;
    }

    public String getResult() {
        return result;
    }

    public BaseType getType() {
        return type;
    }

}
