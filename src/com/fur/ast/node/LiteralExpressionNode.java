package com.fur.ast.node;

import com.fur.ast.ASTVisitor;
import com.fur.ast.enumerate.PrimaryTypeList;
import org.antlr.v4.runtime.Token;

public class LiteralExpressionNode extends BaseExpressionNode {

    private PrimaryTypeList type;
    private String value;

    public LiteralExpressionNode(PrimaryTypeList _type, String _value, Token token) {
        super(token);
        type = _type;
        value = _value;
        if (_type == PrimaryTypeList.STRING) {
            StringBuilder rebuild = new StringBuilder();
            for (int i = 0; i < value.length(); i ++) {
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

    public PrimaryTypeList getType() {
        return type;
    }

    public String getValue() {
        return value;
    }

    @Override
    public <T> T accept(ASTVisitor<? extends T> visitor) {
        return visitor.visitLiteralExpressionNode(this);
    }

}
