package com.behaviours;

import h2d.Object;
import com.foed.Vehicle;
import com.foed.Vector2D;
import com.foed.SteeredVehicle;
import h2d.Object;
import h2d.Bitmap;

class SeekFleeTest2 extends Object {
    
    private var _vehicleA:SteeredVehicle;
    private var _vehicleB:SteeredVehicle;
    private var _vehicleC:SteeredVehicle;

    public function new(?parent:Object) {
        super(parent);

        _vehicleA = new SteeredVehicle(new Bitmap(hxd.Res.vec2d.toTile()));
        _vehicleA.position = new Vector2D(200, 200);
        _vehicleA.edgeBehavior = Vehicle.BOUNCE;
        addChild(_vehicleA);
        
        _vehicleB = new SteeredVehicle(new Bitmap(hxd.Res.vec2d_r.toTile()));
        _vehicleB.position = new Vector2D(400, 200);
        _vehicleB.edgeBehavior = Vehicle.BOUNCE;
        addChild(_vehicleB);
        
        _vehicleC = new SteeredVehicle(new Bitmap(hxd.Res.vec2d.toTile()));
        _vehicleC.position = new Vector2D(300, 260);
        _vehicleC.edgeBehavior = Vehicle.BOUNCE;
        addChild(_vehicleC);
    }
    public function update() {
        _vehicleA.seek(_vehicleB.position);
        _vehicleA.flee(_vehicleC.position);
        
        _vehicleB.seek(_vehicleC.position);
        _vehicleB.flee(_vehicleA.position);
        
        _vehicleC.seek(_vehicleA.position);
        _vehicleC.flee(_vehicleB.position);
        
        _vehicleA.update();
        _vehicleB.update();
        _vehicleC.update();
    }

}