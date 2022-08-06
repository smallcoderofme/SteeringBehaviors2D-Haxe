package com.foed;

import h2d.Object;

class SteeredVehicle extends Vehicle 
{
    private var _maxForce:Float = 1;
    private var _steeringForce:Vector2D;
    private var _arrivalThreshold:Float = 100;
    private var _wanderAngle:Float = 0;
    private var _wanderDistance:Float = 10;
    private var _wanderRadius:Float = 5;
    private var _wanderRange:Float = 1;
    private var _pathIndex:Int = 0;
    private var _pathThreshold:Float = 20;
    private var _avoidDistance:Float = 300;
    private var _avoidBuffer:Float = 20;
    private var _inSightDist:Float = 200;
    private var _tooCloseDist:Float = 60;

    public function new(obj: Object, ?parent: Object) 
    {
        super(parent);
        addChild(obj);
        _steeringForce = new Vector2D();
    }
    @:isVar public var maxForce(get, set): Float;
    public function set_maxForce(value:Float):Float
    {
        _maxForce = value;
        return _maxForce;
    }
    public function get_maxForce():Float
    {
        return _maxForce;
    }
    @:isVar public var arriveThreshold(get, set): Float;
    public function set_arriveThreshold(value:Float):Float
    {
        _arrivalThreshold = value;
        return _arrivalThreshold;
    }
    public function get_arriveThreshold():Float
    {
        return _arrivalThreshold;
    }
    @:isVar public var wanderDistance(get, set): Float;
    public function set_wanderDistance(value:Float):Float
    {
        _wanderDistance = value;
        return _wanderAngle;
    }
    public function get_wanderDistance():Float
    {
        return _wanderDistance;
    }
    @:isVar public var wanderRadius (get, set): Float;
    public function set_wanderRadius (value:Float):Float
    {
        _wanderRadius = value;
        return _wanderRadius;
    }
    public function get_wanderRadius():Float
    {
        return _wanderRadius;
    }
    @:isVar public var wanderRange(get, set): Float;
    public function set_wanderRange(value:Float):Float
    {
        _wanderRange = value;
        return _wanderRange;
    }
    public function get_wanderRange():Float
    {
        return _wanderRange;
    }
    @:isVar public var pathIndex(get, set): Int;
    public function set_pathIndex(value:Int):Int
    {
        _pathIndex = value;
        return _pathIndex;
    }
    public function get_pathIndex():Int
    {
        return _pathIndex;
    }
    @:isVar public var pathThreshold(get, set): Float;
    public function set_pathThreshold(value:Float):Float
    {
        _pathThreshold = value;
        return _pathThreshold;
    }
    public function get_pathThreshold():Float
    {
        return _pathThreshold;
    }
    @:isVar public var avoidDistance(get, set): Float;
    public function set_avoidDistance(value:Float):Float
    {
        _avoidDistance = value;
        return _avoidDistance;
    }
    public function get_avoidDistance():Float
    {
        return _avoidDistance;
    }
    @:isVar public var avoidBuffer(get, set): Float;
    public function set_avoidBuffer(value:Float):Float
    {
        _avoidBuffer = value;
        return _avoidBuffer;
    }
    public function get_avoidBuffer():Float
    {
        return _avoidBuffer;
    }
    @:isVar public var inSightDist(get, set): Float;
    public function set_inSightDist(value:Float):Float
    {
        _inSightDist = value;
        return _inSightDist;
    }
    public function get_inSightDist():Float
    {
        return _inSightDist;
    }
    @:isVar public var tooCloseDist(get, set): Float;
    public function set_tooCloseDist(value:Float):Float
    {
        _tooCloseDist = value;
        return _tooCloseDist;
    }
    public function get_tooCloseDist():Float
    {
        return _tooCloseDist;
    }
    
    override public function update():Void
    {
        _steeringForce.truncate(_maxForce);
        _steeringForce = _steeringForce.divide(_mass);
        _velocity = _velocity.add(_steeringForce);
        _steeringForce = new Vector2D();
        super.update();
    }
    
    public function seek(target:Vector2D):Void
    {
        var desiredVelocity:Vector2D = target.subtract(_position);
        desiredVelocity.normalize();
        desiredVelocity = desiredVelocity.multiply(_maxSpeed);
        var force:Vector2D = desiredVelocity.subtract(_velocity);
        _steeringForce = _steeringForce.add(force);
    }
    
    public function flee(target:Vector2D):Void
    {
        var desiredVelocity:Vector2D = target.subtract(_position);
        desiredVelocity.normalize();
        desiredVelocity = desiredVelocity.multiply(_maxSpeed);
        var force:Vector2D = desiredVelocity.subtract(_velocity);
        _steeringForce = _steeringForce.subtract(force);
    }
    
    public function arrive(target:Vector2D):Void
    {
        var desiredVelocity:Vector2D = target.subtract(_position);
        desiredVelocity.normalize();
        
        var dist:Float = _position.dist(target);
        if(dist > _arrivalThreshold)
        {
            desiredVelocity = desiredVelocity.multiply(_maxSpeed);
        }
        else
        {
            desiredVelocity = desiredVelocity.multiply(_maxSpeed * dist / _arrivalThreshold);
        }
        
        var force:Vector2D = desiredVelocity.subtract(_velocity);
        _steeringForce = _steeringForce.add(force);
    }
    
    public function pursue(target:Vehicle):Void
    {
        var lookAheadTime:Float = position.dist(target.position) / _maxSpeed;
        var predictedTarget:Vector2D = target.position.add(target.velocity.multiply(lookAheadTime));
        seek(predictedTarget);
    }
    
    public function evade(target:Vehicle):Void
    {
        var lookAheadTime:Float = position.dist(target.position) / _maxSpeed;
        var predictedTarget:Vector2D = target.position.subtract(target.velocity.multiply(lookAheadTime));
        flee(predictedTarget);
    }
    
    public function wander():Void
    {
        var center:Vector2D = velocity.clone().normalize().multiply(_wanderDistance);
        var offset:Vector2D = new Vector2D(0);
        offset.length = _wanderRadius;
        offset.angle = _wanderAngle;
        _wanderAngle += Math.random() * _wanderRange - _wanderRange * .5;
        var force:Vector2D = center.add(offset);
        _steeringForce = _steeringForce.add(force);
    }
    
    public function avoid(circles:Array<Circle>):Void
    {
        for (i in 0...circles.length)
        {
            
            var circle:Circle = circles[i];
            var heading:Vector2D = _velocity.clone().normalize();
            
            var difference:Vector2D = circle.position().subtract(_position);
            var dotProd:Float = difference.dotProd(heading);
            

            if(dotProd > 0)
            {
          
                var feeler:Vector2D = heading.multiply(_avoidDistance);
       
                var projection:Vector2D = heading.multiply(dotProd);
    
                var dist:Float = projection.subtract(difference).length;
                
                if(dist < circle.radius() + _avoidBuffer && projection.length < feeler.length)
                {

                    var force:Vector2D = heading.multiply(_maxSpeed);
                    force.angle += difference.sign(_velocity) * Math.PI / 2;
    
                    force = force.multiply(1.0 - projection.length /
                                                    feeler.length);
                    
                    _steeringForce = _steeringForce.add(force);

                    _velocity = _velocity.multiply(projection.length / feeler.length);
                }
            }
        }
    }
    
    public function followPath(path:Array<Vector2D>, loop:Bool = false):Void
    {
        var wayPoInt:Vector2D = path[_pathIndex];
        if(wayPoInt == null) return;
        if(_position.dist(wayPoInt) < _pathThreshold)
        {
            if(_pathIndex >= path.length - 1)
            {
                if(loop)
                {
                    _pathIndex = 0;
                }
            }
            else
            {
                _pathIndex++;
            }
        }
        if(_pathIndex >= path.length - 1 && !loop)
        {
            arrive(wayPoInt);
        }
        else
        {
            seek(wayPoInt);
        }
    }
    
    public function flock(vehicles:Array<Vehicle>):Void
    {
        var averageVelocity:Vector2D = _velocity.clone();
        var averagePosition:Vector2D = new Vector2D();
        var inSightCount:Int = 0;
        for (i in 0...vehicles.length)
        {
            var vehicle:Vehicle = cast(vehicles[i], Vehicle);
            if(vehicle != this && inSight(vehicle))
            {
                averageVelocity = averageVelocity.add(vehicle.velocity);
                averagePosition = averagePosition.add(vehicle.position);
                if(tooClose(vehicle)) flee(vehicle.position);
                inSightCount++;
            }
        }
        if(inSightCount > 0)
        {
            averageVelocity = averageVelocity.divide(inSightCount);
            averagePosition = averagePosition.divide(inSightCount);
            seek(averagePosition);
            _steeringForce.add(averageVelocity.subtract(_velocity));
        }
    }
    
    public function inSight(vehicle:Vehicle):Bool		
    {
        if(_position.dist(vehicle.position) > _inSightDist) return false;
        var heading:Vector2D = _velocity.clone().normalize();
        var difference:Vector2D = vehicle.position.subtract(_position);
        var dotProd:Float = difference.dotProd(heading);
        
        if(dotProd < 0) return false;
        return true;
    }
    
    public function tooClose(vehicle:Vehicle):Bool
    {
        return _position.dist(vehicle.position) < _tooCloseDist;
    }
}