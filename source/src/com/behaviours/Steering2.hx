package com.behaviours;

import h2d.Object;

import h2d.Object;
import com.foed.Vehicle;
import com.foed.Vector2D;
import com.foed.SteeredVehicle;
import h2d.Object;
import h2d.Bitmap;

class Steering2 extends Object {

	private var _small:SteeredVehicle;
	private var _medium:SteeredVehicle;
	private var _large:SteeredVehicle;

    public function new(?parent:Object) {
    	super(parent);

		_small = new SteeredVehicle(new Bitmap(hxd.Res.vec2d.toTile().center()));
		_small.scaleX = _small.scaleY = .5;
//		_small.mass = .5;
		_small.position = new Vector2D(300, 400);
		addChild(_small);
		
		_medium = new SteeredVehicle(new Bitmap(hxd.Res.vec2d_r.toTile().center()));
		_medium.position = new Vector2D(100, 100);
		addChild(_medium);
//			_large = new SteeredVehicle();
//			_large.scaleX = _large.scaleY = 1.5;
//			_large.mass = 2;
//			_large.position = new Vector2D(600, 140);
//			addChild(_large);
    }

    public function update():Void
	{
		_small.wander();
		_medium.seek(_small.position);
		_small.update();
		_medium.update();
//		_large.update();
	}

}