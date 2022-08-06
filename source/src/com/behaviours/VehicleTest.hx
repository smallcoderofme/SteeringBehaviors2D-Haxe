package com.behaviours;

import h2d.Object;
import h2d.Object;
import com.foed.Vehicle;
import com.foed.Vector2D;
import com.foed.SteeredVehicle;
import h2d.Object;
import h2d.Bitmap;

class VehicleTest extends Object {
	private var _vehicle:Vehicle;

    public function new(?parent:Object) {
    	super(parent);

		_vehicle = new Vehicle();
		addChild(_vehicle);
		
		_vehicle.position = new Vector2D(100, 100);
		
		_vehicle.velocity.length = 5;
		_vehicle.velocity.angle = Math.PI / 4;
    }

    public function update():Void
	{
		_vehicle.update();
	}
}