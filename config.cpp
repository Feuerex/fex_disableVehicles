class CfgPatches
{
	class fex_DisableVehicles
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Data_F","A3_UI_F_Bootcamp"};
		author[]= {"feuerex"}; 	
		version = "1.0";
		versionAr[] = {1,0};
		versionStr = "1.0";
		mail = "feuerexcz@gmail.com";
	};
};




class CfgFunctions
{
	class FEX
	{
		class disableVehicles
		{
			class mainFunction
			{
				file = "\fex_disableVehicles\functions\action.sqf";
				recompile	= 1;
			};
			class initiateAction
			{
				file = "\fex_disableVehicles\functions\code.sqf";
				postInit	= 1;
				recompile	= 1;
			};
		};
	};
};