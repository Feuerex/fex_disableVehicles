//add an extra check so that the mod isn't used in MP servers
//if (isMultiplayer && !isMultiplayerSolo) exitWith { systemChat "Fex_disableVehicles mod doesn't support multiplayer scenarios"};

//get all players
private _allPlayers = call BIS_fnc_listPlayers;
//add an action to each player
{
	_x addAction ["Fex_disableVehicles", 
	{
		//parse IN parameters
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
	}];
} forEach _allPlayers;
