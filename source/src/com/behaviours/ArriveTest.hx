package com.behaviours;

/**
    到达
**/

import com.foed.Vector2D;
import h2d.Object;
import hxd.Res;
import h2d.Bitmap;
import com.foed.SteeredVehicle;

class ArriveTest extends Object
{
    private var _vehicle:SteeredVehicle;
    
    public function new(?parent: Object)
    {
        super(parent);
        var bitmap = new Bitmap(Res.vec2d.toTile());
        _vehicle = new SteeredVehicle(bitmap);
        addChild(_vehicle);
    }
    
    public function update(x: Float, y:Float):Void
    {
       _vehicle.arrive(new Vector2D(x, y));
       _vehicle.update();
    }
}