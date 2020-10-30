0 = [_this] spawn {
  _myharr = _this select 0;
  _myhuman = _myharr select 0;
  _ifItemArifle = -1;
  _ifItemSrifle = -1;
  _ifrhsWeap = -1;
  _ifCUPWeap = -1;
  _ifItemhgun = -1;
  _ifm9 = -1;
  _ifItemSMG =-1;
  _secselweap = 0;
  _selweap = 0;
  _ifItemM320=-1;
  _ifItemRSP30=-1;
  _ifItemPYA=-1;
  _ifItemM911A1=-1;
  _ifMakarovPmm=-1;
  _IfRhsusf_weap=-1;
  _mySym="";
  _backpackcargo =-1;
  _backpack = -1;
  _ifItemCUPhgun=-1;
  _mycargo = nearestObjects [position _myhuman, ["BOX_NATO_AmmoOrd_F"], 65];

  if (count _mycargo != 0) then {
    _mycargo = _mycargo select 0;
    _wcargo = getWeaponCargo _mycargo;
    _backpackcargo = getBackpackCargo _mycargo;
    _backpack = _backpackcargo select 0;
    _wcargo = _wcargo select 0;
    {
      _ifItemhgun = _x find "hgun_";
      _ifItemCUPhgun = _x find "CUP_hgun_";
      _ifm9 = _x find "rhsusf_weap_m9";
      _ifMakarovPmm = _x find "rhs_weap_makarov_pmm";
      _ifItemM320 = _x find "rhs_weap_M320";
      _ifItemRSP30 = _x find "rhs_weap_rsp30_red";
      _ifItemPYA = _x find "rhs_weap_pya";
      _ifItemM911A1 = _x find "rhsusf_weap_m1911a1";
      if ((_ifm9 == 0) || (_ifItemCUPhgun ==0) ||(_ifMakarovPmm == 0) ||(_ifItemhgun ==0)||(_ifItemM320==0)||(_ifItemRSP30==0)||(_ifItemPYA==0)||(_ifItemM911A1==0)) then {
        _secselweap =_x;
      } else {
        _ifrhsWeap = _x find "rhs_weap";
        _ifCUPWeap = _x find "CUP";
        _ifItemArifle = _x find "arifle_";
        _ifItemSrifle = _x find "srifle_";
        _IfRhsusf_weap = _x find "rhsusf_weap";
        if ((_ifrhsWeap == 0) || (_ifCUPWeap==0) || (_ifItemArifle==0) || (_ifItemSrifle==0) ||(_IfRhsusf_weap==0)) then{
          _selweap = _x;
        };
      };
    } foreach _wcargo;

    _myitemCargo = (getItemCargo _mycargo) select 0;
    _myitemCargo pushBack (_backpack select 0);
    _mymagazinearray = getArray (configFile >> 'CfgWeapons'>> _selweap >> 'magazines');
    _mysecondarymagazinearray = getArray (configFile >> 'CfgWeapons'>> _secselweap >> 'magazines');
    
    if((count _myitemCargo) > 0) then {
      {
        _mySym = _x select [0,9];
        switch(_mySym) do {
          case "rhsusf_mb";
          case "rhsusf_sp";
          case "rhsusf_io": {_myhuman addVest _x;};
          case "rhs_unifo";
          case "U_": {_myhuman addUniform _x;};
          case "rhsusf_op";
          case "rhsusf_hg";
          case "rhs_zsh7a";
          case "rhs_altyn";
          case "rhs_beret";
          case "rhsusf_ac";
          case "rhs_6b47_";
          case "rhs_field";
          case "rhs_6b7_1";
          case "H_": {_myhuman addHeadgear _x;};
          case "rhsusf_fa";
          case "rhsusf_as": {_myhuman addBackpack  _x;};
          case "rhsusf_sh";
          case "G_": {_myhuman addGoggles _x;};
          default {};
        };

        _mySym = _x select [0,8];
          switch(_mySym) do {
          case "rhs_6b13";
          case "rhs_6b23";
          case "rhs_6b26";
          case "rhs_6b27";
          case "rhs_6b28";
          case "rhs_6sh9": {_myhuman addVest _x;};
          case "U_": {_myhuman addUniform _x;};
          case "rhs_6b47";
          case "H_": {_myhuman addHeadgear _x;};
          case "B_": {_myhuman addBackpack  _x;};
          case "G_": {_myhuman addGoggles _x;};
          default {};
        };

        _mySym = _x select [0,6];
          switch(_mySym) do {
          case "CUP_V_": {_myhuman addVest _x;};
          case "CUP_U_": {_myhuman addUniform _x;};
          case "CUP_H_";
          case "H_": {_myhuman addHeadgear _x;};
          case "rhs_si";
          case "rhs_as";
          case "CUP_B_";
          case "B_": {_myhuman addBackpack  _x;};
          case "G_": {_myhuman addGoggles _x;};
          default {};
        };

        _mySym = _x select [0,2];
        switch(_mySym) do {
          case "V_": {_myhuman addVest _x;};
          case "U_": {_myhuman addUniform _x;};
          case "H_": {_myhuman addHeadgear _x;};
          case "B_": {_myhuman addBackpack  _x;};
          case "G_": {_myhuman addGoggles _x;};
          default {_myhuman addItem _x};
        };
      } foreach _myitemCargo;
    };

    sleep 0.5;
    if((count _mymagazinearray) > 0) then {
      _mymagazine = _mymagazinearray select 0;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
    } else {};

    if((count _mysecondarymagazinearray) > 0) then {
      _mymagazine = _mysecondarymagazinearray select 0;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
      _myhuman addMagazine _mymagazine;
    } else {};
    if (isNil _selweap) then {
      _myhuman addWeapon _selweap;
    } else {};
    if (isNil _secselweap) then {
      _myhuman addWeapon _secselweap;
    } else {};

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
