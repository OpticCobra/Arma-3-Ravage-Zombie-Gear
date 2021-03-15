_zombie = _this select 0;
sleep 0.5;

_zombieGearChance = round random(40);
_zombieSpecialChance = round random(55);

if(_zombieGearChance == 10) then
{
	_vest = selectRandom["CUP_V_O_SLA_6B3_4_WDL","CUP_V_RUS_6B3_3","CUP_V_B_RRV_Scout","CUP_V_OI_TKI_Jacket2_05","CUP_V_O_SLA_Carrier_Belt02","CUP_V_CPC_weaponsbelt_mc","CUP_V_CZ_vest04","CUP_V_B_Interceptor_Rifleman_M81","CUP_V_CZ_vest02","CUP_V_B_ALICE","CUP_V_B_BAF_MTP_Osprey_Mk4_Webbing","CUP_V_O_Ins_Carrier_Rig_Light","CUP_V_B_Interceptor_Base_Grey","CUP_V_O_SLA_M23_1_OD","CUP_V_B_LHDVest_White","CUP_V_B_PASGT_no_bags_OD","rvg_multipocket_1","rvg_multipocket_2","rvg_multipocket_3","rvg_multipocket_4","CUP_V_RUS_Smersh_1","CUP_V_O_SLA_Carrier_Belt","CUP_V_O_SLA_Carrier_Belt03","CUP_V_O_SLA_Carrier_Belt02"];
	
	_zombie addvest _vest;
};

if(_zombieGearChance == 20) then
{
	_helmet = selectRandom["CUP_H_RUS_Altyn_khaki",'CUP_H_RUS_6B47_goggles_desert','CUP_H_RUS_6B47_SF_headset_desert','CUP_H_RUS_6B27_headset',"CUP_H_RUS_K6_3_Shield_Down_khaki","CUP_H_CZ_Helmet09","CUP_H_RUS_6B47_SF","CUP_H_USArmy_ECH_GCOVEREDMARPAT_des","CUP_H_LWHv2_MARPAT","CUP_H_Ger_M92_Cover_GG_CB","rhs_6b7_1m_bala1_flora","CUP_H_RUS_6B27","CUP_H_RUS_Altyn_Goggles_black","CUP_H_RUS_Balaclava_Ratnik_Headphones","CUP_H_PMC_Beanie_Headphones_Khaki","CUP_H_RUS_SSH68_olive","CUP_H_US_patrol_cap_OD","CUP_H_RUS_SSH68_olive","CUP_H_TKI_Lungee_05","CUP_H_RUS_ZSH_1_Goggles","CUP_H_TK_Beret","CUP_H_RUS_6B47_v2_GogglesDown_Summer","CUP_H_RUS_Balaclava_Ratnik_Headphones","CUP_H_Ger_Cap_EP_Grn2","CUP_H_Ger_M92_GG","CUP_H_CDF_H_PASGT_UN","rhs_6b28_green_bala","rhs_altyn_novisor_ess","rhs_beanie_green","rhs_altyn_novisor_ess_bala","CUP_H_RUS_SSH68_olive","rhsusf_ach_helmet_ucp","CUP_H_CZ_Helmet02","CUP_H_USArmy_HelmetACH_ESS_UCP","CUP_H_SLA_OfficerCap","CUP_H_CDF_H_PASGT_UN","CUP_H_CDF_H_PASGT_MNT"];
	
	_zombie addheadgear _helmet;
};

if(_zombieGearChance == 30) then
{
	_backpack = selectRandom["CUP_B_AlicePack_Bedroll","CUP_B_HikingPack_Civ","CUP_B_GER_Pack_Flecktarn","CUP_B_ACRPara_m95","CUP_B_RUS_Backpack","CUP_B_ACRPara_dpm","CUP_O_RUS_Patrol_bag_Green","CUP_B_RUS_Backpack","CUP_B_ACRPara_dpm"];
	
	_zombie addbackpack _backpack;
};

/* Boomer Zombie */

if(_zombieSpecialChance == 45) then
{
	_zombie setVariable ['BIS_enableRandomization', false];

	removeUniform _zombie;
	removeVest _zombie;
	removeBackpack _zombie;
	removeHeadgear _zombie;
	removeGoggles _zombie;

	_zombie forceAddUniform "CUP_U_O_RUS_Gorka_Green_gloves_kneepads";
	_zombie addVest "V_TacChestrig_cbr_F";
	_zombie addHeadgear "CUP_H_Ger_M92";
	_zombie addGoggles "Mask_M50";

	_zombie addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_strike = "IEDUrbanBig_Remote_Ammo" createVehicle (getpos _unit);
	_strike setdamage 1;    
	removevest _unit;         
	_SuicideBomber setdamage 1; 
	deletevehicle _unit; 
	
	}];
}; 	

/* Police Zombie */

if(_zombieSpecialChance == 35) then
{
	_zombie setVariable ['BIS_enableRandomization', false];

	removeUniform _zombie;
	removeVest _zombie;
	removeBackpack _zombie;
	removeHeadgear _zombie;
	removeGoggles _zombie;

	_zombie forceAddUniform "CUP_U_O_RUS_M88_MSV";
	_zombie addVest "CUP_V_CDF_CrewBelt";
	_zombie addHeadgear "CUP_H_US_patrol_cap_OD";
	_zombie addGoggles "L_Shemagh_Tan";

}; 	

/* Soldier Zombie */

if(_zombieSpecialChance == 40) then
{
	_zombie setVariable ['BIS_enableRandomization', false];

	removeUniform _zombie;
	removeVest _zombie;
	removeBackpack _zombie;
	removeHeadgear _zombie;
	removeGoggles _zombie;

	_zombie forceAddUniform "U_I_E_Uniform_01_F";
	_zombie addVest "V_CarrierRigKBT_01_light_Olive_F";
	_zombie addHeadgear "CUP_H_CZ_Helmet09";
	_zombie addGoggles "G_AirPurifyingRespirator_02_olive_F";

}; 	

/* Brute Zombie */

if(_zombieSpecialChance == 51) then
{
	_pos = getposATL _zombie; 
	_d = getDir _zombie; 
	 
	_zed = createAgent ["zombie_runner", [0,0,0], [], 0, 'NONE']; 
	_zed setVariable ['BIS_enableRandomization', false]; 
	 
	_zed setVariable ['_isBloody', true, true];  
	 
	deleteVehicle _zombie;
	 
	removeUniform _zed; 
	removeVest _zed; 
	removeBackpack _zed; 
	removeHeadgear _zed; 
	removeGoggles _zed; 
	 
	_zed forceAddUniform "U_O_R_Gorka_01_F"; 
	_zed addVest "V_CarrierRigKBT_01_heavy_Olive_F"; 
	_zed addHeadgear "CUP_H_RUS_K6_3_Shield_Down_khaki"; 
	_zed addGoggles "CUP_G_RUS_Balaclava_Ratnik";
	 
	removeBackpack _zed;
	 
	_zed setPosATL _pos; 
	_zed setDir _d; 
	 
	_zed setAnimSpeedCoef 0.8;

}; 	

if(typeOf _zombie == "zombie_bolter") then
{
	_zombie setdamage 0.4;
	_zombie setAnimSpeedCoef 1.4;
	
	removeAllWeapons _zombie;
	removeAllItems _zombie;
	removeAllAssignedItems _zombie;
	removeUniform _zombie;
	removeVest _zombie;
	removeBackpack _zombie;
	removeHeadgear _zombie;
	removeGoggles _zombie;
	
	_zombie forceAddUniform "U_C_CBRN_Suit_01_Blue_F";
	_zombie addBackpack "B_SCBA_01_F";
	_zombie addGoggles "G_AirPurifyingRespirator_01_F";


	_zombie addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	_emitter = "#particlesource" createVehicleLocal (getPos _unit);
	_emitter setParticleClass "ObjectDestructionFire1Smallx";
	_emitter setParticleFire [0.4,2.0,0.2];
	deletevehicle _unit;
	[_emitter] spawn
	{
		_emitter1 = _this select 0;
		sleep 12;
		deletevehicle _emitter1;
	};
	
	}];
	
};
