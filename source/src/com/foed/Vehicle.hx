package com.foed;

import h2d.Drawable;
import h2d.Object;

class Vehicle extends Object {

    public static inline final WRAP: String = "wrap";
    public static inline final BOUNCE: String = "bounce";

    var _edgeBehavior: String = WRAP;
    var _mass: Float = 1.0;
    var _maxSpeed: Float = 4.0;
    var _position: Vector2D;
    var _velocity: Vector2D;
    
    @:isVar public var position(get, set): Vector2D;
    public function set_position(pos: Vector2D): Vector2D {
        _position = pos;
        vpx = _position.x;
        vpy = _position.y;
        return _position;
    }
    public function get_position(): Vector2D {
        return _position;
    }
    @:isVar public var velocity(get, set): Vector2D;
    public function set_velocity(vec2: Vector2D): Vector2D {
        _velocity = vec2;
        return _velocity;
    }
    public function get_velocity(): Vector2D {
        return _velocity;
    }

    @:isVar public var mass(get, set): Float;
    public function set_mass(value: Float): Float {
        _mass = value;
        return _mass;
    }
    public function get_mass(): Float {
        return _mass;
    }
    @:isVar public var maxSpeed(get, set): Float;
    public function set_maxSpeed(value: Float): Float {
        _maxSpeed = value;
        return _maxSpeed;
    }
    public function get_maxSpeed(): Float {
        return _maxSpeed;
    }
    @:isVar public var edgeBehavior(get, set): String;
    public function set_edgeBehavior(value: String): String {
        _edgeBehavior = value;
        return _edgeBehavior;
    }
    public function get_edgeBehavior(): String {
        return _edgeBehavior;
    }
    var _vpx: Vector2D;
    @:isVar public var vpx(get, set): Float;
    public function set_vpx(value:Float):Float
    {
        super.x = value;
        _position.x = value;
        return _position.x;
    }
    public function get_vpx():Float
    {
        return _position.x;
    }
    var _vpy: Vector2D;
    @:isVar public var vpy(get, set): Float;
    public function set_vpy(value:Float):Float
    {
        super.y = value;
        _position.y = value;
        return _position.y;
    }
    public function get_vpy():Float
    {
        return _position.y;
    }
    public function new(?parent: Object) {
        super(parent);
        _position = new Vector2D();
        _velocity = new Vector2D();
    }

    public function update(): Void {
        _velocity.truncate(_maxSpeed);
        _position = _position.add(_velocity);

        if(_edgeBehavior == WRAP)
        {
            wrap();
        }
        else if(_edgeBehavior == BOUNCE)
        {
            bounce();
        }

        vpx = position.x;
        vpy = position.y;

        rotation = _velocity.angle;// * 180 / hxd.Math.PI;

    }

    function wrap() {
        if(position.x > AppConfig.width) position.x = 0;
        if(position.x < 0) position.x = AppConfig.width;
        if(position.y > AppConfig.height) position.y = 0;
        if(position.y < 0) position.y = AppConfig.height;
    }
    function bounce(): Void {
        if(position.x > AppConfig.width)
        {
            position.x = AppConfig.width;
            velocity.x *= -1;
        }
        else if(position.x < 0)
        {
            position.x = 0;
            velocity.x *= -1;
        }
        
        if(position.y > AppConfig.height)
        {
            position.y = AppConfig.height;
            velocity.y *= -1;
        }
        else if(position.y < 0)
        {
            position.y = 0;
            velocity.y *= -1;
        }
    }
}

