/*  Modifies string so that it can be used as a variable for loadouts
*
*/

params ["_inputString"];
private ["_returnString"];

diag_log "====";

_letterIDs = toArray _inputString;
diag_log format ["%1", _letterIDs];
//DELETE BRACKETS ==============================================================
_letterIDs = _letterIDs - [40,41,91,93,123,125];
diag_log format ["%1", _letterIDs];
//SPACES " " --> "_" ===========================================================
_letterIDs = _letterIDs apply {if (_x == 32) then {_x = 95; _x} else {_x}};
diag_log format ["%1", _letterIDs];
//UMLAUTS ======================================================================
_inputString = toString _letterIDs;
diag_log _inputString;

_letterArray = _inputString splitString "";

//Ä ==========
_aumlautID = 0;
while {_aUmlautID != -1} do {
  _returnString = _letterArray joinString "";
  _aUmlautID = [_returnString, "ä"] call CBA_fnc_find;
  if (_aUmlautID != -1) then {
    _letterArray set [_aUmlautID, "ae"];
  };
};

_aumlautID = 0;
while {_aUmlautID != -1} do {
  _returnString = _letterArray joinString "";
  _aUmlautID = [_returnString, "Ä"] call CBA_fnc_find;
  if (_aUmlautID != -1) then {
    _letterArray set [_aUmlautID, "Ae"];
  };
};

//Ü ==========
_uUmlautID = 0;
while {_uUmlautID != -1} do {
  _returnString = _letterArray joinString "";
  _uUmlautID = [_returnString, "ü"] call CBA_fnc_find;
  if (_uUmlautID != -1) then {
    _letterArray set [_uUmlautID, "ue"];
  };
};

_uUmlautID = 0;
while {_uUmlautID != -1} do {
  _returnString = _letterArray joinString "";
  _uUmlautID = [_returnString, "Ü"] call CBA_fnc_find;
  if (_uUmlautID != -1) then {
    _letterArray set [_uUmlautID, "Ue"];
  };
};

//Ö ==========
_oUmlautID = 0;
while {_oUmlautID != -1} do {
  _returnString = _letterArray joinString "";
  _oUmlautID = [_returnString, "ö"] call CBA_fnc_find;
  if (_oUmlautID != -1) then {
    _letterArray set [_oUmlautID, "oe"];
  };
};

_oUmlautID = 0;
while {_oUmlautID != -1} do {
  _returnString = _letterArray joinString "";
  _oUmlautID = [_returnString, "Ö"] call CBA_fnc_find;
  if (_oUmlautID != -1) then {
    _letterArray set [_oUmlautID, "Oe"];
  };
};

//remove 65533 character (produced by splitting strings with Umlauts)
_returnString = _letterArray joinString "";
_IDarray = toArray _returnString;
_IDarray = _IDarray - [65533];
_returnString = toString _IDarray;

//add underscore
_returnString = "_" + _returnString;
_returnString