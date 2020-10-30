/*
  This file handles spawning items within loot containers.
*/

_buildingPosition = _This select 0;
_myweapon = "BOX_NATO_AmmoOrd_F";
_ammobox = createVehicle ["BOX_NATO_AmmoOrd_F", _buildingPosition, [], 0, "NONE"];
_mybackpack = "1";
_myitem = "1";
_mypistol = "1";
clearweaponcargo _ammobox;
clearmagazinecargo _ammobox;
clearItemCargo _ammobox;
clearBackpackCargo _ammobox;

// TODO* figure out how to store as objects so you can have cosmetic variation, functional variation, etc.
_weap = "rhs_weap_";

// RIFLES
_rifles = [
  ["ak105", ["_npz"]], // RUSSIAN
  ["ak74m", ["_gp25", "_npz", "_gp25_npz", "_fullplum", "_fullplum_gp25", "_fullplum_npz", "_fullplum_gp25_npz"]],
  ["ak74mr", ["_gp25"]],
  ["ak74n", ["_gp25", "_npz"]],
  ["aks74n", ["_gp25", "_npz", "_2", "_2_npz"]],
  ["aks74un"],
  ["asval_grip", ["_npz"]],
  ["pkp"],
  ["pm63"],
  ["pp2000"],
  ["svdp", ["_npz", "_wd", "_wd_npz"]],
  ["t5000"],
  ["hk416d10", ["_m320", "_LMT", "_LMT_d", "_LMT_wd"]], // AMERICAN
  ["m14", ["_rail", "_ris", "_socom", "_socom_rail"]],
  ["m14ebrri"],
  ["m16a4", ["_carryhandle", "_carryhandle_M203", "_imod", "_imod_M203"]],
  ["xm2010", ["_wd", "_d", "_sa"]],
  ["m24sws", ["_wd", "_d"]],
  ["m249", ["_light_L", "_pip_L", "_pip_L_para", "_light_S", "_pip_S", "_pip_S_para"]],
  ["m27iar"],
  ["m4a1", ["_carryhandle", "_carryhandle_m203", "_blockII", "_blockII_m203", "_blockII_KAC", "_blockII", "_blockII", "_blockII_bk", "_blockII_m203_bk", "_blockII_KAC_bk", "_m203", "_m203s", "_m320"]],
  ["sr25_ec"],
  ["mk17_CQC"],
  ["mk17_LB"],
  ["mk17_STD"],
  ["mk18", ["_m320", "_KAC", "_bk", "_KAC_bk", "_d", "_KAC_d", "_wd", "_KAC_wd"]],
  ["kar98k"], // GREF
  ["m1garand_sa43"],
  ["m3a1", ["_specops"]],
  ["m76"],
  ["mg42"],
  ["m38"],
  ["MP44"],
  ["savz58p", ["_black", "_rail", "_rail_black"]],
  ["savz58v", ["_black", "_rail", "_rail_black", "_ris"]],
  ["vhsd2", ["_ct15x", "_bg_ct15x"]],
  ["vhsk2"],
  ["minimi_para_railed"], // SERBIAN
  ["g36c"],
  ["g36kv", ["_ag36"]],
  ["m21a", ["_pbg40", "_pr", "_pr_pbg40"]],
  ["m21s", ["_pr"]],
  ["scorpion"]
];
_selectionR = selectRandom _rifles;
_myweapon = _weap + (_selectionR select 0);
if (count _selectionR > 1) then {
  _variants = _selectionR select 1;
  _variants pushBack "";
  _variant = selectRandom _variants;
  _myweapon = _myweapon + _variant;
};
_ammobox addWeaponCargo [_myweapon, 1];
_magazinearray = getArray (configFile >> 'CfgWeapons' >> _myweapon >> 'magazines');
_mymagazine = _magazinearray select 0;
_randmagazine = floor (random [1,2,8]);
if (_randmagazine > 0) then {
  _ammobox addMagazineCargo [_mymagazine, _randmagazine];
};

// PISTOLS
_pistols = [
  ["rhs_weap_pb_6p9"], // RUSSIAN
  ["rhs_weap_pya"],
  ["rhs_weap_pp2000_folded"],
  ["rhsusf_weap_glock17g4"], // AMERICAN
  ["rhsusf_weap_m1911a1"],
  ["rhs_weap_M320"],
  ["rhsusf_weap_m9"],
  ["rhs_weap_cz99"] // SERBIAN
];
_selectionP = selectRandom _pistols;
_mypistol = _selectionP select 0;
if (count _selectionP > 1) then {
  _variants = _selectionP select 1;
  _variants pushBack "";
  _variant = selectRandom _variants;
  _mypistol = _mypistol + _variant;
};
_ammobox addWeaponCargo [_mypistol, 1];
_magazinearray = getArray (configFile >> 'CfgWeapons' >> _mypistol >> 'magazines');
_mymagazine = _magazinearray select 0;
_randmagazine = floor (random [1,2,8]);
if (_randmagazine > 0) then {
  _ammobox addMagazineCargo [_mymagazine, _randmagazine];
};

// BACKPACKS
_backpacks = [
  ["rhs_assault_umbts"], // RUSSIAN
  ["rhsusf_assault_eagleaiii_ocp"], // AMERICAN
  ["rhsusf_assault_eagleaiii_coy"],
  ["rhsusf_assault_eagleaiii_ucp"],
  ["rhssaf_alice_md2camo"], // SERBIAN
  ["rhssaf_alice_smb"],
  ["rhssaf_kitbag_digital"],
  ["rhssaf_kitbag_md2camo"],
  ["rhssaf_kitbag_smb"],
  ["B_Carryall_cbr"], // MISC
  ["B_FieldPack_cbr"],
  ["B_FieldPack_khk"],
  ["B_FieldPack_blk"]
];
_selectionB = selectRandom _backpacks;
_mybackpack = _selectionB select 0;
if (count _selectionB > 1) then {
  _variants = _selectionB select 1;
  _variants pushBack "";
  _variant = selectRandom _variants;
  _mybackpack = _mybackpack + _variant;
};
_ammobox addBackPackCargo [_mybackpack, 1];

_itemR = floor (random 49);
switch(_itemR) do {
  case 0: {_myitem = "rhs_6b13_emr_6sh92_radio";};
  case 1: {_myitem = "V_Chestrig_oli";};
  case 2: {_myitem = "V_PlateCarrier1_rgr";};
  case 3: {_myitem = "V_PlateCarrier3_rgr";};
  case 4: {_myitem = "V_TacVest_blk";};
  case 5: {_myitem = "V_PlateCarrier1_blk";};
  case 6: {_myitem = "rhs_6b13_6sh92_headset_mapcase";};
  case 7: {_myitem = "rhs_6b23_6sh116_vog";};
  case 8: {_myitem = "rhs_6b23_6sh92_vog";};
  case 9: {_myitem = "rhs_6b23_digi_6sh92_Spetsnaz";};
  case 10: {_myitem = "rhs_6b23_ML_6sh92_vog";};
  case 11: {_myitem = "rhs_6b26_ess";};
  case 12: {_myitem = "rhs_6b27m_digi_ess_bala";};
  case 13: {_myitem = "rhs_6b28_flora";};
  case 14: {_myitem = "rhs_6sh92_digi_headset";};
  case 15: {_myitem = "rhs_6sh92_vsr_radio";};
  case 16: {_myitem = "rhsusf_mbav";};
  case 17: {_myitem = "rhsusf_mbav_rifleman";};
  case 18: {_myitem = "rhsusf_iotv_ocp_Teamleader";};
  case 19: {_myitem = "rhsusf_iotv_ocp_Rifleman";};
  case 20: {_myitem = "rhsusf_iotv_ucp_Rifleman";};
  case 21: {_myitem = "rhsusf_spc";};
  case 22: {_myitem = "rhsusf_spc_marksman";};
  case 23: {_myitem = "rhsusf_spcs_ocp";};
  case 24: {_myitem = "rhsusf_spcs_ucp_rifleman";};
  case 25: {_myitem = "CUP_V_B_Delta_2";};
  case 26: {_myitem = "CUP_V_B_Eagle_SPC_AT";};
  case 27: {_myitem = "CUP_V_B_Eagle_SPC_Rifleman";};
  case 28: {_myitem = "CUP_V_B_GER_Carrier_Rig_2_Brown";};
  case 29: {_myitem = "CUP_V_B_IOTV_Rifleman";};
  case 30: {_myitem = "CUP_V_B_LHDVest_White";};
  case 31: {_myitem = "CUP_V_B_MTV_Marksman";};
  case 32: {_myitem = "CUP_V_B_RRV_MG";};
  case 33: {_myitem = "CUP_V_BAF_Osprey_Mk2_DPM_Officer";};
  case 34: {_myitem = "CUP_V_CDF_6B3_4_DST";};
  case 35: {_myitem = "CUP_V_CDF_6B3_2_Green";};
  case 36: {_myitem = "CUP_V_I_RACS_Carrier_Vest";};
  case 37: {_myitem = "CUP_V_OI_TKI_Jacket1_06";};
  case 38: {_myitem = "CUP_V_PMC_CIRAS_Winter_Empty";};
  case 39: {_myitem = "CUP_V_PMC_IOTV_Black_Gren";};
  case 40: {_myitem = "CUP_V_RUS_6B3_1";};
  case 41: {_myitem = "CUP_V_RUS_Smersh_2";};
  case 42: {_myitem = "CUP_V_BAF_Osprey_Mk2_DPM_Medic";};
  case 43: {_myitem = "CUP_V_BAF_Osprey_Mk4_MTP_Grenadier";};
  case 44: {_myitem = "CUP_V_OI_TKI_Jacket1_04";};
  case 45: {_myitem = "CUP_V_OI_TKI_Jacket2_03";};
  case 46: {_myitem = "CUP_V_OI_TKI_Jacket2_06";};
  case 47: {_myitem = "CUP_V_OI_TKI_Jacket4_02";};
  case 48: {_myitem = "CUP_V_OI_TKI_Jacket5_04";};
  default {};
};
if (_itemR < 49) then {
  _ammobox addItemCargo [_myitem,1];
};

_unifR = floor (random 80);
switch(_unifR) do {
  case 0: {_myitem = "U_B_CombatUniform_mcam";};
  case 1: {_myitem = "U_B_HeliPilotCoveralls	";};
  case 2: {_myitem = "U_B_Wetsuit";};
  case 3: {_myitem = "U_O_PilotCoveralls";};
  case 4: {_myitem = "U_C_Poloshirt_blue";};
  case 5: {_myitem = "U_Rangemaster";};
  case 6: {_myitem = "U_C_Poloshirt_tricolour";};
  case 7: {_myitem = "U_C_Poloshirt_redwhite";};
  case 8: {_myitem = "U_NikosBody";};
  case 9: {_myitem = "U_B_SpecopsUniform_sgg";};
  case 10: {_myitem = "U_O_CombatUniform_oucamo";};
  case 11: {_myitem = "U_O_SpecopsUniform_ocamo";};
  case 12: {_myitem = "U_O_OfficerUniform_ocamo";};
  case 13: {_myitem = "U_I_CombatUniform";};
  case 14: {_myitem = "U_I_pilotCoveralls";};
  case 15: {_myitem = "U_I_HeliPilotCoveralls";};
  case 16: {_myitem = "U_Competitor";};
  case 17: {_myitem = "U_IG_Guerilla1_1";};
  case 18: {_myitem = "U_IG_Guerilla2_1";};
  case 19: {_myitem = "U_IG_leader";};
  case 20: {_myitem = "U_C_Scientist";};
  case 21: {_myitem = "U_NikosAgedBody";};
  case 22: {_myitem = "U_C_Driver_2";};
  case 23: {_myitem = "U_C_Driver_1_black";};
  case 24: {_myitem = "U_B_GhillieSuit";};
  case 25: {_myitem = "CUP_U_I_GUE_Anorak_01";};
  case 26: {_myitem = "CUP_U_I_GUE_Anorak_02";};
  case 27: {_myitem = "CUP_U_B_BAF_DDPM_Ghillie"};
  case 28: {_myitem = "CUP_U_B_BAF_DDPM_S2_UnRolled";};
  case 29: {_myitem = "CUP_U_B_BAF_DPM_S2_UnRolled";};
  case 30: {_myitem = "CUP_U_B_BAF_MTP_S3_RolledUp";};
  case 31: {_myitem = "CUP_U_B_BAF_MTP_Tshirt";};
  case 32: {_myitem = "CUP_U_B_CDF_DST_2";};
  case 33: {_myitem = "CUP_U_B_CDF_FST_1";};
  case 34: {_myitem = "CUP_U_B_CDF_MNT_2";};
  case 35: {_myitem = "CUP_U_B_CZ_WDL_TShirt";};
  case 36: {_myitem = "CUP_U_B_FR_Light";};
  case 37: {_myitem = "CUP_U_B_FR_Scout3";};
  case 38: {_myitem = "CUP_U_B_GER_Ghillie";};
  case 39: {_myitem = "CUP_U_B_USArmy_Soft";};
  case 40: {_myitem = "CUP_U_B_USMC_FROG2_DMARPAT";};
  case 41: {_myitem = "CUP_U_B_USMC_FROG4_DMARPAT";};
  case 42: {_myitem = "CUP_U_B_USMC_MARPAT_WDL_RolledUp";};
  case 43: {_myitem = "CUP_U_C_Citizen_01";};
  case 44: {_myitem = "CUP_U_C_Citizen_02";};
  case 45: {_myitem = "CUP_U_C_Citizen_04";};
  case 46: {_myitem = "CUP_U_C_Mechanic_02";};
  case 47: {_myitem = "CUP_U_C_Labcoat_03";};
  case 48: {_myitem = "CUP_U_C_Rocker_01";};
  case 49: {_myitem = "CUP_U_C_Rocker_02";};
  case 50: {_myitem = "CUP_U_C_Rocker_03";};
  case 51: {_myitem = "CUP_U_C_Villager_01";};
  case 52: {_myitem = "CUP_U_C_Villager_02";};
  case 53: {_myitem = "CUP_U_C_Villager_03";};
  case 54: {_myitem = "CUP_U_C_Woodlander_03";};
  case 55: {_myitem = "CUP_U_C_Worker_02";};
  case 56: {_myitem = "CUP_U_O_CHDKZ_Bardak";};
  case 57: {_myitem = "CUP_U_O_CHDKZ_Commander";};
  case 58: {_myitem = "CUP_U_O_CHDKZ_Kam_02";};
  case 59: {_myitem = "CUP_U_O_CHDKZ_Lopotev";};
  case 60: {_myitem = "CUP_U_O_RUS_EMR_1";};
  case 61: {_myitem = "CUP_U_O_RUS_EMR_1_VDV";};
  case 62: {_myitem = "CUP_U_O_RUS_Ghillie";};
  case 63: {_myitem = "CUP_U_O_RUS_Gorka_Partizan_A";};
  case 64: {_myitem = "rhs_uniform_vmf_flora";};
  case 65: {_myitem = "CUP_U_O_Woodlander_02";};
  case 67: {_myitem = "CUP_U_C_Profiteer_03";};
  case 68: {_myitem = "CUP_U_I_RACS_mech_1";};
  case 69: {_myitem = "CUP_U_I_RACS_Urban_1";};
  case 70: {_myitem = "CUP_U_I_RACS_Urban_2";};
  case 71: {_myitem = "rhs_uniform_cu_ocp_101st";};
  case 72: {_myitem = "rhs_uniform_cu_ucp_10th";};
  case 73: {_myitem = "rhs_uniform_emr_des_patchless";};
  case 74: {_myitem = "rhs_uniform_FROG01_d";};
  case 75: {_myitem = "rhs_uniform_g3_mc";};
  case 76: {_myitem = "rhs_uniform_m88_patchless";};
  case 77: {_myitem = "rhs_uniform_msv_emr";};
  case 78: {_myitem = "rhs_uniform_vdv_emr";};
  case 79: {_myitem = "rhs_uniform_vdv_flora";};
};
if (_unifR < 80) then {
  _ammobox addItemCargo [_myitem,1];
};

// TODO* add more helmets
// HELMETS
_helmets = [
  ["rhs_6b26", ["_green"]], // RUSSIAN
  ["rhs_beret_mp2"],
  ["rhs_beanie_green"],
  ["rhs_ssh68"],
  ["rhsusf_ach", ["_bare", "_bare_des", "_bare_tan", "_bare_semi", "_bare_wood", "_helmet_m82", "_helmet_ocp"]], // AMERICAN
  ["rhsgref_6b27m_ttsko", ["_digi", "_forest", "_mountain", "_urban"]], // GREF
  ["rhssaf_bandana_smb"], // SERBIAN
  ["rhssaf_m97_digital"]
];
_selectionH = selectRandom _helmets;
_myhelmet = _selectionH select 0;
if (count _selectionH > 1) then {
  _variants = _selectionH select 1;
  _variants pushBack "";
  _variant = selectRandom _variants;
  _myhelmet = _myhelmet + _variant;
};
_ammobox addItemCargo [_myhelmet, 1];

_itemR = floor (random (74));
switch(_itemR) do {
  case 0: {_myitem = "ItemGPS";};
  case 1: {_myitem = "ItemRadio";};
  case 2: {_myitem = "NVGoggles";};
  case 3: {_myitem = "muzzle_snds_H";};
  case 4: {_myitem = "optic_Arco";};
  case 5: {_myitem = "optic_SOS";};
  case 6: {_myitem = "acc_flashlight";};
  case 7: {_myitem = "optic_NVS";};
  case 8: {_myitem = "optic_Nightstalker";};
  case 9: {_myitem = "optic_tws";};
  case 10: {_myitem = "optic_LRPS";};
  case 11: {_myitem = "optic_Holosight";};
  case 12: {_myitem = "NVGoggles_INDEP";};
  case 13: {_myitem = "Chemlight_green";};
  case 14: {_myitem = "Chemlight_red";};
  case 15: {_myitem = "Chemlight_yellow";};
  case 16: {_myitem = "Chemlight_blue";};
  case 17: {_myitem = "3Rnd_HE_Grenade_shell";};
  case 18: {_myitem = "1Rnd_SmokePurple_Grenade_shell";};
  case 19: {_myitem = "HandGrenade";};
  case 20: {_myitem = "optic_Hamr";};
  case 21: {_myitem = "optic_Aco";};
  case 22: {_myitem = "optic_Aco_smg";};
  case 23: {_myitem = "optic_Holosight_smg";};
  case 24: {_myitem = "optic_MRCO";};
  case 25: {_myitem = "optic_DMS";};
  case 26: {_myitem = "muzzle_snds_338_black";};
  case 27: {_myitem = "bipod_01_F_blk";};
  case 28: {_myitem = "Binocular";};
  case 29: {_myitem = "Rangefinder";};
  case 30: {_myitem = "Laserdesignator";};
  case 31: {_myitem = "rhs_acc_1p29";};
  case 32: {_myitem = "rhs_acc_1p29_asval";};
  case 33: {_myitem = "rhs_acc_1p78";};
  case 34: {_myitem = "rhs_acc_1pn34";};
  case 35: {_myitem = "rhs_acc_1pn93_2";};
  case 36: {_myitem = "rhs_acc_2dpZenit";};
  case 37: {_myitem = "rhs_acc_dtk";};
  case 38: {_myitem = "rhs_acc_dtk3";};
  case 39: {_myitem = "rhs_acc_ekp8_02";};
  case 40: {_myitem = "rhs_acc_ekp8_18c";};
  case 41: {_myitem = "rhs_acc_perst1ik";};
  case 42: {_myitem = "rhs_acc_pgo7v_asval";};
  case 43: {_myitem = "rhs_acc_pgo7v";};
  case 44: {_myitem = "rhs_acc_pkas";};
  case 45: {_myitem = "rhs_acc_pso1m21";};
  case 46: {_myitem = "rhs_acc_pso1m21_svd";};
  case 47: {_myitem = "rhsusf_acc_ACOG";};
  case 48: {_myitem = "rhsusf_acc_ACOG_d_3d";};
  case 49: {_myitem = "rhsusf_acc_ACOG_RMR";};
  case 50: {_myitem = "rhsusf_acc_ACOG2";};
  case 51: {_myitem = "rhsusf_acc_anpeq15";};
  case 52: {_myitem = "rhsusf_acc_anpeq15_light_h";};
  case 53: {_myitem = "rhsusf_acc_ELCAN";};
  case 54: {_myitem = "rhsusf_acc_EOTECH";};
  case 55: {_myitem = "rhsusf_acc_g33_T1";};
  case 56: {_myitem = "rhsusf_acc_grip2";};
  case 57: {_myitem = "rhsusf_acc_grip4";};
  case 58: {_myitem = "rhsusf_acc_LEUPOLDMK4";};
  case 59: {_myitem = "rhsusf_acc_M2010S_d";};
  case 60: {_myitem = "rhsusf_acc_M2A1";};
  case 61: {_myitem = "rhsusf_acc_M8541_low_d";};
  case 62: {_myitem = "rhsusf_acc_nt4_tan";};
  case 63: {_myitem = "rhsusf_acc_rotex_mp7_desert";};
  case 64: {_myitem = "rhsusf_acc_SpecterDR_A_3d";};
  case 65: {_myitem = "rhsusf_acc_SpecterDR_D_3D";};
  case 66: {_myitem = "rhsusf_acc_SR25S";};
  case 67: {_myitem = "rhsusf_acc_T1_high";};
  case 68: {_myitem = "rhsusf_acc_T1_low_fwd";};
  case 69: {_myitem = "CUP_acc_Flashlight";};
  case 70: {_myitem = "CUP_acc_ANPEQ_2";};
  case 71: {_myitem = "CUP_acc_sffh";};
  case 72: {_myitem = "rhsusf_lerca1200_black";};
  case 73: {_myitem = "rhsusf_vector21";};
  default {};
};
if (_itemR < 74) then {
  _ammobox addItemCargo [_myitem,1];
};

_rAmmo = floor (random (17));
switch(_rAmmo) do {
  case 0: {_myitem = "FirstAidKit";};
  case 1: {_myitem = "30Rnd_65x39_caseless_mag";};
  case 2: {_myitem = "20Rnd_762x51_Mag";};
  case 3: {_myitem = "30Rnd_9x21_Mag	";};
  case 4: {_myitem = "30Rnd_556x45_Stanag	";};
  case 5: {_myitem = "HandGrenade";};
  case 6: {_myitem = "SmokeShell";};
  case 7: {_myitem = "SmokeShellGreen";};
  case 8: {_myitem = "FirstAidKit";};
  case 9: {_myitem = "MineDetector";};
  case 10: {_myitem = "rhsusf_acc_grip2";};
  case 11: {_myitem = "rhsusf_acc_harris_bipod";};
  case 12: {_myitem = "rhsusf_acc_rvg_blk";};
  case 13: {_myitem = "rhs_acc_grip_rk2";};
  case 14: {_myitem = "";};
};
if (_rAmmo < 10) then {
  _ammobox addItemCargo [_myitem,1];
};

if ((_itemR > 35) && (_weaponR > 38) && (_backpackR > 9)) then {
  deleteVehicle _ammobox;
};
