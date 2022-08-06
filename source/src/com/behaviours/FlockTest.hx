package com.behaviours;

import h2d.Object;

import com.foed.Vehicle;
import com.foed.Vector2D;
import com.foed.SteeredVehicle;

import h2d.Bitmap;


class FlockTest extends Object {
    private var _vehicles:Array<SteeredVehicle>;
    private var _vehicle:SteeredVehicle;
    private var _numVehicles:Int = 30;
    public function new(?parent: Object)
    {
        super(parent);

        _vehicles = new Array<SteeredVehicle>();
        for(i in 0..._numVehicles)
        {
            var vehicle:SteeredVehicle = new SteeredVehicle(new Bitmap(hxd.Res.vec2d.toTile()));
            vehicle.position = new Vector2D(Math.random() * 1920, Math.random() * 1080);
            vehicle.velocity = new Vector2D(Math.random() * 20 - 10, Math.random() * 20 - 10);
            vehicle.edgeBehavior = Vehicle.BOUNCE;
            _vehicles.push(vehicle);
            addChild(vehicle);
        }
    }
    public function update():Void{
        for(i in 0..._numVehicles)
        {
            _vehicles[i].flock(cast _vehicles);
            _vehicles[i].update();
        }
    }
}