package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import com.fur.enumerate.PrimaryTypeList;
import com.fur.type.BaseType;
import com.fur.type.ClassType;
import com.fur.type.PrimaryType;
import org.antlr.v4.runtime.Token;

public class LiteralExpressionNode extends BaseExpressionNode {

    private BaseType type;
    private String value;

    public LiteralExpressionNode(BaseType _type, String _value, Token token) {
        super(token);
        type = _type;
        value = _value;
        if (value.equals("null")) {
            value = "0";
            return;
        }
        if (_type instanceof ClassType) {
            StringBuilder rebuild = new StringBuilder();
            for (int i = 1; i < value.length() - 1; i++) {
                if (value.charAt(i) == '\\') {
                    char nextChar = value.charAt(i + 1);
                    if (nextChar == 'n') rebuild.append('\n');
                    else if (nextChar == 't') rebuild.append('\t');
                    else if (nextChar == '"') rebuild.append('"');
                    else rebuild.append(nextChar);
                    i++;
                } else rebuild.append(value.charAt(i));
            }
            value = rebuild.toString();
        } else {
            assert _type instanceof PrimaryType;
            if (((PrimaryType) _type).getType().equals(PrimaryTypeList.BOOL))
                if (value.equals("true")) value = "1";
                else value = "0";
        }
    }

    public BaseType getType() {
        return type;
    }

    public String getValue() {
        return value;
    }

    @Override
    public <T> T accept(AbstractSyntaxTreeVisitor<? extends T> visitor) {
        return visitor.visitLiteralExpressionNode(this);
    }

}
