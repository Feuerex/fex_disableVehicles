class CfgPatches
{
	class fex_DisableVehicles
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Data_F","A3_UI_F_Bootcamp"};
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
				file = "\fex_disableVehicles\functions\code.sqf";
				postInit	= 1;
				recompile	= 1;
			};
		};
	};
};