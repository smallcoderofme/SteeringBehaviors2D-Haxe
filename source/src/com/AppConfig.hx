package com;

class AppConfig
{
    static var _width:Int = 800;
    static var _height:Int = 800;

    @:isVar static public var width(get, set): Int;
    @:isVar static public var height(get, set): Int;

    static public function set_width(value:Int)
    {
        _width = value;
        return _width;
    }
    static public function get_width():Int
    {
        return _width;
    }
    static public function set_height(value:Int)
    {
        _height = value;
        return _height;
    }
    static public function get_height():Int
    {
        return _height;
    }
}