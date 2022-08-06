package com;

import h2d.col.Point;
import h2d.Bitmap;
import h2d.Object;

class DragObject extends Object {
    public function new(?parent: Object) {
        super(parent);
        var bitmap: Bitmap = new Bitmap(hxd.Res.vec2d.toTile(), this);
        var interactive: h2d.Interactive = new h2d.Interactive(1920, 1080,  parent);
        interactive.onMove = function(event: hxd.Event) {
            if(draging){
                x = event.relX;
                y = event.relY;
            }
        }
        interactive.onPush = function(event : hxd.Event) {
            if(!press && bitmap.getBounds().contains(new Point(event.relX, event.relY))){
                press = true;
                draging = true;
            }
        }
       
        interactive.onRelease = release;
        interactive.onReleaseOutside = release;
   
    }
    private var draging: Bool = false;
    var press: Bool = false;
    function release(event : hxd.Event) {
        if(press)
        {
            press = false;
            draging = false;
        }
    }
}