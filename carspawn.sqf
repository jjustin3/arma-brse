_carPosition = _This select 0;
_randomCar = floor random (69);
_cars = ["O_Quadbike_01_F","C_Quadbike_01_F","B_Quadbike_01_F","I_Quadbike_01_F","B_GEN_Offroad_01_gen_F","B_GEN_Offroad_01_gen_F","C_SUV_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","CUP_C_Datsun","CUP_C_Golf4_black_Civ","CUP_C_Golf4_blue_Civ","CUP_C_Golf4_green_Civ","CUP_C_Golf4_kitty_Civ","CUP_C_Golf4_reptile_Civ","CUP_C_Golf4_camodark_Civ","CUP_C_Octavia_CIV","rhs_uaz_open_MSV_01","CUP_B_LR_Transport_GB_D","CUP_B_LR_Transport_CZ_W","CUP_B_HMMWV_Unarmed_USMC","rhsusf_m1025_d","rhsusf_mrzr4_d","rhsusf_m998_d_s_4dr","rhsusf_m998_w_s_4dr","CUP_O_UAZ_Militia_CSAT","CUP_O_UAZ_Open_CSAT","rhs_uaz_vdv","CUP_O_Volha_SLA","CUP_O_SUV_TKA","I_G_Offroad_01_F","CUP_C_Skoda_Red_CIV","CUP_C_Lada_White_CIV","CUP_C_SUV_CIV","CUP_C_S1203_CIV","CUP_C_LR_Transport_CTK","CUP_C_Volha_Limo_TKCIV","CUP_C_TT650_RU","CUP_C_TT650_RU","CUP_C_TT650_RU","CUP_C_TT650_TK_CIV","CUP_C_TT650_TK_CIV","CUP_C_TT650_TK_CIV"];
if (_randomCar < 43) then {
_mycar = _cars select _randomCar;
_carpos = getPosATL _carPosition;
_zcarpos = _carpos select 2;
_carpos set [2,_zcarpos+0.5];
_createdCar = createVehicle [_mycar,_carpos, [], 0, "NONE"];
clearweaponcargo _createdCar;
clearmagazinecargo _createdCar;
clearItemCargo _createdCar;
clearBackpackCargo _createdCar;
}