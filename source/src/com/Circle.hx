package com;

import com.foed.Vector2D;
import h2d.Object;

class Circle extends Object {
    
    private var _radius:Float;
    private var _color:UInt;
    public function new(radius: Float, color:Int = 0xFF0000, ?parent: Object) {
        super(parent);
        _radius = radius;
        var customGraphics = new h2d.Graphics(this);
        //customGraphics.beginFill(color);
        customGraphics.lineStyle(2, color);
        customGraphics.drawCircle(0, 0, radius);
        customGraphics.endFill();

    }
    public function radius():Float
    {
        return _radius;
    }
    
    public function position():Vector2D
    {
        return new Vector2D(x, y);
    }
}