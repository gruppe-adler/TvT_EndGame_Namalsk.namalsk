/*
Spawnt Gegenstände in Container
null = [this, 5] execVM "server\additems.sqf"		- Box 5 ausgewählt

 Format:
	case 1: {
		_items = [
		"itemwatch", 6,
		"itemcompass", 8

		];
*/

if (!isServer) exitWith {};

//Declare variables (else the switch function wont work)
_items = [];
_backpacks = [];
_weapons = [];
_magazines = [];

_container = (_this select 0);
clearWeaponCargoGlobal _container;
clearItemCargoGlobal _container;
clearMagazineCargoGlobal _container;
clearBackpackCargoGlobal _container;

//=========LIST BOXES========================================

switch (_this select 1) do {

	case 1: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];

	};

	case 2: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 3: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 4: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 5: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 6: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 7: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 8: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 9: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 10: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 11: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 12: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 13: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 14: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 15: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 16: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 17: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 18: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 19: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

	case 20: {
		_items = [

		];

		_backpacks = [

		];

		_weapons = [

		];

		_magazines = [

		];
	};

};


//=========ADD ITEMS=========================================

//count -1 so that it can be used to select from array
_nitems = (count _items) -1;
_nbackpacks = (count _backpacks) -1;
_nweapons = (count _weapons) -1;
_nmagazines = (count _magazines) -1;


//Add items
for [{_x = 0},{_x <= _nitems},{_x = _x + 2}] do {

	_amount = _items select (_x + 1);
	_additem = _items select _x;

	_container additemcargoglobal [_additem, _amount];
};

//Add backpacks
for [{_x = 0},{_x <= _nbackpacks},{_x = _x + 2}] do {

	_amount = _backpacks select (_x + 1);
	_additem = _backpacks select _x;

	_container addbackpackcargoglobal [_additem, _amount];
};

//Add weapons
for [{_x = 0},{_x <= _nweapons},{_x = _x + 2}] do {

	_amount = _weapons select (_x + 1);
	_additem = _weapons select _x;

	_container addweaponcargoglobal [_additem, _amount];
};

//Add magazines
for [{_x = 0},{_x <= _nmagazines},{_x = _x + 2}] do {

	_amount = _magazines select (_x + 1);
	_additem = _magazines select _x;

	_container addmagazinecargoglobal [_additem, _amount];
};
