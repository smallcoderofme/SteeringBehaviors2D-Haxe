package com.behaviours;

import h2d.Object;
import com.foed.Vehicle;
import com.foed.Vector2D;
import com.foed.SteeredVehicle;
import h2d.Object;
import h2d.Bitmap;

class SeekFleeTest1 extends Object {
    private var _seeker:SteeredVehicle;
    private var _fleer:SteeredVehicle;

    public function new(?parent:Object) {
        super(parent);

        _seeker = new SteeredVehicle(new Bitmap(hxd.Res.vec2d.toTile()));
        _seeker.position = new Vector2D(200, 200);
        _seeker.edgeBehavior = Vehicle.BOUNCE;
        addChild(_seeker);
        
        _fleer = new SteeredVehicle(new Bitmap(hxd.Res.vec2d_r.toTile()));
        _fleer.position = new Vector2D(400, 300);
        _fleer.edgeBehavior = Vehicle.BOUNCE;
        addChild(_fleer);
    }

    public function update() {
        _seeker.seek(_fleer.position);
        _fleer.flee(_seeker.position);
        _seeker.update();
        _fleer.update();
    }
}