_myDropPlane = _this select 0;
[_myDropPlane] spawn {
_myDropPlane = _this select 0;
if (count _myDropPlane > 0) then {
_myDropPlane = _myDropPlane select 0;
};
_dist = (position _myDropPlane) distance lastPointPos;
_PlayersDropCount = 10;
_realHumaninDropPlane1 = count (crew _myDropPlane);
dropCount = dropCount +1;
if (_realHumaninDropPlane1 > 20 && dropCount > 3) then {
randomFloorpl1 = 65;
};
if (_realHumaninDropPlane1 > 20 && dropCount > 7) then {
randomFloorpl1 = 10; 
};
if (_realHumaninDropPlane1 < 11 && dropCount > 4) then {
randomFloorpl1 = 50;
_PlayersDropCount = 50;
};
if (_dist < 3400) then {
randomFloorpl1 =0;	
};
_rslp = floor random (2);
sleep _rslp;
{ 
if (_PlayersDropCount < 1) exitWith {};
 _PlayersDropCount = _PlayersDropCount - 1;
 _rolemy = (assignedVehicleRole _x);
 _role = _rolemy select 0;
 isDrop = (floor random(100));
 if(_role == 'cargo' && {_x != player} && {isDrop >randomFloorpl1}) then 
 {  
 _x addBackPack "B_parachute";
  unassignVehicle _x;
  moveOut _x;
 };
} forEach (crew _myDropPlane);
};