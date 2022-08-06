package com.behaviours;

import com.foed.Vector2D;
import com.foed.SteeredVehicle;
import h2d.Object;
import h2d.Bitmap;

class AvoidTest extends Object 
{
    private var _vehicle:SteeredVehicle;
    private var _circles:Array<Circle>;
    private var _numCircles:Int = 10;

    public function new(?parent: Object)
    {
        super(parent);

        
        _vehicle = new SteeredVehicle(new Bitmap(hxd.Res.vec2d.toTile().center()));
        _vehicle.edgeBehavior = com.foed.Vehicle.BOUNCE;
        parent.addChild(_vehicle);

        _circles = new Array<Circle>();
        for(i in 0..._numCircles)
        {
            var circle:Circle = new Circle(Math.random() * 50 + 50);
            circle.x = Math.random() * AppConfig.width;
            circle.y = Math.random() * AppConfig.height;
            parent.addChild(circle);
            _circles.push(circle);
        }
    }
    public function update():Void
    {
		_vehicle.wander();
        _vehicle.avoid(_circles);
        _vehicle.update();
    }
}