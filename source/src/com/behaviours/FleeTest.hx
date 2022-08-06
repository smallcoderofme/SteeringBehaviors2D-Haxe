package com.behaviours;

import com.foed.Vehicle;
import com.foed.Vector2D;
import com.foed.SteeredVehicle;
import h2d.Object;
import h2d.Bitmap;

class FleeTest extends Object {

    private var _vehicle:SteeredVehicle;

    public function new(?parent: Object)
    {
        super(parent);

        _vehicle = new SteeredVehicle(new Bitmap(hxd.Res.vec2d.toTile()));
        _vehicle.position = new Vector2D(200, 200);
        _vehicle.edgeBehavior = Vehicle.BOUNCE;
        addChild(_vehicle);
    }
    public function update(x: Float, y:Float):Void{
        _vehicle.flee(new Vector2D(x, y));
        _vehicle.update();
    }
}