package com.behaviours;

import com.foed.Vehicle;
import com.foed.Vector2D;
import com.foed.SteeredVehicle;
import h2d.Object;
import h2d.Bitmap;

 class PursueTest extends Object
{
    private var _seeker:SteeredVehicle;
    private var _pursuer:SteeredVehicle;
    private var _target:Vehicle;
    
    public function new(?parent: Object)
    {
        super(parent);

        _seeker = new SteeredVehicle(new Bitmap(hxd.Res.vec2d.toTile()));
        _seeker.x = 300;
        addChild(_seeker);
        
        _pursuer = new SteeredVehicle(new Bitmap(hxd.Res.vec2d_r.toTile()));
        _pursuer.x = 400;
        addChild(_pursuer);
        
        _target = new Vehicle();
        _target.position = new Vector2D(200, 300);
        _target.velocity.length = 15;
        addChild(_target);
        
    }
    
    public function update():Void
    {
        _seeker.seek(_target.position);
        _seeker.update();
        
        _pursuer.pursue(_target);
        _pursuer.update();
        
        _target.update();
    }
}