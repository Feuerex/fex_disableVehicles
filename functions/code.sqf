//add an extra check so that the mod isn't used in MP servers
//if (isMultiplayer && !isMultiplayerSolo) exitWith { systemChat "Fex_disableVehicles mod doesn't support multiplayer scenarios"};

//get all players
private _allPlayers = call BIS_fnc_listPlayers;
//initiate a global variable to handle the action triggering. It can only work once every 10 s.
fex_DHHandle = false;
//add an action to each player
{
	_x addAction ["Fex_disableVehicles", {_this spawn FEX_fnc_mainFunction}];
	//for MP (COOP, for example) missions, add a respawn event handler to add the action to respawned players
	if (isMultiplayer) then 
	{
		_x addMPEventHandler ["MPRespawn", {(_this select 0) addAction ["Fex_disableVehicles", {_this spawn FEX_fnc_mainFunction}]}];
	};
	
} forEach _allPlayers;
