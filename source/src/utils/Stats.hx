package utils;

import h3d.Engine;
import h2d.Object;

class Stats extends Object {
    
    var fps: h2d.Text;
    var calls: h2d.Text;
    var tris: h2d.Text;
    var e:Engine;

    public function new(?parent: Object) {
        super(parent);

        e = Engine.getCurrent();
        fps = new h2d.Text(hxd.res.DefaultFont.get(), this);
        fps.y = 0;
        calls = new h2d.Text(hxd.res.DefaultFont.get(), this);
        calls.y = 20;
        tris = new h2d.Text(hxd.res.DefaultFont.get(), this);
        tris.y = 40;
        
    }

    public function update(dt:Float = 0) {
        fps.text = "fps: " + Std.string(e.fps);
        calls.text = "calls: "+numberFormat(e.drawCalls);
        tris.text = "tris:" + numberFormat(e.drawTriangles);
	}

    inline function max(a: Int, b: Int) {
        if(a>=b) return a;
        return b;
    }
    inline function numberFormat(v : Int) {
          var tmp = Std.string(v);
          var n = Math.ceil(tmp.length / 3);
          var str = "";
          for( i in 0...n) {
              if(str != "") str = " " + str;
              var start = tmp.length - 3 * (i + 1);
              str = Std.string(tmp.substring(max(0, start), start + 3)) + str;
          }
          return Std.string(str);
      }
}