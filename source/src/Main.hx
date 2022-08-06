import haxe.macro.Compiler;
import com.behaviours.WanderTest;
import com.behaviours.Steering2;
import haxe.Timer;
import com.DragObject;
import com.behaviours.Steering;
import com.behaviours.SeekTest;
import com.behaviours.SeekFleeTest2;
import com.behaviours.SeekFleeTest1;
import com.behaviours.PursueTest;
import com.behaviours.PursueEvadeTest;
import com.behaviours.PathTest;
import com.behaviours.FlockTest;
import com.behaviours.FleeTest;
import com.foed.SteeredVehicle;
import utils.Stats;
import hxd.res.Font;
import h2d.Text;
import com.Circle;
import com.behaviours.AvoidTest;
import hxd.Res;
import h2d.Bitmap;
import com.behaviours.ArriveTest;
import com.foed.Vector2D;

#if actuate
import motion.actuators.SimpleActuator;
#end

//import com.AbsClass.MyAbstract;

class Main extends hxd.App {

	static function main() {
        hxd.Res.initEmbed();
        new Main();
	} 
    override function init() {
        stats = new Stats(s2d);

        // var vec1 = new SubClass(3, 4);
        // var vec2 = new SubClass(5, 6);
        // var v3: SubClass = vec2 + vec1;
        // trace(v3);
        
        // var vec1 = new MyAbstract(new SubClass(2, 3));
        // var vec2 = new MyAbstract(new SubClass(4, 5));
        // //var v3 = vec1 + vec2;
        // var v3 = vec1.add(vec2);
        // trace("[v3: x:", v3.x, " y:", v3.y, "]");

        // var v1 = new Vec2D(2, 3);
        // var v2 = new Vec2D(3, 4);
        // var v3 = v1 + v2;
        // // v1.add(v2);
        // trace(v3);

        trace(s2d.width, s2d.height);
        AppConfig.width = s2d.width;
        AppConfig.height = s2d.height;

        //var bg = new Bitmap(Res.bg.toTile(), s2d);

        // arriveTest = new ArriveTest();
        // s2d.addChild(arriveTest);
        // avoidTest = new AvoidTest(s2d);
        // fleeTest = new FleeTest();
        // s2d.addChild(fleeTest);
        // flockTest = new FlockTest(s2d);
        // pathTest = new PathTest(s2d);
        // pursueEvadeTest = new PursueEvadeTest(s2d);
        // pursueTest = new PursueTest(s2d);

        // seekFleeTest1 = new SeekFleeTest1(s2d);
        // seekFleeTest2 = new SeekFleeTest2(s2d);
        // seekTest = new SeekTest(s2d);

        /**没啥用仅仅是说明**/
        // steering = new Steering(s2d);
        // steering2 = new Steering2(s2d);
        // wanderTest = new WanderTest(s2d);


        // var interaction = new h2d.Interactive(1920, 1080, s2d);
        // mousePos = new Vector2D();
        // interaction.onMove = function(event : hxd.Event) {
        //     mousePos.x = event.relX;
        //     mousePos.y = event.relY;
        //     seekTest.update(new Vector2D(event.relX, event.relY));
        // }

        // interaction.onClick = function(event : hxd.Event) {
        //     pathTest.addPoint(new Vector2D(event.relX, event.relY));
        // }

        // // new Circle(50.0, 0xFFFF00, s2d);

        // var bitmap = new Bitmap(hxd.Res.vec2d.toTile(),s2d);
        // Slide.tween(bitmap)
        //     .to({x:300}, 1.6)
        //     .to({y:300}, 2.0)
        //     .wait(0.5)
        //     .to({x:0}, 0.5)
        //     .ease(slide.easing.Quad.easeIn)
        //     .onComplete(function() { trace("completed!"); })
        //     .start();

        // Actuate.tween (bitmap, 1, { x: 200 });
        // Actuate.tween (bitmap, 1, { y: 200 }).delay(0.5);
        // Actuate.tween (bitmap, 1, { x: 0 }, false).delay(1.0);

        var bitmap: Bitmap = new Bitmap(Res.rect.toTile(), s2d);
        bitmap.x = 50;
        bitmap.y = 50;
    }

    var arriveTest: ArriveTest;
    var avoidTest: AvoidTest;
    var fleeTest: FleeTest;
    var flockTest: FlockTest;
    var pathTest: PathTest;
    var pursueEvadeTest: PursueEvadeTest;
    var pursueTest: PursueTest;
    var seekFleeTest1: SeekFleeTest1;
    var seekFleeTest2: SeekFleeTest2;
    var seekTest: SeekTest;
    var steering: Steering;
    var steering2: Steering2;
    var wanderTest: WanderTest;

    var mousePos: Vector2D;
    var stats: Stats;

    // private var _vehicle:SteeredVehicle;
    // private var _circles:Array<Circle>;
    // private var _numCircles:Int = 10;

    override function update(dt:Float) {
        stats.update();    
		// arriveTest.update(mousePos.x, mousePos.y);
        // avoidTest.update();
        // fleeTest.update(mousePos.x, mousePos.y);
        // flockTest.update();
        // pathTest.update();
        // pursueEvadeTest.update();
        // pursueTest.update();
        // seekFleeTest1.update();
        // seekFleeTest2.update();
        // seekTest.update(new Vector2D(mousePos.x, mousePos.y))

        // steering2.update();
        // wanderTest.update();
	}
}