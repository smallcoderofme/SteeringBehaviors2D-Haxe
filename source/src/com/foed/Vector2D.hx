package com.foed;

import h2d.col.Point;
import h2d.Object;

class Vector2D {

    var _x: Float;
    var _y: Float;

    @:isVar public var x(get, set): Float;
    @:isVar public var y(get, set): Float;

    public inline function set_x(value:Float)
    {
        _x = value;
        return _x;
    }
    public inline function get_x():Float
    {
        return _x;
    }
    public inline function set_y(value:Float)
    {
        _y = value;
        return _y;
    }
    public inline function get_y():Float
    {
        return _y;
    }

    @:isVar public var length(get, set): Float;
    @:isVar public var angle(get, set): Float;
    @:isVar public var lengthSQ(get, default): Float;
    @:isVar public var perp(get, default): Vector2D;

    public function new(x: Float = 0, y:Float = 0) {
        _x = x;
        _y = y;
    }

    public inline function draw(drawable: h2d.Object) {
        
    }

    public inline function clone(): Vector2D {
        return new Vector2D(_x, _y);
    }

    public inline function zero(): Vector2D {
        _x = 0;
        _y = 0;
        return this;
    }

    public inline function isZero(): Bool {
        return _x == 0 && _y == 0;
    }

    public inline function set_length(len: Float) {
        var a : Float = angle;
        _x = hxd.Math.cos(a) * len;
        _y = hxd.Math.sin(a) * len;
        return len;
    }
    
    public inline function get_length(): Float {
        return hxd.Math.sqrt(lengthSQ);   
    }
    
    public inline function get_lengthSQ(): Float
    {
        return _x * _x + _y * _y;
    }

    public inline function set_angle(value:Float)
    {
        var len: Float = length;
        _x = Math.cos(value) * len;
        _y = Math.sin(value) * len;
        return value;
    }
    
    public inline function get_angle(): Float
    {
        return Math.atan2(_y, _x);
    }
    
    public inline function normalize():Vector2D
    {
        if(length == 0)
        {
            _x = 1;
            return this;
        }
        var len: Float = length;
        _x /= len;
        _y /= len;
        return this;
    }
    
    public inline function truncate(max: Float): Vector2D
    {
        length = hxd.Math.min(max, length);
        return this;
    }
    
    public inline function reverse():Vector2D
    {
        _x = -_x;
        _y = -_y;
        return this;
    }
    
    public inline function isNormalized(): Bool
    {
        return length == 1.0;
    }
    
    public inline function dotProd(v2:Vector2D): Float
    {
        return _x * v2.x + _y * v2.y;
    }
    
    public inline function crossProd(v2:Vector2D): Float
    {
        return _x * v2.y - _y * v2.x;
    }

    public static function angleBetween(v1:Vector2D, v2:Vector2D): Float
    {
        if(!v1.isNormalized()) v1 = v1.clone().normalize();
        if(!v2.isNormalized()) v2 = v2.clone().normalize();
        return hxd.Math.acos(v1.dotProd(v2));
    }

    public inline function sign(v2:Vector2D): Int
    {
        return perp.dotProd(v2) < 0 ? -1 : 1;
    }

    public inline function get_perp(): Vector2D
    {
        return new Vector2D(-y, x);
    }

    public inline function dist(v2:Vector2D): Float
    {
        return hxd.Math.sqrt(distSQ(v2));
    }

    public inline function distSQ(v2:Vector2D): Float
    {
        var dx:Float = v2.x - x;
        var dy:Float = v2.y - y;
        return dx * dx + dy * dy;
    }

    public inline function add(v2:Vector2D): Vector2D
    {
        return new Vector2D(x + v2.x, y + v2.y);
    }

    public inline function subtract(v2:Vector2D): Vector2D
    {
        return new Vector2D(_x - v2.x, _y - v2.y);
    }

    public inline function multiply(value: Float): Vector2D
    {
        return new Vector2D(_x * value, _y * value);
    }

    public inline function divide(value: Float): Vector2D
    {
        return new Vector2D(_x / value, _y / value);
    }

    public inline function equals(v2:Vector2D): Bool
    {
        return _x == v2.x && _y == v2.y;
    }

    public inline function toString(): String
    {
        return "[Vector2D (x:" + _x + ", y:" + _y + ")]";
    }	
}