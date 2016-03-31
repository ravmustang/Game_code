/*
	Author: IT07

	Description:
	puts content into main content area based on data from onLBSelChanged

	Params:
	_this select 0: CONTROL - control of the combobox
	_this select 1: SCALAR - index of selected item

	Returns:
	nothing
*/

private ["_d","_i","_c","_ce","_sc","_co","_cp"];
disableSerialization;
_d = 297; // Display idd
_i = format["%1", (_this select 1) + 1]; // index = given number +1
_c = (findDisplay _d) displayCtrl 1100; // contentControl = control 1100
_ce = ([[_i],["contentArray"]] call SC_fnc_serverInfoMenuGetSetting) select 0;
_sc = "";
{
	_co = ([[_i],[_x]] call SC_fnc_serverInfoMenuGetSetting) select 0;
	_sc = _sc + _co;
	_c ctrlSetStructuredText parseText _sc;
	_cp = ctrlPosition _c;
	_c ctrlSetPosition [_cp select 0, _cp select 1, _cp select 2, ctrlTextHeight _c];
	_c ctrlCommit 0;
} forEach _ce;
