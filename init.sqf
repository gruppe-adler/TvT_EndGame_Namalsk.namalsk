//SETTINGS =====================================================================
USECUSTOMLOADOUTS = true;   //use custom loadouts defined in the loadouts folder?
RESPAWNTIME = 7*60;           //delay before player may respawn
RESPAWNWAVEEXTRATIME = 30;  //time after a wave has respawned, that an additional player may respawn alone in




//SERVER ONLY ==================================================================
if (isServer) then {

  _wshndl = [] execVM "helpers\wavesize.sqf";
  waitUntil {scriptDone _wshndl};

  OPFOR_ELIMINATED = false;
  BLUFOR_ELIMINATED = false;
  publicVariable "OPFOR_ELIMINATED";
  publicVariable "BLUFOR_ELIMINATED";

  mcd_fnc_addDeadPlayerToWave = compile preProcessFileLineNumbers "helpers\fn_addDeadPlayerToWave.sqf";
  mcd_fnc_removeRespawnedFromList = compile preprocessFileLineNumbers "helpers\fn_removeRespawnedFromList.sqf";

  if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
    [] execVM "tfarsettings.sqf";
  };

  [] execVM "server\handleRespawns.sqf";
  [] execVM "server\clearVehicles.sqf";
  [] execVM "server\objLockAndClear.sqf";
  [] execVM "server\transportHelis.sqf";
  [] execVM "server\detectAllDead.sqf";
};
