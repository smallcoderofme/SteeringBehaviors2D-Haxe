package com.behaviours;

import h2d.Graphics;
import h2d.Object;

import com.foed.Vehicle;
import com.foed.Vector2D;
import com.foed.SteeredVehicle;

import h2d.Bitmap;


class PathTest extends Object {

    private var _vehicle:SteeredVehicle;
    private var _path:Array<Vector2D>;
    private var graphics: Graphics;
    public function new(?parent: Object)
    {
        super(parent);
        graphics = new Graphics(this);

        _vehicle = new SteeredVehicle(new Bitmap(hxd.Res.vec2d.toTile()));
        addChild(_vehicle);
        
        _path = new Array<Vector2D>();

    }

    public function update():Void{
        _vehicle.followPath(_path, true);
        _vehicle.update();
    }

    public function addPoint(vec2: Vector2D) {
        graphics.lineStyle(2, 0xFFFFFF, 1.0);
        if(_path.length == 0)
        {
            graphics.moveTo(vec2.x, vec2.y);
        }
        graphics.lineTo(vec2.x, vec2.y);
        
        graphics.drawCircle(vec2.x, vec2.y, 10);
        graphics.moveTo(vec2.x, vec2.y);
        _path.push(vec2);
    }
}