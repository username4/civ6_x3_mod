
---------------------------------------------------------
---------------------------------------------------------
--MOD CIVS
---------------------------------------------------------
---------------------------------------------------------

---------------------------------------------------------
---------------------------------------------------------
--Campus Metropolitan
---------------------------------------------------------
---------------------------------------------------------



--science and gold bonus
UPDATE ModifierArguments
SET Value = 30
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_CIVILIZATION_GAKUINTOSHI_SCIENCE_BONUS';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_CIVILIZATION_GAKUINTOSHI_CITY_GOLD';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_CIVILIZATION_GAKUINTOSHI_CITY_SCIENCE';

--KENKYUJO
UPDATE Districts
SET Cost = 8
WHERE DistrictType = 'DISTRICT_KENKYUJO';

INSERT INTO AdJacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentFeature)
SELECT 'KENKYUJO_JUNGLE_GOLD' , 'LOC_DISTRICT_JUNGLE_GOLD' , 'YIELD_GOLD' , 2 , 2 , 'FEATURE_JUNGLE'
WHERE EXISTS  (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_GAKUINTOSHI');
INSERT INTO AdJacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentFeature)
SELECT 'KENKYUJO_JUNGLE_PRODUCTION' , 'LOC_DISTRICT_JUNGLE_PRODUCTION' , 'YIELD_PRODUCTION' , 2 , 2 , 'FEATURE_JUNGLE'
WHERE EXISTS  (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_GAKUINTOSHI');
INSERT INTO AdJacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, OtherDistrictAdjacent)
SELECT 'KENKYUJO_DISTRICT_PRODUCTION' , 'LOC_DISTRICT_JUNGLE_PRODUCTION' , 'YIELD_PRODUCTION' , 2 , 2 , 1
WHERE EXISTS  (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_GAKUINTOSHI');

INSERT INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT 'DISTRICT_KENKYUJO', 'KENKYUJO_JUNGLE_GOLD'
WHERE EXISTS  (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_GAKUINTOSHI');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId)	
SELECT 'DISTRICT_KENKYUJO', 'KENKYUJO_JUNGLE_PRODUCTION'
WHERE EXISTS  (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_GAKUINTOSHI');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId)	
SELECT 'DISTRICT_KENKYUJO', 'KENKYUJO_DISTRICT_PRODUCTION'
WHERE EXISTS  (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_GAKUINTOSHI');	

UPDATE AdJacency_YieldChanges
SET YieldChange = 3
WHERE ID = 'Mountains_Production1'
OR ID = 'Mountains_Production2'
OR ID = 'Mountains_Production3'
OR ID = 'Mountains_Production4'
OR ID = 'Mountains_Production5';

UPDATE AdJacency_YieldChanges
SET YieldChange = 3
WHERE ID = 'Mountains_Gold1'
OR ID = 'Mountains_Gold2'
OR ID = 'Mountains_Gold3'
OR ID = 'Mountains_Gold4'
OR ID = 'Mountains_Gold5';

UPDATE District_CitizenYieldChanges
SET YieldChange = 3
WHERE YieldType = 'YIELD_PRODUCTION'
AND DistrictType = 'DISTRICT_KENKYUJO'; 

--Lv 5 Judgement
UPDATE Units 
SET BaseSightRange = 5 , BaseMoves = 6
WHERE UnitType = 'UNIT_LV5_JUDGEMENT';

--Imouto
UPDATE Units 
SET Maintenance = 3 , Cost = 370
WHERE UnitType = 'UNIT_MIKASA_SISTERS';


--Misaka
UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'MIKASA_LONG_RANGE';

---------------------------------------------------------
---------------------------------------------------------
--Konosuba Aqua
---------------------------------------------------------
---------------------------------------------------------

--combat buffs
UPDATE ModifierArguments
SET Value = 19
WHERE ModifierId = 'CONS_AXIS_CULT_RELIGIOUS_COMBAT_BUFF';

UPDATE ModifierArguments
SET Value = 19
WHERE ModifierId = 'CONS_AXIS_CULT_APOSTLE_UNIT_COMBAT';

UPDATE ModifierArguments
SET Value = 10
WHERE ModifierId = 'CONS_AXIS_CULT_MISSIONARY_UNIT_COMBAT';

--Arch Priest
UPDATE ModifierArguments
SET Value = 24
WHERE Name = 'Amount'
AND ModifierId LIKE 'CONS_AXIS_CULT_PRIEST_STRENGTH_%';

--Kachoufuugetsu
UPDATE Improvements
SET Appeal = 3 
WHERE ImprovementType = 'IMPROVEMENT_CONS_KACHOUFUUGETSU';

UPDATE AdJacency_YieldChanges
SET YieldChange = 3
WHERE ID = 'Farms_Cons_Kachoufuugetsu1Adjacency';

UPDATE AdJacency_YieldChanges
SET YieldChange = 6
WHERE ID = 'Farms_Cons_Kachoufuugetsu2Adjacency';

--Aqua
UPDATE ModifierArguments
SET Value = 6
WHERE ModifierId = 'TRAIT_LEADER_CONS_AQUA_ADJACENT_RIVER_HOUSING_BONUS_MODIFIER';

---------------------------------------------------------
---------------------------------------------------------
--Konosuba Megumin
---------------------------------------------------------
---------------------------------------------------------

--Crimson Magic Clan's Magic Talent
UPDATE ModifierArguments
SET Value = 150
WHERE ModifierId = 'TRAIT_CIVILIZATION_CONS_CRIMSON_MAGIC_CLAN_RANGED_UNIT_XP_BONUS_MOD';

UPDATE ModifierArguments
SET Value = 13
WHERE ModifierId = 'TRAIT_CIVILIZATION_CONS_CRIMSON_MAGIC_CLAN_RANGED_UNIT_INCREASE_STRENGTH_MOD';

--Arch Wizard
UPDATE ModifierArguments
SET Value = 23
WHERE Name = 'Amount'
AND ModifierId LIKE 'CONS_CMC_WIZARD_STRENGTH_%';

--Crimson Magic Village
UPDATE Districts
SET Cost = 8
WHERE DistrictType = 'DISTRICT_CONS_CMC_VILLAGE';

UPDATE ModifierArguments
SET Value = 75
WHERE ModifierId = 'TRAIT_DISTRICT_CONS_CMC_VILLAGE_UNIT_XP_BONUS';

UPDATE Adjacency_YieldChanges
SET YieldChange = 3
WHERE ID = 'Cons_CMC_Village_District_Gold';

--Make Magic Stuff
UPDATE Project_YieldConversions
SET PercentOfProductionRate = 90
WHERE ProjectType = 'PROJECT_ENHANCE_DISTRICT_CONS_CMC_VILLAGE';

--Cast Explosion Magic
UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'PROJECT_COMPLETION_MODIFIER_CREATE_CONS_EXPLOSION_MAGIC';

--Megumin
UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId LIKE 'TRAIT_LEADER_CONS_MEGUMIN_CREATE_EXPLOSION_MAGIC_AT_%';

---------------------------------------------------------
---------------------------------------------------------
--No Game No Live Imanity
---------------------------------------------------------
---------------------------------------------------------

--Production Bonus
UPDATE ModifierArguments 
SET Value = 500
WHERE Name = 'Amount'
AND (ModifierId = 'TRAIT_CIVILIZATION_CONS_IMANITY_INCREASE_SETTLER_PRODUCTION'
OR ModifierId = 'TRAIT_CIVILIZATION_CONS_IMANITY_INCREASE_RANGER_PRODUCTION'
OR ModifierId = 'TRAIT_CIVILIZATION_CONS_IMANITY_INCREASE_SCOUT_PRODUCTION');

--Scout
UPDATE Units 
SET BaseSightRange = 5 , BaseMoves = 6
WHERE UnitType = 'UNIT_CONS_IMANITY_SCOUT';

--Elchea
UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'CONS_ELCHEA_LIBRARY_GRANT_RANDOM_TECHNOLOGY_BOOST';

--Sora
UPDATE ModifierArguments 
SET Value = 38
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_LEADER_CONS_SORA_INCREASE_ENEMY_WAR_WEARINESS';

UPDATE ModifierArguments 
SET Value = -48
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_LEADER_CONS_SORA_DECREASE_WAR_WEARINESS';

INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_CONS_SORA' , 'TRAIT_LEADER_CONS_SORA_REPLACE_MILITARY_SLOT_WITH_WILDCARD_1'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_CONS_SORA');
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_CONS_SORA' , 'TRAIT_LEADER_CONS_SORA_REPLACE_DIPLOMATIC_SLOT_WITH_WILDCARD_1'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_CONS_SORA');
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_CONS_SORA' , 'TRAIT_LEADER_CONS_SORA_REPLACE_MILITARY_SLOT_WITH_WILDCARD_2'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_CONS_SORA');
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_CONS_SORA' , 'TRAIT_LEADER_CONS_SORA_REPLACE_DIPLOMATIC_SLOT_WITH_WILDCARD_2'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_CONS_SORA');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
	('TRAIT_LEADER_CONS_SORA_REPLACE_MILITARY_SLOT_WITH_WILDCARD_1' , 'MODIFIER_PLAYER_CULTURE_REPLACE_GOVERNMENT_SLOTS'),
	('TRAIT_LEADER_CONS_SORA_REPLACE_MILITARY_SLOT_WITH_WILDCARD_2' , 'MODIFIER_PLAYER_CULTURE_REPLACE_GOVERNMENT_SLOTS'),
	('TRAIT_LEADER_CONS_SORA_REPLACE_DIPLOMATIC_SLOT_WITH_WILDCARD_1' , 'MODIFIER_PLAYER_CULTURE_REPLACE_GOVERNMENT_SLOTS'),
	('TRAIT_LEADER_CONS_SORA_REPLACE_DIPLOMATIC_SLOT_WITH_WILDCARD_2' , 'MODIFIER_PLAYER_CULTURE_REPLACE_GOVERNMENT_SLOTS');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES
	('TRAIT_LEADER_CONS_SORA_REPLACE_MILITARY_SLOT_WITH_WILDCARD_1' , 'ReplacedGovernmentSlotType' , 'SLOT_MILITARY' ),
	('TRAIT_LEADER_CONS_SORA_REPLACE_MILITARY_SLOT_WITH_WILDCARD_2' , 'ReplacedGovernmentSlotType' , 'SLOT_MILITARY' ),
	('TRAIT_LEADER_CONS_SORA_REPLACE_MILITARY_SLOT_WITH_WILDCARD_1' , 'AddedGovernmentSlotType' , 'SLOT_WILDCARD' ),
	('TRAIT_LEADER_CONS_SORA_REPLACE_MILITARY_SLOT_WITH_WILDCARD_2' , 'AddedGovernmentSlotType' , 'SLOT_WILDCARD' ),
	('TRAIT_LEADER_CONS_SORA_REPLACE_DIPLOMATIC_SLOT_WITH_WILDCARD_1' , 'ReplacedGovernmentSlotType' , 'SLOT_DIPLOMATIC' ),
	('TRAIT_LEADER_CONS_SORA_REPLACE_DIPLOMATIC_SLOT_WITH_WILDCARD_2' , 'ReplacedGovernmentSlotType' , 'SLOT_DIPLOMATIC' ),
	('TRAIT_LEADER_CONS_SORA_REPLACE_DIPLOMATIC_SLOT_WITH_WILDCARD_1' , 'AddedGovernmentSlotType' , 'SLOT_WILDCARD' ),
	('TRAIT_LEADER_CONS_SORA_REPLACE_DIPLOMATIC_SLOT_WITH_WILDCARD_2' , 'AddedGovernmentSlotType' , 'SLOT_WILDCARD' );

--Shiro
UPDATE ModifierArguments 
SET Value = 24
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_LEADER_CONS_SHIRO_TECHNOLOGY_BOOST';

UPDATE ModifierArguments 
SET Value = 150
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_LEADER_CONS_SHIRO_DOUBLE_SCIENTIST_POINTS';

--Stephanie 
UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND (ModifierId = 'TRAIT_LEADER_CONS_STEPHANIE_ADJUST_INFLUENCE_POINTS_AT_POLITICAL_PHILOSOPHY'
OR ModifierId = 'TRAIT_LEADER_CONS_STEPHANIE_ADJUST_INFLUENCE_POINTS_AT_DIPLOMATIC_SERVICE');

--will not add the +10 slots on diplomatic service, because no way to fill 20 slots
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_CONS_STEPHANIE' , 'TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_POLITICAL_PHILOSOPHY_1'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_CONS_STEPHANIE');
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_CONS_STEPHANIE' , 'TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_POLITICAL_PHILOSOPHY_2'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_CONS_STEPHANIE');
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_CONS_STEPHANIE' , 'TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_DIPLOMATIC_SERVICE_1'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_CONS_STEPHANIE');
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_CONS_STEPHANIE' , 'TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_DIPLOMATIC_SERVICE_2'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_CONS_STEPHANIE');


INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
	('TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_POLITICAL_PHILOSOPHY_1' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
	('TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_POLITICAL_PHILOSOPHY_2' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
	('TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_DIPLOMATIC_SERVICE_1' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
	('TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_DIPLOMATIC_SERVICE_2' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES
	('TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_POLITICAL_PHILOSOPHY_1' , 'GovernmentSlotType' , 'SLOT_DIPLOMATIC' ),
	('TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_POLITICAL_PHILOSOPHY_2' , 'GovernmentSlotType' , 'SLOT_DIPLOMATIC' ),
	('TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_DIPLOMATIC_SERVICE_1' , 'GovernmentSlotType' , 'SLOT_DIPLOMATIC' ),
	('TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_DIPLOMATIC_SERVICE_2' , 'GovernmentSlotType' , 'SLOT_DIPLOMATIC' );

---------------------------------------------------------
---------------------------------------------------------
--CotR
---------------------------------------------------------
---------------------------------------------------------

---------------------------------------------------------
---------------------------------------------------------
--Gondor
---------------------------------------------------------
---------------------------------------------------------

--stoneworks 50 + 10*3 = 80 defense, +3 culture per era
UPDATE Buildings
SET OuterDefenseHitPoints = 73
WHERE  BuildingType = 'BUILDING_NUMENORIAN_STONEWORK';

UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId LIKE 'NUMENORIANSTONEWORK_%_CULTURE';

--Guard: 10x def bonus, atk lower, cost = 200 + 50*10=750, STR= 41+4*10, garrison bonus
UPDATE Units 
SET Cost = 350 , Combat = 53
WHERE UnitType =  'UNIT_CITADEL_GUARD';

UPDATE ModifierArguments 
SET Value = 15
WHERE Name = 'Amount'
AND ModifierId = 'COTR_UNIT_STRONG_WHEN_DEFENDING';

UPDATE ModifierArguments 
SET Value = -15
WHERE Name = 'Amount'
AND ModifierId = 'COTR_UNIT_WEAK_WHEN_ATTACKING';

UPDATE ModifierArguments 
SET Value = 24
WHERE Name = 'Amount'
AND ModifierId = 'GARRISON_BONUS_DISTRICTS';


--legacy o N: 10 housing for walls, districts 250% faster 
UPDATE ModifierArguments 
SET Value = 75
WHERE Name = 'Amount'
AND ModifierId LIKE 'NUMENORLEGACY_BOOST_%_PRODUCTION';


UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId LIKE 'NUMENORLEGACY_%_HOUSING';

--aragorn II: 3 dipl slot, dunedain ranger, STR = 10+5*10
UPDATE Units 
SET Combat = 23
WHERE UnitType =  'UNIT_DUNEDAIN_RANGER';

--For some Reasoin the mod author seems to add military slot and then converts it to diplomatic
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_REUNITED_KINGDOM' , 'ARAGORN_MILITARY_GOVERNMENT_SLOT_1'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_REUNITED_KINGDOM');
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_REUNITED_KINGDOM' , 'ARAGORN_MILITARY_GOVERNMENT_SLOT_2'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_REUNITED_KINGDOM');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
	('ARAGORN_MILITARY_GOVERNMENT_SLOT_1' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
	('ARAGORN_MILITARY_GOVERNMENT_SLOT_2' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES
	('ARAGORN_MILITARY_GOVERNMENT_SLOT_1' , 'GovernmentSlotType' , 'SLOT_DIPLOMATIC' ),
	('ARAGORN_MILITARY_GOVERNMENT_SLOT_2' , 'GovernmentSlotType' , 'SLOT_DIPLOMATIC' );

---------------------------------------------------------
---------------------------------------------------------
--Rohan
---------------------------------------------------------
---------------------------------------------------------

--Stables
UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND (ModifierId = 'ROYAL_STABLE_PROVIDE_HORSES'
OR ModifierId = 'ROYAL_STABLE_PASTURE_GOLD');

--HouseLords
UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND (ModifierId = 'HORSELORD_FARM_PRODUCTION'
OR ModifierId = 'HORSELORD_FARM_FOOD'
OR ModifierId = 'THEODEN_CAVALRY_MOVEMENT');

--Rohirrim Rider Cost=180*(150/180)^3, Combat= 48+4*3
UPDATE Units
SET Cost = 104 , Combat = 58 , BuildCharges = 6
WHERE UnitType = 'UNIT_ROHIRRIM';


---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_SILVAN
---------------------------------------------------------
---------------------------------------------------------

--Sanctuaries
UPDATE ModifierArguments 
SET Value = 6
WHERE Name = 'Amount'
AND ModifierId = 'SILVAN_BREATHTAKING_CITY_CULTURE';

UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'YieldChange'
AND ModifierId = 'SILVAN_CHARMING_CITY_CULTURE';

UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'SILVAN_FOREST_FAITH';

--Treehouse
UPDATE ModifierArguments 
SET Value = 6
WHERE Name = 'Amount'
AND ModifierId = 'TREEHOUSE_RIVERADJACENCY_FAITH';

UPDATE Improvements
SET DefenseModifier = 12
WHERE ImprovementType = 'IMPROVEMENT_TREEHOUSE';

UPDATE Improvement_YieldChanges
SET YieldChange = 3
WHERE ImprovementType = 'IMPROVEMENT_TREEHOUSE';

UPDATE Improvement_BonusYieldChanges
SET BonusYieldChange = 3
WHERE ImprovementType = 'IMPROVEMENT_TREEHOUSE';

UPDATE Adjacency_YieldChanges
SET YieldChange = 3
WHERE ID = 'Treehouse_DistrictCulture_early'
OR ID = 'Treehouse_DistrictCulture_late';

--Galadhrim +30 ranged and melee
UPDATE Units
SET RangedCombat = 48 , Combat = 38
WHERE UnitType = 'UNIT_GALADHRIM';

UPDATE Units
SET RangedCombat = 48 , Combat = 38
WHERE UnitType = 'UNIT_SENTINEL';

UPDATE ModifierArguments 
SET Value = 15
WHERE Name = 'Amount'
AND ModifierId = 'GALADHRIM_DOMESTIC_BONUS';

--Galadriel
UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'GOLDENLADY_FOREST_APPEAL';

UPDATE Buildings
SET OuterDefenseStrength = 13 , OuterDefenseHitPoints = 24
WHERE BuildingType = 'BUILDING_LORIENDEFENSE';

--Thranduil
UPDATE ModifierArguments 
SET Value = 30
WHERE Name = 'Amount'
AND ModifierId = 'MIRKWOOD_UNIT_FOREST_HEAL_MODIFIER';

UPDATE ModifierArguments 
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'MIRKWOOD_RANGED_UNITS_BONUS';

---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_ISENGARD
---------------------------------------------------------
---------------------------------------------------------

--Machine of War
UPDATE ModifierArguments 
SET Value = 150
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_SIEGE_UNIT_PRODUCTION'
OR ModifierId = 'TRAIT_SUPPORT_UNIT_PRODUCTION'
OR ModifierId = 'MACHINE_OF_WAR_BOOST_INDUSTRIAL_ZONE_PRODUCTION';

UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'MACHINE_OF_WAR_STRATEGIC_RESOURCE_SCIENCE';

UPDATE ModifierArguments 
SET Value = 'CIVIC_MILITARY_TRADITION'
WHERE Name = 'CivicType'
AND ModifierId = 'TRAIT_LAND_ARMIES_EARLY';

UPDATE ModifierArguments 
SET Value = 'CIVIC_MILITARY_TRAINING'
WHERE Name = 'CivicType'
AND ModifierId = 'TRAIT_LAND_CORPS_EARLY';

--Ballista +13 STR, +8 Bombard
UPDATE Units
SET Combat = 38, Bombard = 44
WHERE UnitType = 'UNIT_BALLISTA';

--Pits
UPDATE Building_YieldChanges
SET YieldChange = 6
WHERE BuildingType = 'BUILDING_URUKPITS';

--Saruman
UPDATE ModifierArguments 
SET Value = 75
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_BARBARIAN_FAITH_DISPERSAL';

UPDATE ModifierArguments 
SET Value = 30
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_BARBARIAN_FAITH_DISPERSAL_CLASSICAL_SCALING';

UPDATE ModifierArguments 
SET Value = 60
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_BARBARIAN_FAITH_DISPERSAL_MEDIEVAL_SCALING';

UPDATE ModifierArguments 
SET Value = 75
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_BARBARIAN_FAITH_DISPERSAL_CLASSICAL_SCALING';

UPDATE ModifierArguments 
SET Value = 90
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_BARBARIAN_FAITH_DISPERSAL_RENAISSANCE_SCALING';

UPDATE ModifierArguments 
SET Value = 90
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_BARBARIAN_FAITH_DISPERSAL_INDUSTRIAL_SCALING';

UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_SPY_OFFENSE_LEVEL';

---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_MORDOR
---------------------------------------------------------
---------------------------------------------------------

--Where Shadows lie
/*
UPDATE ModifierArguments 
SET Value = 100
WHERE Name = 'Amount'
AND ModifierId = 'WHERE_THE_SHADOWS_LIE_UNIT_MAINTENANCE_DISCOUNT';

UPDATE ModifierArguments 
SET Value = 250
WHERE Name = 'Amount'
AND ModifierId = 'WHERE_THE_SHADOWS_LIE_UNIT_PRODUCTION';
*/
--Mumak 
UPDATE Units 
SET Combat = 68
WHERE UnitType = 'UNIT_OLOG_HAI';
--Wasteland
UPDATE District_CitizenYieldChanges
SET YieldChange = 3
WHERE DistrictType = 'DISTRICT_WASTELAND';

--nazgul (1-0,8^10 heal)
UPDATE ModifierArguments 
SET Value = Value*3
WHERE Name = 'Amount'
AND (ModifierId = 'DARK_LIEUTENANT_AOE_BUFF_MODIFIER'
OR ModifierId = 'NAZGUL_BLACK_BREATH_AOE_NO_HEAL_1'
OR ModifierId = 'NAZGUL_BLACK_BREATH_AOE_NO_HEAL_2'
OR ModifierId = 'NAZGUL_BLACK_BREATH_AOE_NO_HEAL_3');

UPDATE ModifierArguments 
SET Value = 23
WHERE Name = 'Amount'
AND (ModifierId = 'NAZGUL_SCALING_CLASSICAL'
OR ModifierId = 'NAZGUL_SCALING_MEDIEVAL'
OR ModifierId = 'NAZGUL_SCALING_RENAISSANCE'
OR ModifierId = 'NAZGUL_SCALING_INDUSTRIAL'
OR ModifierId = 'NAZGUL_SCALING_ATOMIC'
OR ModifierId = 'NAZGUL_SCALING_MODERN'
OR ModifierId = 'NAZGUL_SCALING_INFORMATION');

UPDATE ModifierArguments 
SET Value = 19
WHERE ModifierId = 'MORGULBLADE_BONUS_VS_DAMAGED';


UPDATE ModifierArguments 
SET Value = 49
WHERE Name = 'Amount'
AND ModifierId = 'NAZGUL_HEAL_ON_KILL';

UPDATE ModifierArguments 
SET Value = 24
WHERE Name = 'Amount'
AND ModifierId = 'MORGUL_SORCERY_AOE_HEAL_ON_KILL_MODIFIER';

--Slaves to his will
UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'SAURON_CAPTURED_CITY_GRANT_ENVOY_MODIFIER';

---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_GOBLINS
---------------------------------------------------------
---------------------------------------------------------

--Hordes
UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND (ModifierId = 'COTR_GOBLINS_EXTRA_MEELE_UNIT'
OR ModifierId = 'COTR_GOBLINS_EXTRA_ANTICAV_UNIT'
OR ModifierId = 'COTR_GOBLINS_EXTRA_WARG_PACK');

--Marauder 20+3*10
UPDATE Units 
SET Combat = 28
WHERE UnitType = 'UNIT_MARAUDER';

UPDATE ModifierArguments 
SET Value = 300
WHERE Name = 'PercentDefeatedStrength'
AND ModifierId = 'COTR_MARAUDER_GOLD_KILLS_MODIFIER';

--Warg 35+1*10
UPDATE Units 
SET Combat = 38
WHERE UnitType = 'UNIT_WARG_PACK';

UPDATE ModifierArguments 
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'COTR_WARG_ANTI_CAVALRY_BONUS';

--Goblin Caves
UPDATE Buildings
SET Housing = 0
WHERE BuildingType = 'BUILDING_GOBLIN_CAVES';

UPDATE Building_YieldChanges
SET YieldChange = 3
WHERE YieldType = 'YIELD_PRODUCTION'
AND BuildingType = 'BUILDING_GOBLIN_CAVES';

UPDATE ModifierArguments 
SET Value = 165
WHERE Name = 'UnitProductionPercent'
AND (ModifierId = 'COTR_GOBLIN_CAVES_UNIT_FAITH'
OR ModifierId = 'COTR_GOBLIN_CAVES_UNIT_CULTURE');

--Azog
UPDATE ModifierArguments
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'COTR_AZOG_CITY_CAPTURE_AOE_STRENGTH_MODIFIER';

---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_DWARVES
---------------------------------------------------------
---------------------------------------------------------

--Smithing Quarters
UPDATE Districts
SET Cost = 8
WHERE DistrictType = 'DISTRICT_SMITHING_QUATERS';

--Forge Cost=175*120/175^3, Prod=2+1*3
UPDATE Buildings
SET Cost = 4
WHERE BuildingType = 'BUILDING_DWARVEN_FORGE';

UPDATE Building_YieldChanges
SET YieldChange = 5
WHERE BuildingType = 'BUILDING_DWARVEN_FORGE';

UPDATE Building_GreatPersonPoints
SET PointsPerTurn = 3
WHERE BuildingType = 'BUILDING_DWARVEN_FORGE'
AND GreatPersonClassType = 'GREAT_PERSON_CLASS_MERCHANT';

UPDATE District_CitizenYieldChanges
SET YieldChange = 6
WHERE DistrictType = 'DISTRICT_SMITHING_QUATERS'
AND YieldType = 'YIELD_GOLD';

--Guardian STR=36+2*10
UPDATE Units
SET Combat = 42 
WHERE UnitType = 'UNIT_GUARDIAN';

UPDATE ModifierArguments
SET Value = 10
WHERE Name = 'Amount'
AND ModifierId = 'COTR_GUARDIAN_HILL_AND_MOUNTAIN_COMBAT_BONUS';

--Durin
UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'DURIN_FREE_BUILDER';

--Dain
--Axethrower Cost=50+15*3, STR=15+f(10), ranged=25+f(5))
UPDATE Units
SET Cost = 95, Combat = 38 , RangedCombat = 38
WHERE UnitType = 'UNIT_AXETHROWER';

UPDATE ModifierArguments
SET Value = 300
WHERE Name = 'Percent'
AND ModifierId = 'COTR_MODIFIER_PLAYER_UNITS_ADJUST_SUPPORT_BONUS_MODIFIER';

--Thror
UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'Amount'
AND ModifierId = 'THROR_TRADE_ROUTE_INTERNATIONAL_GOLD';

UPDATE ModifierArguments
SET Value = 60
WHERE Name = 'Amount'
AND ModifierId = 'THROR_GOLD_FROM_MOUNTAIN_CITIES';

UPDATE Building_GreatWorks
SET NumSlots = 3
WHERE BuildingType = 'BUILDING_THRORRELICSLOT'
AND GreatWorkSlotType ='GREATWORKSLOT_PALACE';	

---------------------------------------------------------
---------------------------------------------------------
--JFD's Leader Packs
---------------------------------------------------------
---------------------------------------------------------

---------------------------------------------------------
--India
---------------------------------------------------------
--Ajatasattu: +29 Combat near 
UPDATE ModifierArguments
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'JFD_RELICS_BLESSED_COMBAT_VS_SAME_RELIGION_MODIFIER';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'JFD_RELICS_BLESSED_ONE_SHRINE_SLOTS';

---------------------------------------------------------
--Germany
---------------------------------------------------------

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId = 'JFD_NOBLE_ACADEMIES_%';

UPDATE ModifierArguments
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'JFD_LANDWEHR_COMBAT_BONUS';

UPDATE ModifierArguments
SET Value = 60
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_JFD_BLITZKRIEG_WAR_PRODUCTION';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_JFD_BLITZKRIEG_WAR_UNIT_MOVES';

UPDATE ModifierArguments
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'JFD_PANZER_COMBAT_BONUS';

---------------------------------------------------------
--France
---------------------------------------------------------

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND (ModifierId = 'JFD_FREE_FRANCE_GENERAL_MOVES'
OR ModifierId = 'JFD_FREE_FRANCE_GENERAL_POINTS_FROM_KILLS');

UPDATE ModifierArguments
SET Value = 17
WHERE Name = 'Amount'
AND ModifierId = 'JFD_CHAR_B1_DEFENDING_BONUS';

UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_JFD_SUN_KING_WONDER_CULTURE_MODIFIER';

--seems to be not implemented yet
UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_JFD_SUN_KING_WONDER_ENVOY';

/*
UPDATE Units
SET Maintenance = Maintenance + 20
WHERE UnitType = 'UNIT_JFD_VIEUX';
*/

UPDATE ModifierArguments
SET Value = 17
WHERE Name = 'Amount'
AND ModifierId = 'JFD_VIEUX_CITY_CENTRE_COMBAT';

---------------------------------------------------------
---------------------------------------------------------
-- Ms. Human from Humanity has Declined
---------------------------------------------------------
---------------------------------------------------------

UPDATE Buildings
SET Cost = 10
WHERE BuildingType='BUILDING_DESSERT_HOUSE';

UPDATE Districts
SET Cost = 7
WHERE DistrictType="DISTRICT_FAIRYCO";

UPDATE Building_YieldChanges
SET YieldChange=YieldChange*3
WHERE BuildingType="BUILDING_GODDESS_STATUE" AND YieldType="YIELD_FAITH";

UPDATE ModifierArguments
SET Value=Value*3
WHERE Name="Amount" AND ModifierId LIKE "BUILDING_DESSERT_HOUSE_DESSERT_%";

UPDATE ModifierArguments
SET Value=Value*3
WHERE Name="Amount" AND ModifierId LIKE "TRAIT_FAIRY_WONDER%";

UPDATE ModifierArguments
SET Value=Value*3
WHERE Name="Amount" AND ModifierId LIKE "TRAIT_FAIRY_DISTRICT%";

UPDATE ModifierArguments
SET Value=Value*3
WHERE Name="Amount" AND ModifierId LIKE "TRAIT_FAIRY_BUILDING_PRODUCTION%";

UPDATE ModifierArguments
SET Value=Value*3
WHERE Name="Amount" AND ModifierId LIKE "FAIRYCO_EXTRA%";

UPDATE Adjacency_YieldChanges
SET YieldChange = YieldChange*3
WHERE ID="Mine_Food";

UPDATE Adjacency_YieldChanges
SET YieldChange = YieldChange*3
WHERE ID="Quarry_Food";

UPDATE Adjacency_YieldChanges
SET YieldChange = YieldChange*3
WHERE ID="District_Food";

UPDATE Adjacency_YieldChanges
SET YieldChange = YieldChange*3
WHERE ID="FairyCo_CityCenter_Production";

UPDATE Adjacency_YieldChanges
SET YieldChange = YieldChange*3
WHERE ID="FairyCo_CityCenter_Food";

UPDATE District_TradeRouteYields
SET  YieldChangeAsOrigin=YieldChangeAsOrigin*3, YieldChangeAsDomesticDestination=(YieldChangeAsDomesticDestination-1)*3
WHERE DistrictType="DISTRICT_FAIRYCO" AND YieldType="YIELD_PRODUCTION" ;


UPDATE District_TradeRouteYields
SET  YieldChangeAsOrigin=YieldChangeAsOrigin*3, YieldChangeAsDomesticDestination=YieldChangeAsDomesticDestination*3
WHERE DistrictType="DISTRICT_FAIRYCO" AND YieldType="YIELD_FOOD" ;

UPDATE ModifierArguments
SET Value=Value*3
WHERE Name="Amount" AND ModifierId = "MSHUMAN_ADD_VISIBILITY";

UPDATE ModifierArguments
SET Value=Value*3
WHERE Name="Amount" AND ModifierId LIKE "PROJECT_FINISH_THE_FAIRIES_ADD_CHARGE%";
---------------------------------------------------------
---------------------------------------------------------
--Other modifications
---------------------------------------------------------
---------------------------------------------------------

--diplomatic civics for imanity, aragorn, greece   
INSERT INTO Policies (PolicyType, Name, Description, PrereqCivic, GovernmentSlotType)
VALUES
    ('POLICY_BLANK_DIPL_1', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_DIPLOMATIC' ),
    ('POLICY_BLANK_DIPL_2', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_DIPLOMATIC' ),
    ('POLICY_BLANK_DIPL_3', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_DIPLOMATIC' );
    
INSERT INTO Types (Type, Kind)
VALUES
    ('POLICY_BLANK_DIPL_1', 'KIND_POLICY'),
    ('POLICY_BLANK_DIPL_2', 'KIND_POLICY'),
    ('POLICY_BLANK_DIPL_3', 'KIND_POLICY');


---------------------------------------------------------
---------------------------------------------------------
-- Touhou: Palace of Earth Spirits 2095199648
---------------------------------------------------------
---------------------------------------------------------

UPDATE Building_YieldChanges
SET YieldChange = YieldChange * 3
WHERE BuildingType IN ('BUILDING_KOISHI_MARY_PHONE', 'BUILDING_KOMEIJI_RESOURSE_CENTER', 'BUILDING_KOMEIJI_NUCLEAR_FURNACE','BUILDING_KOMEIJI_POWER_CENTER');


UPDATE Building_GreatPersonPoints
SET PointsPerTurn = PointsPerTurn * 3
WHERE BuildingType IN ('BUILDING_KOMEIJI_RESOURSE_CENTER', 'BUILDING_KOMEIJI_NUCLEAR_FURNACE','BUILDING_KOMEIJI_POWER_CENTER');

UPDATE ModifierArguments
SET Value = 31
WHERE Name="Amount" AND ModifierId LIKE "SHA_OKUU_UNIT_GRANT_COMBAT%";

UPDATE ModifierArguments
SET Value = 23
WHERE Name="Amount" AND ModifierId LIKE "SHA_ORIN_GRANT_COMBAT_ATTACK_WOUNDED_UNIT_MODIFIER";

UPDATE ModifierArguments
SET Value = 6
WHERE Name="Amount" AND ModifierId LIKE "SHA_ORIN_GRANT_COMBAT_FROM_MOVEMENT_MODIFIER";




UPDATE ModifierArguments
SET Value=Value*3
WHERE Name="Amount" AND ModifierId IN ('Koishi_Increase_Spy_Level',
'SHA_KOISHI_ADD_SPY_UNIT',
'SHA_KOISHI_ADD_SPY_CAPACITY',
'Geyser_Amenity',
'Komeiji_Resourse_Center_Additional_Iron',
'Komeiji_Resourse_Center_Additional_Niter',
'Komeiji_Resourse_Center_Additional_Coal',
'Komeiji_Resourse_Center_Additional_Oil',
'Komeiji_Resourse_Center_Additional_Uranium',
'Komeiji_Resourse_Center_Grant_Mineral_Sakura',
'Komeiji_Project_Create_Nuclear_Device',
'Komeiji_Project_Create_Thermonuclear_Device',
'SHA_OKUU_INDUSTRIAL_ZONE_BUILDING_PRODUCTION',
'SHA_OKUU_INDUSTRIAL_ZONE_PRODUCTION',
'Okuu_Build_Komeiji_NUCLEAR_Device_Faster',
'Okuu_Build_NUCLEAR_Device_Faster',
'Okuu_Build_Komeiji_Thermonuclear_Device_Faster',
'Okuu_Build_Thermonuclear_Device_Faster',
'SHA_OKUU_UNIT_GRANT_MOVEMENT',
'Satori_Add_Visibility',
'Satori_Animal_Production_Bonus',
'SHA_ORIN_CITY_EMEMY_GRANT_DAMAGE',
'SHA_ORIN_CITY_ENEMY_GRANT_MOVEMENT_DEBUFF_MODIFIER',
'SHA_ORIN_ENGINEER_GRANT_MOVEMENT',
'SHA_ORIN_ENGINEER_GRANT_CHARGES',
"SHA_KOMEIJI_ENGINEER_MORE_CHARGES",-- imba patch
"SHA_KOMEIJI_PLOT_GRANT_PRODUCTION",
"SHA_KOMEIJI_PLOT_GRANT_SCIENCE",
"SHA_KOMEIJI_PLOT_GRANT_GOLD",
"SHA_ORIN_UNITS_GRANT_MOVEMENT_MODIFIER",
"SHA_ORIN_HEAVY_CAVALRY_GRANT_MOVEMENT",
"SHA_ORIN_BUILDER_GRANT_CHARGES"
); 

UPDATE Units 
SET Range = 14, BaseMoves = (BaseMoves-2)*3+2
Where UnitType = 'UNIT_OKUU_ROD_MASTER';

UPDATE Improvement_YieldChanges
SET YieldChange = YieldChange * 3
WHERE ImprovementType = 'IMPROVEMENT_GEYSER';

UPDATE Adjacency_YieldChanges
SET YieldChange = YieldChange * 3
WHERE ID = 'Geyser_Science';

UPDATE District_CitizenYieldChanges
SET YieldChange = 14
WHERE DistrictType = 'DISTRICT_HELL_OF_BLAZING_FIRES';

---------------------------------------------------------
---------------------------------------------------------
-- 2677539335 Garden of the sun
---------------------------------------------------------
---------------------------------------------------------
UPDATE ModifierArguments
SET Value=Value*3
WHERE Name="Amount" AND ModifierId IN ('GARDEN_OF_THE_SUN_ABILITY01',
'TRAIT_LEADER_KAZAMI_YUKA_ABILITY03',
'TRAIT_LEADER_KAZAMI_YUKA_ABILITY04',
'TRAIT_LEADER_KAZAMI_YUKA_ABILITY05',
'LEADER_KAZAMI_YUKA_ABILITY01',
'LEADER_KAZAMI_YUKA_ABILITY02',
'LEADER_KAZAMI_YUKA_ABILITY03',
'PROJECT_COMPLEATE_THREE_01',
'PROJECT_COMPLEATE_THREE_02',
'PROJECT_COMPLEATE_THREE_03',
'PROJECT_ONE_FLOWER_S_LIAVABILITY_MF',
'PROJECT_ONE_PRODUCTION_OF_FIELDE_MF',
'PROJECT_ONE_PRODUCTION_OF_FIELDE_MF_02',
'PROJECT_ONE_MOV_ADD_MF',
'PROJECT_TWO_STR_ADD_MF',
'PROJECT_HEALTH_PER_TURN_ADD_MF',
'PROJECT_THREE_TRUE_WEAPON_MF',
'PROJECT_THREE_PEOPLE_S_DREAM_MF'
);

UPDATE ModifierArguments
Set Value = 17
WHERE Name="Amount" AND ModifierId = 'GARDEN_OF_THE_SUN_ABILITY03';

UPDATE ModifierArguments
Set Value = 51
WHERE Name="Amount" AND ModifierId = 'PROJECT_THREE_TRUE_WEAPON_MF';

UPDATE ModifierArguments
Set Value = 18
WHERE Name="Amount" AND ModifierId = 'PROJECT_TWO_STR_ADD_MF';

UPDATE Buildings
SET Cost = 39, Housing = Housing * 3, Entertainment = Entertainment * 3, RegionalRange = RegionalRange * 3
WHERE BuildingType = 'BUILDING_THE_SEA_OF_FLOWER';


UPDATE Building_YieldChanges
SET YieldChange = YieldChange * 3
WHERE BuildingType IN ('BUILDING_THE_SEA_OF_FLOWER', 'BUILDING_HALF_POWER', 'BUILDING_FULL_POWER');

UPDATE Adjacency_YieldChanges
SET YieldChange = YieldChange * 3
WHERE ID LIKE 'POWER_INSTITUTE_%' or ID = 'POWER_IMPROVEMENT_FLOWER_FIELD_Faith' or ID LIKE 'IMPROVEMENT_FLOWER_FIELD_%';

UPDATE District_TradeRouteYields
SET  YieldChangeAsOrigin=YieldChangeAsOrigin*3, YieldChangeAsDomesticDestination=YieldChangeAsDomesticDestination*3
WHERE DistrictType="DISTRICT_THE_POWER_INSTITUTE";

UPDATE District_CitizenYieldChanges
SET YieldChange = YieldChange * 3
WHERE DistrictType = 'DISTRICT_THE_POWER_INSTITUTE';

UPDATE District_GreatPersonPoints
SET PointsPerTurn = 3
WHERE DistrictType = 'DISTRICT_THE_POWER_INSTITUTE';

UPDATE Improvement_YieldChanges
SET YieldChange = YieldChange * 3
WHERE ImprovementType = 'IMPROVEMENT_FLOWER_FIELD';

UPDATE Improvements
Set Housing = Housing * 3
WHERE ImprovementType = 'IMPROVEMENT_FLOWER_FIELD';

UPDATE Units
SET Cost =11 , BaseMoves = 5 , BaseSightRange = 5, BuildCharges = 6
WHERE UnitType = 'UNIT_FLOWERMAKER';

-- INSERT INTO Modifiers (ModifierId, ModifierType, Permanent, SubjectRequirementSetId)
-- VALUES
-- 	('PROJECT_TWO_INT_ADD_MF_1' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_GOTS_PROJECT01', 1, 'REQ_LEADER_TYHT_FILL'),
-- 	('PROJECT_TWO_INT_ADD_MF_2' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_GOTS_PROJECT01', 1, 'REQ_LEADER_TYHT_FILL'),
-- 	('PROJECT_TWO_INT_ADD_MF_3' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_GOTS_PROJECT01', 1, 'REQ_LEADER_TYHT_FILL'),
-- 	('PROJECT_TWO_INT_ADD_MF_4' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_GOTS_PROJECT01', 1, 'REQ_LEADER_TYHT_FILL'),
-- 	('PROJECT_TWO_INT_ADD_MF_5' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_GOTS_PROJECT01', 1, 'REQ_LEADER_TYHT_FILL'),
-- 	('PROJECT_TWO_INT_ADD_MF_6' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_GOTS_PROJECT01', 1, 'REQ_LEADER_TYHT_FILL'),
-- 	('PROJECT_TWO_INT_ADD_MF_7' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_GOTS_PROJECT01', 1, 'REQ_LEADER_TYHT_FILL'),
-- 	('PROJECT_TWO_INT_ADD_MF_8' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_GOTS_PROJECT01', 1, 'REQ_LEADER_TYHT_FILL'),
-- 	('PROJECT_TWO_INT_ADD_MF_9' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_GOTS_PROJECT01', 1, 'REQ_LEADER_TYHT_FILL');
	

-- INSERT INTO ModifierArguments (ModifierId, Name, Value)
-- VALUES
-- 	('PROJECT_TWO_INT_ADD_MF_1' , 'GovernmentSlotType' , 'SLOT_WILDCARD' ),
-- 	('PROJECT_TWO_INT_ADD_MF_2' , 'GovernmentSlotType' , 'SLOT_WILDCARD' ),
-- 	('PROJECT_TWO_INT_ADD_MF_3' , 'GovernmentSlotType' , 'SLOT_WILDCARD' ),
-- 	('PROJECT_TWO_INT_ADD_MF_4' , 'GovernmentSlotType' , 'SLOT_WILDCARD' ),
-- 	('PROJECT_TWO_INT_ADD_MF_5' , 'GovernmentSlotType' , 'SLOT_WILDCARD' ),
-- 	('PROJECT_TWO_INT_ADD_MF_6' , 'GovernmentSlotType' , 'SLOT_WILDCARD' ),
-- 	('PROJECT_TWO_INT_ADD_MF_7' , 'GovernmentSlotType' , 'SLOT_WILDCARD' ),
-- 	('PROJECT_TWO_INT_ADD_MF_8' , 'GovernmentSlotType' , 'SLOT_WILDCARD' ),
-- 	('PROJECT_TWO_INT_ADD_MF_9' , 'GovernmentSlotType' , 'SLOT_WILDCARD' );

-- insert into ProjectCompletionModifiers (ProjectType,ModifierId)
-- VALUES
-- 	(PROJECT_TWO_INT_ADD_01, 'PROJECT_TWO_INT_ADD_MF_1'),
-- 	(PROJECT_TWO_INT_ADD_01, 'PROJECT_TWO_INT_ADD_MF_2'),
-- 	(PROJECT_TWO_INT_ADD_01, 'PROJECT_TWO_INT_ADD_MF_3'),
-- 	(PROJECT_TWO_INT_ADD_01, 'PROJECT_TWO_INT_ADD_MF_4'),
-- 	(PROJECT_TWO_INT_ADD_01, 'PROJECT_TWO_INT_ADD_MF_5'),
-- 	(PROJECT_TWO_INT_ADD_01, 'PROJECT_TWO_INT_ADD_MF_6'),
-- 	(PROJECT_TWO_INT_ADD_01, 'PROJECT_TWO_INT_ADD_MF_7'),
-- 	(PROJECT_TWO_INT_ADD_01, 'PROJECT_TWO_INT_ADD_MF_8'),
-- 	(PROJECT_TWO_INT_ADD_01, 'PROJECT_TWO_INT_ADD_MF_9'),
-- 	(PROJECT_TWO_INT_ADD_02, 'PROJECT_TWO_INT_ADD_MF_1'),
-- 	(PROJECT_TWO_INT_ADD_02, 'PROJECT_TWO_INT_ADD_MF_2'),
-- 	(PROJECT_TWO_INT_ADD_02, 'PROJECT_TWO_INT_ADD_MF_3'),
-- 	(PROJECT_TWO_INT_ADD_02, 'PROJECT_TWO_INT_ADD_MF_4'),
-- 	(PROJECT_TWO_INT_ADD_02, 'PROJECT_TWO_INT_ADD_MF_5'),
-- 	(PROJECT_TWO_INT_ADD_02, 'PROJECT_TWO_INT_ADD_MF_6'),
-- 	(PROJECT_TWO_INT_ADD_02, 'PROJECT_TWO_INT_ADD_MF_7'),
-- 	(PROJECT_TWO_INT_ADD_02, 'PROJECT_TWO_INT_ADD_MF_8'),
-- 	(PROJECT_TWO_INT_ADD_02, 'PROJECT_TWO_INT_ADD_MF_9');

	---------------------------------------------------------
---------------------------------------------------------
-- 2694815642 WA2
---------------------------------------------------------
---------------------------------------------------------

UPDATE ModifierArguments
SET Value=Value*3
WHERE Name IN ("Amount","ScalingFactor") AND ModifierId IN (
	"MODIFIER_KAZUSA_TUNDRA_CULTURE",
	"MODIFIER_KAZUSA_MUSIC_SLOT",
	"MODIFIER_KAZUSA_MUSIC_BONUS",
	"MODIFIER_KAZUSA_CITY_MUSICIAN",
	"MODIFIER_KAZUSA_MUSIC_TOURISM",
	"MODIFIER_KAZUSA_AMPHITHEATER",
	"MODIFIER_KAZUSA_APPEAL",
	"MODIFIER_WA2_CAMPUS_CULTURE1",
	"MODIFIER_WA2_CAMPUS_CULTURE2",
	"MODIFIER_WA2_CAMPUS_CULTURE3",
	"MODIFIER_WA2_THEATER_SCIENCE1",
	"MODIFIER_WA2_THEATER_SCIENCE2",
	"MODIFIER_WA2_THEATER_SCIENCE3",
	"MODIFIER_WA2_THEATER_SCIENCE4",
	"MODIFIER_WA2_ADD_TRADE_ROUTE",
	"MODIFIER_WA2_TEST",
	"MODIFIER_WA2_TEST1",
	"MODIFIER_WA2_TUNDRA_FOOD1",
	"MODIFIER_WA2_TUNDRA_FOOD2",
	"MODIFIER_WA2_TUNDRA_PRODUCTION1",
	"MODIFIER_WA2_TUNDRA_ADJCENCY1",
	"MODIFIER_WA2_TUNDRA_ADJCENCY2",
	"MODIFIER_WA2_FRANCE_ABILITY1",
	"MODIFIER_WA2_FRANCE_ABILITY2",
	"MODIFIER_WA2_FRANCE_ABILITY3",
	"MODIFIER_WA2_FRANCE_ABILITY4",
	"MODIFIER_SETSUNA_TUNDRA_FAITH",
	"MODIFIER_SETSUNA_SPREAD_RELIGION",
	"MODIFIER_SETSUNA_RELIGION_CHATGES",
	"MODIFIER_SETSUNA_RELIGION_PRODUCTION",
	"MODIFIER_SETSUNA_REDUCE_GRIEVANCE",
	"MODIFIER_SETSUNA_LOYALTY1",
	"MODIFIER_SETSUNA_LOYALTY2",
	"MODIFIER_SETSUNA_LOYALTY3",
	"MODIFIER_SETSUNA_CITY_PROPHET",
	"MODIFIER_SETSUNA_SHRINE",
	"MODIFIER_SETSUNA_RELIC_SLOT",
	"MODIFIER_COLD_STREET_ENVOY",
	"MODIFIER_COLD_STREET_TOURISM",
	"MODIFIER_COLD_STREET_TOURISM_CLASSIC",
	"MODIFIER_COLD_STREET_TOURISM_ANCIENT",
	"MODIFIER_COLD_STREET_TOURISM_MEDIUM",
	"MODIFIER_COLD_STREET_TOURISM_MODERN",
	"MODIFIER_COLD_STREET_TOURISM_RENAISSANCE",
	"MODIFIER_COLD_STREET_TOURISM_INDUSTRIAL",
	"MODIFIER_COLD_STREET_TOURISM_ATOMIC",
	"MODIFIER_COLD_STREET_TOURISM_INFORMATION",
	"MODIFIER_COLD_STREET_TOURISM_FUTURE",
	"MODIFIER_HOTEL_TUNDRA_GOLD",
	"MODIFIER_HOTEL_POPULATION_GOLD",
	"MODIFIER_FENGCHENG_MISS_TOURISM",
	"MODIFIER_HOTEL_GRAND_FAITH"
);

UPDATE ModifierArguments
SET Value=Value*3
WHERE Name IN ("Amount","ScalingFactor") AND ModifierId LIKE "MODIFIER_HARUKI%" AND ModifierId <> "MODIFIER_HARUKI_CRAZY";

UPDATE Buildings
SET  Housing = Housing * 3
WHERE BuildingType IN ('BUILDING_COLD_STREET','BUILDING_THERMAL_HOTEL');

UPDATE Buildings
SET  Entertainment =4
WHERE BuildingType IN ('BUILDING_THERMAL_HOTEL');

UPDATE Building_YieldChanges
SET YieldChange = 5
WHERE BuildingType = 'BUILDING_COLD_STREET';

UPDATE Adjacency_YieldChanges
SET  YieldChange = YieldChange * 3
WHERE ID LIKE 'Tundra_Science%';

UPDATE District_GreatPersonPoints
SET PointsPerTurn = 3
WHERE DistrictType = 'DISTRICT_FENGCHENG' AND GreatPersonClassType IN ("GREAT_PERSON_CLASS_ARTIST","GREAT_PERSON_CLASS_PROPHET");



---------------------------------------------------------
---------------------------------------------------------
-- 2113314311 Reisen Inaba
---------------------------------------------------------
---------------------------------------------------------

UPDATE Building_YieldChanges
SET YieldChange = 4
WHERE BuildingType IN ( 'BUILDING_RABBIT_LAB', 'BUILDING_TANK_LAB') and YieldType="YIELD_PRODUCTION" ;

UPDATE Building_YieldChanges
SET YieldChange = YieldChange * 3
WHERE BuildingType IN ( 'BUILDING_RABBIT_LAB', 'BUILDING_TANK_LAB') and YieldType="YIELD_SCIENCE" ;

update Districts
set Cost = 0.052734375, Entertainment="10"
where DistrictType="DISTRICT_UDONGEIN";

update Adjacency_YieldChanges
set YieldChange = YieldChange * 3
where ID in ("UNaturalWonder_Culture", "UWonder_Faith", "UWonder_Culture", "UCampus_Faith", "UU_Faith");

update Adjacency_YieldChanges
set YieldChange = 10, TilesRequired="2"
where ID in ("UForest_Faith");

update District_GreatPersonPoints
set PointsPerTurn = PointsPerTurn*3
where  DistrictType="DISTRICT_UDONGEIN" and GreatPersonClassType in ("GREAT_PERSON_CLASS_ARTIST", "GREAT_PERSON_CLASS_MUSICIAN");

update District_CitizenYieldChanges
set YieldChange=YieldChange*3
where DistrictType="DISTRICT_UDONGEIN" and YieldType="YIELD_CULTURE";

update District_CitizenYieldChanges
set YieldChange=5
where DistrictType="DISTRICT_UDONGEIN" and YieldType="YIELD_FAITH";

update District_TradeRouteYields
set YieldChangeAsDomesticDestination = YieldChangeAsDomesticDestination *3
where DistrictType="DISTRICT_UDONGEIN" and  YieldType in ("YIELD_PRODUCTION", "YIELD_FAITH");

update ModifierArguments
set Value = Value*3
WHERE Name = 'Amount'
AND ModifierId = 'BAMBOOFOREST_ADJ%';


update ModifierArguments
set Value = Value*3
WHERE Name = 'Amount'
AND ModifierId in ("INABA_REACH_MOON_BOOST", 
"RABBIT_LAB_ADJUST_MOVEMENT",
"KUNS_INABA_JUNYING_PROBUFF");

update ModifierArguments
set Value = 10
WHERE Name = 'Amount' and ModifierId = "TANK_LAB_ADJUST_MORE_COMBAT";

update ModifierArguments
set Value = -13
WHERE Name = 'Amount' and ModifierId = "REISEN_INABA_LOW_ENEMY_COMBAT_MODIFIER";


update ModifierArguments
set Value = 15
WHERE Name = 'Amount' and ModifierId = "INABA_ALL_UNITS_MORE_COMBAT_WHEN_ATTACKING";


update Units
set BaseMoves=5,Maintenance = 0,Cost=212
WHERE UnitType="UNIT_LUNATIC_MOONRABBIT";



---------------------------------------------------------
---------------------------------------------------------
-- Flandre Scarlet 2842795323
---------------------------------------------------------
---------------------------------------------------------



UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId like 'MODIFIER_GOVERNOR_THE_FLANDRE_SCARLET_TANSHOU_FOUR_PROMOTION_LEFT_THREE%';

update ModifierArguments
set Value = Value*3
where Name = 'Amount'
and ModifierId like 'MODIFIER_BUILDING_FLANDRE_SCARLET_TANSHOU_RED_SETTING%';

update ModifierArguments
set Value = 13 --from 5
where Name = 'Amount'
and ModifierId in (
	'MODIFIER_DISTRICT_FLANDRE_SCARLET_TANSHOU_RED_SETTING_FOR_OWN_UNIT_STR',
	'MODIFIER_BUILDING_FLANDRE_SCARLET_TANSHOU_RED_SETTING_SUPER_GOING_GET_MORE_STR'
	);

update RequirementArguments
set Value = Value*3
where Name = 'MaxDistance'
and RequirementId in ('ADJ_TO_DISTRICT_FLANDRE_SCARLET_TANSHOU_RED_SETTING_FOR_COMBAT_FILL',
'BUILDING_FLANDRE_SCARLET_TANSHOU_RED_SETTING_SUPER_GOING_IS_OWN_SMALL_FILL',
'BUILDING_FLANDRE_SCARLET_TANSHOU_RED_SETTING_SUPER_ENTERTAINMENT_ALL_ADJ',
'BUILDING_FLANDRE_SCARLET_TANSHOU_RED_SETTING_SUPER_GOING_GET_MORE_M_STR_FILL');


update RequirementArguments
set Value = (Value-1)*3+1
where Name = 'MinDistance'
and RequirementId = 'BUILDING_FLANDRE_SCARLET_TANSHOU_RED_SETTING_SUPER_GOING_GET_MORE_M_STR_FILL';

UPDATE ModifierArguments
SET Value = -95
WHERE Name = 'Amount'
AND ModifierId =	'MODIFIER_GOVERNOR_THE_FLANDRE_SCARLET_TANSHOU_FOUR_PROMOTION_LEFT_TWO_COST_LESS_PLOT';

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId in 
(
	'MODIFIER_GOVERNOR_THE_FLANDRE_SCARLET_TANSHOU_FOUR_PROMOTION_LEFT_ONE',
	'MODIFIER_GOVERNOR_THE_FLANDRE_SCARLET_TANSHOU_FOUR_PROMOTION_LEFT_TWO_COST_LESS',
	'MODIFIER_GOVERNOR_THE_FLANDRE_SCARLET_TANSHOU_FOUR_PROMOTION_RIGHT_TWO_GOLD_LESS',
	'MODIFIER_GOVERNOR_THE_FLANDRE_SCARLET_TANSHOU_FOUR_PROMOTION_RIGHT_THREE_PEOPLE_PRODUCTION',
	'MODIFIER_GOVERNOR_THE_FLANDRE_SCARLET_TANSHOU_FOUR_PROMOTION_RIGHT_THREE_PRODUCT_UNIT_ADD_01',
	'MODIFIER_GOVERNOR_THE_FLANDRE_SCARLET_TANSHOU_FOUR_PROMOTION_RIGHT_THREE_PRODUCT_UNIT_ADD_02',
	'MODIFIER_GOVERNOR_THE_FLANDRE_SCARLET_TANSHOU_FOUR_PROMOTION_RIGHT_THREE_PRODUCT_UNIT_ADD_03',
	'MODIFIER_GOVERNOR_THE_FLANDRE_SCARLET_TANSHOU_FOUR_PROMOTION_RIGHT_THREE_PRODUCT_UNIT_ADD_04',
	'MODIFIER_GOVERNOR_THE_FLANDRE_SCARLET_TANSHOU_FOUR_PROMOTION_RIGHT_THREE_PRODUCT_UNIT_ADD_05',
	'MODIFIER_GOVERNOR_THE_FLANDRE_SCARLET_TANSHOU_FOUR_PROMOTION_RIGHT_THREE_PRODUCT_UNIT_ADD_06',
	'MODIFIER_GOVERNOR_THE_FLANDRE_SCARLET_TANSHOU_FOUR_PROMOTION_RIGHT_THREE_PRODUCT_UNIT_ADD_07',
	'MODIFIER_GOVERNOR_THE_FLANDRE_SCARLET_TANSHOU_FOUR_PROMOTION_RIGHT_THREE_PRODUCT_UNIT_ADD_08',
	'MODIFIER_GOVERNOR_THE_FLANDRE_SCARLET_TANSHOU_FOUR_PROMOTION_RIGHT_THREE_PRODUCT_UNIT_ADD_09',
	'TRAIT_LEADER_TANSHOU_FLANDRE_SCARLET_ABILITIES_GET_SETTLERS_01',
	'TRAIT_LEADER_TANSHOU_FLANDRE_SCARLET_ABILITIES_GET_SETTLERS_02',
	'TRAIT_LEADER_TANSHOU_FLANDRE_SCARLET_ABILITIES_GET_SETTLERS_03',
	'TRAIT_LEADER_TANSHOU_FLANDRE_SCARLET_ABILITIES_GET_SETTLERS_04',
	'TRAIT_LEADER_TANSHOU_FLANDRE_SCARLET_FLANDRE_ENGINEER_999',
	'TRAIT_LEADER_TANSHOU_UNIT_FLANDRE_SCARLET_TANSHOU_SUPER_UNIT_FLAME_OF_ENDWORLD',
	'MODIFIER_POLICY_FLANDRE_SCARLET_TANSHOU_RED_SETTING_YIELD_01',
	'MODIFIER_POLICY_FLANDRE_SCARLET_TANSHOU_RED_SETTING_YIELD_02',
	'MODIFIER_POLICY_FLANDRE_SCARLET_TANSHOU_RED_SETTING_YIELD_03',
	'MODIFIER_POLICY_FLANDRE_SCARLET_TANSHOU_RED_SETTING_BUILD_SPEED',
	'MODIFIER_ABILITY_UNIT_FLANDRE_SCARLET_TANSHOU_GOVERNOR_UPDATE_STR',
	'MODIFIER_ABILITY_UNIT_FLANDRE_SCARLET_TANSHOU_CIV_MOVEMENT',
	'MODIFIER_ABILITY_UNIT_FLANDRE_SCARLET_TANSHOU_CIV_GET_HEART_FROM_COMBAT_VICTORY',
	'MODIFIER_PROMOTION_CLASS_FLANDRE_SCARLET_TANSHOU_SUPER_UNIT_FLAME_OF_ENDWORLD_LEFT_03',
	'MODIFIER_PROMOTION_CLASS_FLANDRE_SCARLET_TANSHOU_SUPER_UNIT_FLAME_OF_ENDWORLD_RIGHT_01',
	'MODIFIER_PROMOTION_CLASS_FLANDRE_SCARLET_TANSHOU_SUPER_UNIT_FLAME_OF_ENDWORLD_ENDING_01_ATTACK_CHANCE',
	'MODIFIER_DISTRICT_FLANDRE_SCARLET_TANSHOU_RED_SETTING_FOR_OWN_UNIT_MOV',
	'MODIFIER_DISTRICT_FLANDRE_SCARLET_TANSHOU_RED_SETTING_FOR_OWN_CITY_YIELD_S',
	'MODIFIER_BUILDING_FLANDRE_SCARLET_TANSHOU_RED_SETTING_SUPER_GOING_MOV_TO_OWN',
	'MODIFIER_BUILDING_FLANDRE_SCARLET_TANSHOU_RED_SETTING_SUPER_GOING_HAPPY_TO_MINE',
	'MODIFIER_BUILDING_FLANDRE_SCARLET_TANSHOU_RED_SETTING_SUPER_GOING_HAPPY_TO_MINE_TWO',
	'MODIFIER_BUILDING_FLANDRE_SCARLET_TANSHOU_RED_SETTING_SUPER_GOING_HAPPY_TO_OTHER'

);


UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
and ModifierId like "TRAIT_LEADER_TANSHOU_FLANDRE_SCARLET_ABILITIES_CITYCENTER_YIELD%";

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
and ModifierId like "TRAIT_LEADER_TANSHOU_FLANDRE_SCARLET_ABILITIES_IMPROVEMENT_YIELD%";


UPDATE ModifierArguments
SET Value = 17 -- from 7
WHERE Name = 'Amount'
and ModifierId in (
	'MODIFIER_PROMOTION_CLASS_FLANDRE_SCARLET_TANSHOU_SUPER_UNIT_FLAME_OF_ENDWORLD_LEFT_01',
	'MODIFIER_PROMOTION_CLASS_FLANDRE_SCARLET_TANSHOU_SUPER_UNIT_FLAME_OF_ENDWORLD_ENDING_STR_ADD_YES'
	);


UPDATE ModifierArguments
SET Value = 15 -- from 6
WHERE Name = 'Amount'
and ModifierId in (
	'MODIFIER_ABILITY_UNIT_FLANDRE_SCARLET_TANSHOU_GOVERNOR_UPDATE_STR',
	'MODIFIER_ABILITY_UNIT_FLANDRE_SCARLET_TANSHOU_SUPER_UNIT_FLAME_OF_ENDWORLD_STR_ADD_HERO'
);


UPDATE ModifierArguments
SET Value = 8 -- from 3
WHERE Name = 'Amount'
and ModifierId in (
	'MODIFIER_ABILITY_UNIT_FLANDRE_SCARLET_TANSHOU_CIV_COMBAT_STRENGTH',
	'MODIFIER_ABILITY_UNIT_FLANDRE_SCARLET_TANSHOU_CIV_IF_ENEMY_IS_HURT_ADD_STR'
);

UPDATE AdJacency_YieldChanges
SET YieldChange = YieldChange * 3
WHERE ID like 'DISTRICT_FLANDRE_SCARLET_TANSHOU_RED_SETTING%';


UPDATE District_GreatPersonPoints
Set PointsPerTurn = PointsPerTurn* 3
WHERE DistrictType="DISTRICT_FLANDRE_SCARLET_TANSHOU_RED_SETTING";


UPDATE District_CitizenYieldChanges
SET YieldChange = YieldChange * 3
where DistrictType = 'DISTRICT_FLANDRE_SCARLET_TANSHOU_RED_SETTING'; 

update District_TradeRouteYields
set YieldChangeAsOrigin = YieldChangeAsOrigin * 3, YieldChangeAsDomesticDestination = YieldChangeAsDomesticDestination *3
where DistrictType = 'DISTRICT_FLANDRE_SCARLET_TANSHOU_RED_SETTING';

update Districts
set Entertainment = Entertainment *3, CitizenSlots = CitizenSlots * 3
where DistrictType = 'DISTRICT_FLANDRE_SCARLET_TANSHOU_RED_SETTING';

update Buildings
set  CitizenSlots = CitizenSlots * 3
where BuildingType = 'BUILDING_FLANDRE_SCARLET_TANSHOU_RED_SETTING_SUPER_GOING';

update Units
set BaseMoves = 5, BaseSightRange = 8
where UnitType="UNIT_FLANDRE_SCARLET_TANSHOU_SUPER_UNIT_FLAME_OF_ENDWORLD";


UPDATE AdJacency_YieldChanges
SET YieldChange = YieldChange * 3
WHERE ID like 'DISTRICT_FLANDRE_SCARLET_TANSHOU_RED_SETTING%';