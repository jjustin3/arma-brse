/*
  This file handles AI retrieval of items.
*/

0 = [_this] spawn {
  _myharr = _this select 0;
  _myhuman = _myharr select 0;
  _ifItemArifle = -1;
  _ifItemSrifle = -1;
  _ifrhsWeap = -1;
  _ifCUPWeap = -1;
  _ifItemhgun = -1;
  _ifm9 = -1;
  _ifItemSMG = -1;
  _secselweap = 0;
  _selweap = 0;
  _ifItemM320 = -1;
  _ifItemRSP30 = -1;
  _ifItemPYA = -1;
  _ifItemM911A1 = -1;
  _ifMakarovPmm = -1;
  _IfRhsusf_weap = -1;
  _mySym = "";
  _backpackcargo = -1;
  _ifItemCUPhgun = -1;

  _primaryweap = nil;
  _secondaryweap = nil;
  _helmet = nil;
  _vest = nil;
  _backpack = nil;
  _nearbyloot = nearestObjects [position _myhuman, ["BOX_NATO_AmmoOrd_F"], 65];

  // If AI within radius of loot box
  if (count _nearbyloot > 0) then {
    _mycargo = _nearbyloot select 0; // closest loot box
    _wcargo = getWeaponCargo _mycargo;
    _bcargo = (getBackpackCargo _mycargo) select 0;
    _wcargo = _wcargo select 0;

    // TODO* get best weapon, not just the first one
    // Get weapons
    {
      if (_x isKindOf ["Rifle", configFile >> "CfgWeapons"]) then {
        _primaryweap = _x;
      };
      if (_x isKindOf ["Pistol", configFile >> "CfgWeapons"]) then {
        _secondaryweap = _x;
      };
    } foreach _wcargo;

    _mymagazinearray = [];
    _mysecondarymagazinearray = [];
    if (!(isNil "_primaryweap")) then {
      _myhuman addWeapon _primaryweap;
      _mymagazinearray = getArray (configFile >> 'CfgWeapons' >> _primaryweap >> 'magazines');
    };
    if (!(isNil "_secondaryweap")) then {
      _myhuman addWeapon _secondaryweap;
      _mysecondarymagazinearray = getArray (configFile >> 'CfgWeapons' >> _secondaryweap >> 'magazines');
    };

    _myitemCargo = (getItemCargo _mycargo) select 0;
    //_myitemCargo pushBack (_backpack select 0);

    // Get attire
    if((count _myitemCargo) > 0) then {
      _bestHeadArmor = -1;
      _bestBodyArmor = -1;
      {
        _type = getNumber (configFile >> "CfgWeapons" >> _x >> "type");
        if (_type == 131072) then { // if uniform/vest/helmet
          _hitpointName = getText (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "hitpointName");
          if (_hitpointName == "HitBody") then {
            _protection = getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Body" >> "armor");
            if (_protection > _bestBodyArmor) then {
              _vest = _x;
              _bestBodyArmor = _protection;
            }
          };
          if (_hitpointName == "HitHead") then {
            _protection = getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor");
            if (_protection > _bestHeadArmor) then {
              _helmet = _x;
              _bestHeadArmor = _protection;
            }
          };
        };
      } foreach _myitemCargo;

      if (!(isNil "_vest")) then { _myhuman addVest _vest; }; // ! undefined variable??
      if (!(isNil "_helmet")) then { _myhuman addVest _helmet; }; // !
    };

    // TODO* goggles, uniform, etc. (pretty much any other items)

    // TODO* check second return val for getBackpackCargo to see count
    // Get backpack
    if((count _bcargo) > 0) then {
      _bestLoad = -1;
      {
        _load = getContainerMaxLoad _x;
        if (_load > _bestLoad) then {
          _backpack = _x;
          _bestLoad = _load;
        };
      } foreach _bcargo;

      if (!(isNil "_backpack")) then { _myhuman addVest _backpack; };
    };

    sleep 0.5;
    if (count _mymagazinearray > 0) then {
      _mymagazine = _mymagazinearray select 0;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
    };

    if (count _mysecondarymagazinearray > 0) then {
      _mymagazine = _mysecondarymagazinearray select 0;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
    };

    sleep 0.3;
    clearweaponcargo _mycargo;
    clearmagazinecargo _mycargo;
    clearItemCargo _mycargo;
    clearBackpackCargo _mycargo;
    deleteVehicle _mycargo;
  } else {};

  _grp =  group _myhuman;
  deleteWaypoint ((waypoints _grp) select 0);
}
