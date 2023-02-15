# fex_disableVehicles
tiny mod made on request for a cool dude

get it from steam workshop here
https://steamcommunity.com/sharedfiles/filedetails/?id=2933083300


it's actually very simple. The mod adds one new function that initializes at the start of a mission. 


It adds an action to every player.
The action, when activated, searches for all vehicles that:
- are currently crewed by hostile units to the player
- are within 1000m of the player
and removes their ammunition and fuel, to render them inoperable and non-threatening.

This can include player-operated vehicles, if there are teams of players on opposing sides.
Empty and friendly vehicles are not affected.

The action can only be activated once every 10 seconds, to prevent abuse and spamming it, which may cause unintended behavior. The 10 second timeout is shared across all players.

Once activated, the action also gives you a message showing how many vehicles were affected, 

The code's purpose is to provide a "cheat" of sorts, to effectively eliminate the threat of armored vehicles while trying not to break the scenario's logic.
Nevertheless, it is not a guarantee that the scenario will work with this mod active. Use at your own risk.

For other content creators: this mod uses a global variable fex_DHHandle (short for feuerex_disableVehiclesHandle). All other variables and names should be either local to the scripts themselves, or dynamically created as to not clash with any other assets/logic used in the mission.
