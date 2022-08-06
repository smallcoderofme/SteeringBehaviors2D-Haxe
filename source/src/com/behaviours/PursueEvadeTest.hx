package com.behaviours;

import h2d.Object;

import com.foed.Vehicle;
import com.foed.Vector2D;
import com.foed.SteeredVehicle;

import h2d.Bitmap;

class PursueEvadeTest extends Object {

    private var _pursuer:SteeredVehicle;
    private var _evader:SteeredVehicle;

    public function new(?parent: Object)
    {
        super(parent);

        _pursuer = new SteeredVehicle(new Bitmap(hxd.Res.vec2d.toTile()));
        _pursuer.position = new Vector2D(200, 200);
        _pursuer.edgeBehavior = Vehicle.BOUNCE;
        addChild(_pursuer);
        
        _evader = new SteeredVehicle(new Bitmap(hxd.Res.vec2d_r.toTile()));
        _evader.position = new Vector2D(400, 300);
        _evader.edgeBehavior = Vehicle.BOUNCE;
        addChild(_evader);
    }

    public function update():Void
    {
        _pursuer.pursue(_evader);
        _evader.evade(_pursuer);
        _pursuer.update();
        _evader.update();
    }
}