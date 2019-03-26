package com.fur.abstractSyntaxTree.node;

import com.fur.abstractSyntaxTree.AbstractSyntaxTreeVisitor;
import com.fur.enumerate.PrimaryTypeList;
import com.fur.type.BaseType;
import com.fur.type.ClassType;
import org.antlr.v4.runtime.Token;

public class LiteralExpressionNode extends BaseExpressionNode {

    private BaseType type;
    private String value;

    public LiteralExpressionNode(BaseType _type, String _value, Token token) {
        super(token);
        type = _type;
        value = _value;
        if (_type instanceof ClassType) {
            StringBuilder rebuild = new StringBuilder();
            for (int i = 0; i < value.length(); i++) {
                if (value.charAt(i) == '\\') {
                    char nextChar = value.charAt(i + 1);
                    if (nextChar == 'n') rebuild.append('\n');
                    else if (nextChar == 't') rebuild.append('\t');
                    else if (nextChar == '"') rebuild.append('"');
                    else rebuild.append(nextChar);
                } else rebuild.append(value.charAt(i));
            }
            value = rebuild.toString();
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
