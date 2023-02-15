//if the action was used very recently, exit immediately.
if (fex_DHHandle) exitWIth {};
//set the variable to true to prevent spamming the action.
fex_DHHandle = true;
//parse parameters
params ["_target", "_caller", "_actionId", "_arguments"];
//get all vehicles that are currently in the mission for the client
_allV = vehicles;
//get only vehicles that are close enough and are crewed by hostile units
_filteredV = _allV select {_x distance _target <= 1000 && !([side _target, side _x] call BIS_fnc_sideIsFriendly)};
//remove the vehicle's ammo and fuel, but don't destroy it.
//this should render the vehicle inoperable, but doesn't risk breaking the mission's logic as much
{
	_x setVehicleAmmoDef 0;
	_x setFuel 0;
} forEach _filteredV;
//play a sound
playSoundUI ["A3\Sounds_F\sfx\blip1.wss", 1, 1];
//inform the player (and potentially others from their side) about the action taken.
if (count _filteredV <= 0) then 
{
	[side _target, "Base"] sideChat format ["[MOD INFO]%1 tried to disable nearby enemy vehicles, but none were found!", name _target];
} else 
{
	[side _target, "Base"] sideChat format ["[MOD INFO]%1 disabled %2 nearby enemy vehicles!", name _target, count _filteredV];
};
//mark the area of effect on the map via a marker
_markerName = [name _target, systemTime]joinString "";
_marker = createMarkerLocal [_markerName, getPosASL _target];
_marker setMarkerColorLocal "ColorYellow";
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerSizeLocal [500,500];
_marker setMarkerPos getPosASL _target;
_marker spawn {sleep 5;deleteMarker _this};
//reactivate the global variable so that the action may be used again
uiSleep 10;
fex_DHHandle = false;