package com.behaviours;

import h2d.RenderContext;
import h2d.col.Point;
import hxd.res.DefaultFont;
import h2d.Text;
import h2d.Graphics;
import h2d.Object;
import com.foed.Vehicle;
import com.foed.Vector2D;
import com.foed.SteeredVehicle;
import h2d.Object;
import h2d.Bitmap;

class InteractiveGraphics extends Object {
    
    private var graphics: Graphics;
    private var interactive: h2d.Interactive;
    private var pressed: Bool = false;

    public function new(?parent:Object) {
        super(parent);
        this.graphics = new Graphics(this);
        interactive = new h2d.Interactive(10, 10, this);
        interactive.onPush = onMouseDown;
        // interactive.onRelease = onMouseUp;
        // interactive.onMove = onMouseMove;

    }

    dynamic public function moveCallback(): Void {
        
    }

    function onMouseDown(event: hxd.Event) {
        pressed = true;
        trace(event.relX, event.relY);
    }

    function onMouseUp(event: hxd.Event) {
        pressed = false;
    }
    private var dirty: Bool = false;
    private var pos: Point = new Point(0, 0);
    function onMouseMove(event: hxd.Event) {
        if(pressed)
        {
            dirty = true;
            pos.x = event.relX;
            pos.y = event.relY;
            // moveCallback();
        }
    }

    override function draw(ctx: RenderContext) {
        if(dirty) {
            dirty = false;
            this.x = pos.x;
            this.y = pos.y;
            trace(pos.x, pos.y);
        }
        super.draw(ctx);
        
    }
}

class Steering extends Object {

    private var sA:InteractiveGraphics;
    private var sB:InteractiveGraphics;
    private var sC:InteractiveGraphics;
    private var tf:Text;

    private var graphics: Graphics;
    public function new(?parent:Object) {
        super(parent);

        
        graphics = new Graphics(this);

        sA = makeHandle(100, 100, "A");
        sB = makeHandle(200, 100, "B");
        sC = makeHandle(200, 200, "C");
        
        tf = new Text(DefaultFont.get(), this);
        addChild(tf);
        tf.x = 100;
    }
    private function makeHandle(xpos:Float, ypos:Float, label:String):InteractiveGraphics
    {
    
        var ig: InteractiveGraphics = new InteractiveGraphics(this);
        ig.moveCallback = onMouseMove;

        ig.x = xpos;
        ig.y = ypos;
        var lab:Text = new Text(DefaultFont.get(), this);
        lab.text = label;
        lab.x = -6;
        lab.y = -7;
        ig.addChild(lab);
        return ig;
    }
    private var dirty: Bool;
    private function onMouseMove():Void
    {
        dirty = true;
        calculate();
    }
    
    override function draw(ctx:RenderContext):Void
    {
        if(dirty)
        {
            graphics.clear();
            graphics.lineStyle(2, 0xff0000);
            graphics.moveTo(sB.x, sB.y);
            graphics.lineTo(sA.x, sA.y);
            graphics.lineTo(sC.x, sC.y);
            dirty = false;
        }
        super.draw(ctx);
    }
    
    private function calculate():Void
    {
        var v1:Vector2D = new Vector2D(sB.x - sA.x, sB.y - sA.y);
        var v2:Vector2D = new Vector2D(sC.x - sA.x, sC.y - sA.y);
        var degrees:Float = Vector2D.angleBetween(v1, v2) * 180 / Math.PI;
        tf.text = Std.string((degrees * v1.sign(v2)));
    }
}