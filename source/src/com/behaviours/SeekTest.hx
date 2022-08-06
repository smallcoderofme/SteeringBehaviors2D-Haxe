package com.behaviours;

import h2d.Object;

import h2d.Object;
import com.foed.Vehicle;
import com.foed.Vector2D;
import com.foed.SteeredVehicle;
import h2d.Object;
import h2d.Bitmap;

class SeekTest extends Object {
    
    private var _vehicle:SteeredVehicle;

    public function new(?parent:Object) {
        super(parent);
        
        _vehicle = new SteeredVehicle(new Bitmap(hxd.Res.vec2d.toTile()));
        addChild(_vehicle);
    }

    public function update(vec2: Vector2D) {
        _vehicle.seek(vec2);
        _vehicle.update();
    }
}