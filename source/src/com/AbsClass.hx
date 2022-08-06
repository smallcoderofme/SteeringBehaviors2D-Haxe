package com;

class SubClass {

    private var _x: Float;
    private var _y: Float;
    @:isVar public var x(get, set): Float;
    @:isVar public var y(get, set): Float;

    public function set_x(value:Float)
    {
        _x = value;
        return _x;
    }
    public function get_x():Float
    {
        return _x;
    }
    public function set_y(value:Float)
    {
        _y = value;
        return _y;
    }
    public function get_y():Float
    {
        return _y;
    }

    public function new(x: Float = 0, y:Float = 0) {
        _x = x;
        _y = y;
    }

	public function clone(): SubClass {
		return new SubClass(_x, _y);
	}
}


abstract Vec2D(SubClass) {
    public inline function new(x: Float, y: Float) {
        this = new SubClass(x, y);
    }

    public function x()
    {
        return this.x;
    }
    public function y()
    {
        return this.y;
    }

    @:op(A + B)
    public inline function add(v2: Vec2D) : Vec2D {
        return new Vec2D(this.x + v2.x(), this.y + v2.y());
    }
}